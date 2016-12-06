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
@Component("zkConsumerDataDispatcher")
public class ZKConsumerDispatcher implements  ZKDataDispatcher{
    private static final Logger LOGGER = LoggerFactory.getLogger(ZKConsumerDispatcher.class);
    @Autowired
    @Qualifier("consumerSyncDBDispatcher")
    private SyncDBDispatcher syncDBDispatcher;
    @Override
    public void doDispatchAdd(Map<String, Object> data) {
        LOGGER.info("sync add consumer data {}",data);
        syncDBDispatcher.syncAdded(data);
    }

    @Override
    public void doDispatchUpdate(Map<String, Object> data) {
        LOGGER.info("sync update consumer data {}",data);
        syncDBDispatcher.syncUpdated(data);
    }

    @Override
    public void doDispatchRemove(Map<String, Object> data) {
        LOGGER.info("sync delete consumer data {}",data);
        syncDBDispatcher.synRemoved(data);
    }
}
