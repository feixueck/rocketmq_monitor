package com.dajie.mq.monitor.repository;

import com.dajie.mq.monitor.dao.MQProviderDao;
import com.dajie.mq.monitor.model.MQInfoDetail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by yanan.sun on 2016/9/27.
 */

@Repository
public class MQProviderRepository {
    @Autowired
    private MQProviderDao mqProviderDao;

    public void add(MQInfoDetail mqInfoDetail){
        mqProviderDao.add(mqInfoDetail);
    }

    public List<MQInfoDetail> getAllMqInfosByPage(int page, int pageSize){
        int offset = (page -1) * pageSize;
        return mqProviderDao.getAllMqInfosByPage(offset > 0 ? offset : 0, pageSize);
    }

    public int getTotalCount(){
        return mqProviderDao.getTotalCount();
    }

    public void remove(MQInfoDetail mqInfoDetail) {
        mqProviderDao.remove(mqInfoDetail.getAppName(), mqInfoDetail.getTopicName());
    }

    public List<MQInfoDetail> findByTopicName(String topicName) {
        return mqProviderDao.findByTopicName(topicName);
    }
}
