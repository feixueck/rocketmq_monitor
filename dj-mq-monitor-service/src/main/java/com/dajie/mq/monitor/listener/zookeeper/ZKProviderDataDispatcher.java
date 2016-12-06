package com.dajie.mq.monitor.listener.zookeeper;

import com.dajie.mq.monitor.dispatcher.SyncDBDispatcher;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import java.util.Map;

/**
 * Created by yanan.sun on 16-10-11.
 */
@Component("zkProviderDataDispatcher")
public class ZKProviderDataDispatcher implements ZKDataDispatcher {
    private static final Logger LOGGER = LoggerFactory.getLogger(ZKProviderDataDispatcher.class);
    @Autowired
    @Qualifier("providerSyncDBDispatcher")
    private SyncDBDispatcher syncDBDispatcher;

    @Override
    public void doDispatchAdd(Map<String, Object> data) {
        LOGGER.info("sync add provider data {}", data);
        syncDBDispatcher.syncAdded(data);
    }

    @Override
    public void doDispatchUpdate(Map<String, Object> data) {
        LOGGER.info("sync update provider data {}",data);
        syncDBDispatcher.syncUpdated(data);
    }

    @Override
    public void doDispatchRemove(Map<String, Object> data) {
        LOGGER.info("sync delete provider data {}",data);
        syncDBDispatcher.synRemoved(data);
    }
}
