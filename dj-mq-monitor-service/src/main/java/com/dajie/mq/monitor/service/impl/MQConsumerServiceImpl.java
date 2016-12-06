package com.dajie.mq.monitor.service.impl;

import com.dajie.common.cqrs.service.query.Page;
import com.dajie.common.cqrs.service.query.impl.DefaultPage;
import com.dajie.common.cqrs.service.query.impl.DefaultPageable;
import com.dajie.common.util.StringUtil;
import com.dajie.mq.monitor.model.MQInfoDetail;
import com.dajie.mq.monitor.repository.MQConsumerRepository;
import com.dajie.mq.monitor.service.MQConsumerService;
import com.google.common.collect.Lists;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by yanan.sun on 2016/9/28.
 */
@Service("mqConsumerService")
public class MQConsumerServiceImpl implements MQConsumerService {

    private static final Logger LOGGER = LoggerFactory.getLogger(MQConsumerServiceImpl.class);
    @Autowired
    private MQConsumerRepository mqConsumerRepository;
    @Override
    public void addMQConsumer(MQInfoDetail mqInfoDetail) {
        if(mqInfoDetail == null){
            LOGGER.info("mqInfoDetail is null");
            return;
        }
        if(StringUtil.isEmpty(mqInfoDetail.getAppName()) &&
                StringUtil.isEmpty(mqInfoDetail.getTopicName()) &&
                StringUtil.isEmpty(mqInfoDetail.getQueueName())){
            LOGGER.info("appName topicName queueName all null");
            return;
        }
        mqConsumerRepository.add(mqInfoDetail);
    }

    @Override
    public Page<MQInfoDetail> getMqConsumers(int page, int pageSize) {
        List<MQInfoDetail> mqInfoDetails = mqConsumerRepository.getAllMqInfosByPage(page, pageSize);
        int totalCount = mqConsumerRepository.getTotalCount();
        return DefaultPage.of(mqInfoDetails, new DefaultPageable(page, pageSize), totalCount);
    }

    @Override
    public void removeOne(MQInfoDetail mqInfoDetail) {
        if(mqInfoDetail == null || StringUtil.isEmpty(mqInfoDetail.getAppName()) ||
                StringUtil.isEmpty(mqInfoDetail.getTopicName()) ||StringUtil.isEmpty(mqInfoDetail.getQueueName())){
            LOGGER.info("parameter is illegal");
            return;
        }
        mqConsumerRepository.remove(mqInfoDetail);
    }

    @Override
    public List<MQInfoDetail> findByTopicName(String topicName) {
        if(StringUtil.isEmpty(topicName)){
            return Lists.newArrayList();
        }
        return mqConsumerRepository.findByTopicName(topicName);
    }
}
