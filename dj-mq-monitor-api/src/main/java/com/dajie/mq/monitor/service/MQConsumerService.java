package com.dajie.mq.monitor.service;

import com.dajie.common.cqrs.service.query.Page;
import com.dajie.mq.monitor.model.MQInfoDetail;

import java.util.List;

/**
 * Created by yanan.sun on 2016/9/28.
 */
public interface MQConsumerService {
    void addMQConsumer(MQInfoDetail mqInfoDetail);

    Page<MQInfoDetail> getMqConsumers(int page, int pageSize);

    void removeOne(MQInfoDetail mqInfoDetail);

    List<MQInfoDetail> findByTopicName(String topicName);
}
