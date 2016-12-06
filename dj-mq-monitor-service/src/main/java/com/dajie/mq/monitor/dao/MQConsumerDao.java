package com.dajie.mq.monitor.dao;

import com.dajie.mq.monitor.model.MQInfoDetail;

import java.util.List;

/**
 * Created by yanan.sun on 2016/9/27.
 */
public interface MQConsumerDao {
    void add(MQInfoDetail mqInfoDetail);

    List<MQInfoDetail> getAllMqInfosByPage(int offset, int limit);

    Integer getTotalCount();

    void remove(String appName, String topicName, String queueName);

    List<MQInfoDetail> findByTopicName(String topicName);
}
