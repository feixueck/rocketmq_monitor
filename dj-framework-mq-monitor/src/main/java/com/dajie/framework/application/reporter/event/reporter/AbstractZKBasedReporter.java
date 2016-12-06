package com.dajie.framework.application.reporter.event.reporter;

import com.dajie.framework.application.reporter.event.model.MQInfo;
import com.dajie.framework.application.reporter.event.reporter.util.ZKCuratorUtil;
import org.apache.curator.framework.CuratorFramework;
import org.apache.zookeeper.CreateMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

/**
 * Created by yanan.sun on 2016/9/19.
 */
abstract class AbstractZKBasedReporter {
    private static final Logger LOGGER = LoggerFactory.getLogger(AbstractZKBasedReporter.class);
    private final Set<String> paths = new HashSet<String>();
    private static final Object LOCK = new Object();

    public void report(final MQInfo mqInfo) {
        final CuratorFramework curatorFramework = ZKCuratorUtil.getCuratorFramework();
        String path = getPath(mqInfo);
        byte[] data = getData(mqInfo);
        try {
            synchronized (LOCK) {
                if (curatorFramework.checkExists().forPath(path) != null) {
                    byte[] zkData = curatorFramework.getData().forPath(path);
                    if (Arrays.equals(data, zkData)) {
                        LOGGER.info("data not change, break.");
                        return;
                    }
                    curatorFramework.setData().forPath(path, data);
                    return;
                }
                curatorFramework.create().creatingParentsIfNeeded().withMode(CreateMode.EPHEMERAL).forPath(path, data);
                LOGGER.info("success to report {} to {}", path, path);
                this.paths.add(path);
            }
        } catch (Exception e) {
            LOGGER.error("failed to report logger meta data", e);
        }
    }

    protected abstract byte[] getData(MQInfo mqInfo);

    public void clean() {
        CuratorFramework curatorFramework = ZKCuratorUtil.getCuratorFramework();
        for (String path : this.paths) {
            try {
                curatorFramework.delete().guaranteed().forPath(path);
                LOGGER.info("success to delete meta data node {}.", path);
            } catch (Exception e) {
                LOGGER.error("failed to clean logger meta data", e);
            }
        }
    }

    protected abstract String getPath(MQInfo MQInfo);
}
