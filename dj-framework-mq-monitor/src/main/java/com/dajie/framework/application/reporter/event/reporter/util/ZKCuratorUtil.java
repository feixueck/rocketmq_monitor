package com.dajie.framework.application.reporter.event.reporter.util;

import com.dajie.common.config.AppConfigs;
import org.apache.curator.framework.CuratorFramework;
import org.apache.curator.framework.CuratorFrameworkFactory;
import org.apache.curator.retry.ExponentialBackoffRetry;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Created by yanan.sun on 2016/9/19.
 */
public class ZKCuratorUtil {
    private static final Logger LOGGER = LoggerFactory.getLogger(ZKCuratorUtil.class);
    public static final String PATH = "/mq_monitor";
    private static String zkServer = AppConfigs.getInstance().get("mq.monitor.zkserver");
    private static final Object LOCK = new Object();
    private static CuratorFramework curatorFramework = null;

    public static CuratorFramework getCuratorFramework(){
        synchronized (LOCK){
            if(curatorFramework == null){
                curatorFramework = new ZKCuratorUtil().getCuratorFramework();
            }
        }
        return curatorFramework;
    }

    private ZKCuratorUtil() {
        //this.zkAddresses = "172.20.10.2:2181";/*DefaultConfigManager.getInstance().getAppConfig().getString("assets.zookeeper.server");*/
        curatorFramework = createAndStartClient(zkServer);
    }

    private CuratorFramework createAndStartClient(String zkAddresses) {
        CuratorFramework client = CuratorFrameworkFactory.newClient(zkAddresses, new ExponentialBackoffRetry(1000, 3));
        client.start();
        return client;
    }

}
