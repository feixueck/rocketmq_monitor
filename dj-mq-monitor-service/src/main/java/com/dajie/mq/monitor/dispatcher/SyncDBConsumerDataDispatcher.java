package com.dajie.mq.monitor.dispatcher;

import com.dajie.mq.monitor.dispatcher.util.MapToObjectUtil;
import com.dajie.mq.monitor.model.MQInfoDetail;
import com.dajie.mq.monitor.service.MQConsumerService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Map;

/**
 * Created by yanan.sun on 16-10-11.
 */
@Component("consumerSyncDBDispatcher")
public class SyncDBConsumerDataDispatcher implements SyncDBDispatcher {
    private static final Logger LOGGER = LoggerFactory.getLogger(SyncDBConsumerDataDispatcher.class);
    @Autowired
    private MQConsumerService mqConsumerService;

    @Override
    public void syncAdded(Map<String, Object> data) {
        LOGGER.info("start to sync consumer add {}", data);
        MQInfoDetail mqInfoDetail = MapToObjectUtil.getMapInfoDetail(data);
        if (mqInfoDetail == null) {
            return;
        }
        LOGGER.info("start to sync consumer add {}", mqInfoDetail);
        mqConsumerService.addMQConsumer(mqInfoDetail);
    }

    @Override
    public void syncUpdated(Map<String, Object> data) {
        //synRemoved(data);
        //syncAdded(data);
    }

    @Override
    public void synRemoved(Map<String, Object> data) {
        LOGGER.info("start to sync consumer delete {}", data);
        MQInfoDetail mqInfoDetail = MapToObjectUtil.getMapInfoDetail(data);
        if (mqInfoDetail == null) {
            return;
        }
        LOGGER.info("start to sync consumer delete {}", mqInfoDetail);
        mqConsumerService.removeOne(mqInfoDetail);
    }
}
