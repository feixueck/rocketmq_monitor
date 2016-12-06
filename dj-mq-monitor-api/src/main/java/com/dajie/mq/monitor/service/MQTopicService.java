package com.dajie.mq.monitor.service;

import com.dajie.mq.monitor.model.MQInfoDetail;
import com.dajie.mq.monitor.model.SimplePage;

import java.util.List;

/**
 * Created by yanan.sun on 2016/10/8.
 */
public interface MQTopicService {
    List<String> getAllMQTopics();

    SimplePage<String> getAllMQTopicsByPage(int page, int pageSize);

    List<MQInfoDetail> findByTopicName(String topicName);
}
