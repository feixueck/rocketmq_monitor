package com.dajie.mq.monitor.dispatcher;

import com.dajie.mq.monitor.dispatcher.util.MapToObjectUtil;
import com.dajie.mq.monitor.model.MQInfoDetail;
import com.dajie.mq.monitor.service.MQProviderService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Map;

/**
 * Created by yanan.sun on 16-10-11.
 */
@Component("providerSyncDBDispatcher")
public class SyncDBProviderDataDispatcher implements SyncDBDispatcher {
    private static final Logger LOGGER = LoggerFactory.getLogger(SyncDBProviderDataDispatcher.class);
    @Autowired
    private MQProviderService mqProviderService;

    @Override
    public void syncAdded(Map<String, Object> data) {
        MQInfoDetail mqInfoDetail = MapToObjectUtil.getMapInfoDetail(data);
        LOGGER.info("start to sync provider add {}", data);
        if (mqInfoDetail == null) {
            return;
        }
        LOGGER.info("start to sync provider add {}", mqInfoDetail);
        mqProviderService.addMQProvider(mqInfoDetail);
    }

    @Override
    public void syncUpdated(Map<String, Object> data) {
        //synRemoved(data);
        //syncAdded(data);
    }

    @Override
    public void synRemoved(Map<String, Object> data) {
        LOGGER.info("start to sync provider delete {}", data);
        MQInfoDetail mqInfoDetail = MapToObjectUtil.getMapInfoDetail(data);
        if (mqInfoDetail == null) {
            return;
        }
        LOGGER.info("start to sync provider delete {}", mqInfoDetail);
        mqProviderService.removeOne(mqInfoDetail);
    }
}
