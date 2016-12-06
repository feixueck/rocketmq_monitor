package com.dajie.mq.monitor.service;

import com.dajie.common.cqrs.service.query.Page;
import com.dajie.mq.monitor.model.MQInfoDetail;

import java.util.List;

/**
 * Created by yanan.sun on 2016/9/27.
 */
public interface MQProviderService {
    void addMQProvider(MQInfoDetail mqInfoDetail);

    Page<MQInfoDetail> getMqProviders(int page, int pageSize);

    void removeOne(MQInfoDetail mqInfoDetail);

    List<MQInfoDetail> findByTopicName(String topicName);
}
