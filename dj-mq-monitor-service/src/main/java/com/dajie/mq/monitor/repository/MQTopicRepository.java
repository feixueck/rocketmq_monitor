package com.dajie.mq.monitor.repository;

import com.dajie.common.util.CollectionUtil;
import com.dajie.mq.monitor.dao.MQProviderDao;
import com.dajie.mq.monitor.model.MQInfoDetail;
import com.dajie.mq.monitor.model.MQTopic;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by yanan.sun on 2016/10/8.
 */
@Repository
public class MQTopicRepository {
    private static final Logger LOGGER = LoggerFactory.getLogger(MQTopicRepository.class);
    @Autowired
    private MQProviderDao mqProviderDao;

    public List<String> findAllTopics() {
        LOGGER.info("start to get all topics");
        List<String> mqTopics = mqProviderDao.findAllTopics();
        LOGGER.info("end to get all topics");
        return mqTopics;
    }

    public List<String> findTopicsByPage(int offset, int pageSize) {
        List<MQInfoDetail> mqInfos = mqProviderDao.getAllMqInfosByPage(offset, pageSize);
        List<String> mqTopics = new ArrayList<String>();
        if(CollectionUtil.isCollectionEmpty(mqInfos)){
            return mqTopics;
        }
        for(MQInfoDetail mqInfoDetail : mqInfos){
            mqTopics.add(mqInfoDetail.getTopicName());
        }
        return mqTopics;
    }

    public int getTotalCount() {
        return mqProviderDao.getTotalCount();
    }
}
