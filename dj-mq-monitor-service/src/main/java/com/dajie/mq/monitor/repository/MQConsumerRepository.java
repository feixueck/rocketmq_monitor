package com.dajie.mq.monitor.repository;

import com.dajie.mq.monitor.dao.MQConsumerDao;
import com.dajie.mq.monitor.dao.MQProviderDao;
import com.dajie.mq.monitor.model.MQInfoDetail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by yanan.sun on 2016/9/27.
 */

@Repository
public class MQConsumerRepository {
    @Autowired
    private MQConsumerDao mqConsumerDao;

    public void add(MQInfoDetail mqInfoDetail){
        mqConsumerDao.add(mqInfoDetail);
    }

    public List<MQInfoDetail> getAllMqInfosByPage(int page, int pageSize){
        int offset = (page -1) * pageSize;
        return mqConsumerDao.getAllMqInfosByPage(offset > 0 ? offset : 0, pageSize);
    }

    public int getTotalCount(){
        return mqConsumerDao.getTotalCount();
    }

    public void remove(MQInfoDetail mqInfoDetail) {
        mqConsumerDao.remove(mqInfoDetail.getAppName(), mqInfoDetail.getTopicName(), mqInfoDetail.getQueueName());
    }

    public List<MQInfoDetail> findByTopicName(String topicName) {
        return mqConsumerDao.findByTopicName(topicName);
    }
}
