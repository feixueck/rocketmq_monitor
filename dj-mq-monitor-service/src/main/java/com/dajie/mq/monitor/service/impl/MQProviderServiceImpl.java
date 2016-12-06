package com.dajie.mq.monitor.service.impl;

import com.dajie.common.cqrs.service.query.Page;
import com.dajie.common.cqrs.service.query.impl.DefaultPage;
import com.dajie.common.cqrs.service.query.impl.DefaultPageable;
import com.dajie.common.util.StringUtil;
import com.dajie.mq.monitor.model.MQInfoDetail;
import com.dajie.mq.monitor.repository.MQProviderRepository;
import com.dajie.mq.monitor.service.MQProviderService;
import com.google.common.collect.Lists;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by yanan.sun on 2016/9/27.
 */
@Service("mqProviderService")
public class MQProviderServiceImpl implements MQProviderService {
    private static final Logger LOGGER = LoggerFactory.getLogger(MQProviderServiceImpl.class);
    @Autowired
    private MQProviderRepository mqProviderRepository;
    @Override
    public void addMQProvider(MQInfoDetail mqInfoDetail) {
        LOGGER.info("start to add to db {}", mqInfoDetail);
        if(mqInfoDetail == null){
            LOGGER.info("mqInfoDetail is null");
            return;
        }
        if(StringUtil.isEmpty(mqInfoDetail.getAppName()) &&
                StringUtil.isEmpty(mqInfoDetail.getTopicName()) ){
            LOGGER.info("appName topicName queueName all null");
            return;
        }
        mqProviderRepository.add(mqInfoDetail);
    }

    @Override
    public Page<MQInfoDetail> getMqProviders(int page, int pageSize) {
        List<MQInfoDetail> mqInfoDetails = mqProviderRepository.getAllMqInfosByPage(page, pageSize);
        int totalCount = mqProviderRepository.getTotalCount();
        return DefaultPage.of(mqInfoDetails, new DefaultPageable(page, pageSize), totalCount);
    }

    @Override
    public void removeOne(MQInfoDetail mqInfoDetail) {
        LOGGER.info("start to remove from db {}", mqInfoDetail);
        if(mqInfoDetail == null || StringUtil.isEmpty(mqInfoDetail.getAppName())  || StringUtil.isEmpty(mqInfoDetail.getTopicName())){
            LOGGER.info("parameter is illegal");
            return;
        }
        mqProviderRepository.remove(mqInfoDetail);
    }

    @Override
    public List<MQInfoDetail> findByTopicName(String topicName) {
        if(StringUtil.isEmpty(topicName)){
            return Lists.newArrayList();
        }
        return mqProviderRepository.findByTopicName(topicName);
    }
}
