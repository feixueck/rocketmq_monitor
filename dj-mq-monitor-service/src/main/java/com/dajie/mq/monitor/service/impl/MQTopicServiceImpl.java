package com.dajie.mq.monitor.service.impl;

import com.dajie.mq.monitor.model.MQInfoDetail;
import com.dajie.mq.monitor.model.MQTopic;
import com.dajie.mq.monitor.model.SimplePage;
import com.dajie.mq.monitor.repository.MQTopicRepository;
import com.dajie.mq.monitor.service.MQProviderService;
import com.dajie.mq.monitor.service.MQTopicService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by yanan.sun on 2016/10/8.
 */
@Service("mqTopicService")
public class MQTopicServiceImpl implements MQTopicService {
    private static final Logger LOGGER = LoggerFactory.getLogger(MQTopicServiceImpl.class);
    @Autowired
    private MQTopicRepository mqTopicRepository;
    @Autowired
    private MQProviderService mqProviderService;

    @Override
    public List<String> getAllMQTopics() {
        LOGGER.info("step to get all topics");
        return mqTopicRepository.findAllTopics();
    }

    @Override
    public SimplePage<String> getAllMQTopicsByPage(int page, int pageSize) {
        if (page <= 0 || pageSize <= 0) {
            LOGGER.info("invalid page or pagesize ");
            return null;
        }
        int totalCount = mqTopicRepository.getTotalCount();
        SimplePage<String> topicsByPage = SimplePage.of(page, pageSize,totalCount);
        List<String> topics = mqTopicRepository.findTopicsByPage((page -1) * pageSize, pageSize);
        topicsByPage.setData(topics);
        LOGGER.info("topics by page is {}", topics);
        return topicsByPage;
    }

    @Override
    public List<MQInfoDetail> findByTopicName( String topicName) {
        return mqProviderService.findByTopicName(topicName);
    }
}
