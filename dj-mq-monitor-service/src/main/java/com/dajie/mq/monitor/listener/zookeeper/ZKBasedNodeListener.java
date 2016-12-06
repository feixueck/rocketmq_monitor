package com.dajie.mq.monitor.listener.zookeeper;

import com.dajie.common.config.AppConfigs;
import com.dajie.framework.application.reporter.event.reporter.util.ZKCuratorUtil;
import org.apache.commons.lang3.concurrent.BasicThreadFactory;
import org.apache.curator.framework.CuratorFramework;
import org.apache.curator.framework.CuratorFrameworkFactory;
import org.apache.curator.framework.recipes.cache.PathChildrenCache;
import org.apache.curator.framework.recipes.cache.PathChildrenCacheEvent;
import org.apache.curator.framework.recipes.cache.PathChildrenCacheListener;
import org.apache.curator.retry.ExponentialBackoffRetry;
import org.apache.curator.utils.CloseableUtils;
import org.apache.curator.utils.ZKPaths;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.LinkedBlockingDeque;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/**
 * Created by yanan.sun on 2016/10/8.
 */
public abstract class ZKBasedNodeListener {
    private static final Logger LOGGER = LoggerFactory.getLogger(ZKBasedNodeListener.class);
    private static String zkServer = AppConfigs.getInstance().get("mq.monitor.zkserver");
    private static final CuratorFramework client = CuratorFrameworkFactory.newClient(zkServer, new ExponentialBackoffRetry(1000, 3));
    private static final PathChildrenCache cache = new PathChildrenCache(client, ZKCuratorUtil.PATH, true);
    private static final ExecutorService EXECUTOR_SERVICE = new ThreadPoolExecutor(10, 30, 0L, TimeUnit.MILLISECONDS,
            new LinkedBlockingDeque<Runnable>(10000),
            new BasicThreadFactory.Builder()
                    .daemon(true)
                    .namingPattern("sync-mq-info-%d")
                    .uncaughtExceptionHandler(new Thread.UncaughtExceptionHandler() {
                        @Override
                        public void uncaughtException(Thread t, Throwable e) {
                            LOGGER.warn("error occurs");
                        }
                    }).build(),
            new ThreadPoolExecutor.CallerRunsPolicy());

    public void start() {
        LOGGER.info("start to listen server {}",zkServer);
        try {
            client.start();
            cache.start();
            addListener(cache);
        } catch (Exception e) {
            LOGGER.error("error occurs {}", e);
        }
    }
    private void addListener(PathChildrenCache cache) {
        PathChildrenCacheListener listener = new PathChildrenCacheListener() {
            @Override
            public void childEvent(CuratorFramework client, PathChildrenCacheEvent event) throws Exception {
                final String path = ZKPaths.getNodeFromPath(event.getData().getPath());
                final byte[] data = event.getData().getData();
                switch (event.getType()) {
                    case CHILD_ADDED: {
                        LOGGER.info("Node added: " + path);
                        EXECUTOR_SERVICE.execute(new Runnable() {
                            @Override
                            public void run() {
                                publishAdded(path, data);
                            }
                        });
                        break;
                    }
                    case CHILD_UPDATED: {
                        LOGGER.info("Node changed: " + ZKPaths.getNodeFromPath(event.getData().getPath()));
                        EXECUTOR_SERVICE.execute(new Runnable() {
                            @Override
                            public void run() {
                                publishUpdated(path, data);
                            }
                        });
                        break;
                    }
                    case CHILD_REMOVED: {
                        LOGGER.info("Node removed: " + ZKPaths.getNodeFromPath(event.getData().getPath()));
                        EXECUTOR_SERVICE.execute(new Runnable() {
                            @Override
                            public void run() {
                                publishRemoved(path, data);
                            }
                        });
                        break;
                    }
                }
            }
        };
        cache.getListenable().addListener(listener);
    }

    protected abstract void publishRemoved(String path, byte[] data);

    protected abstract void publishUpdated(String path, byte[] data);

    abstract void publishAdded(String path, byte[] data);

    public void shutdown() {
        CloseableUtils.closeQuietly(cache);
        CloseableUtils.closeQuietly(client);
    }

}
