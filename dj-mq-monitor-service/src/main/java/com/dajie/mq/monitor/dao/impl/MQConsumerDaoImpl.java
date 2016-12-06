package com.dajie.mq.monitor.dao.impl;

import com.dajie.common.framework.ibatis.Dao;
import com.dajie.mq.monitor.dao.MQConsumerDao;
import com.dajie.mq.monitor.dao.MQProviderDao;
import com.dajie.mq.monitor.model.MQInfoDetail;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by yanan.sun on 2016/9/27.
 */
@Component("mqConsumerDao")
public class MQConsumerDaoImpl extends Dao implements MQConsumerDao {
    private static final String SQL_PREFIX = "com.dajie.mq.monitor.dao.MQConsumerDao.";

    public MQConsumerDaoImpl() {
        super("dajie_mq_monitor", "core_master");
    }

    @Override
    public void add(MQInfoDetail mqInfoDetail) {
        insert(SQL_PREFIX + "insertConsumer", mqInfoDetail);
    }

    @Override
    public List<MQInfoDetail> getAllMqInfosByPage(int offset, int limit) {
        Map<String, Object> parameter = new HashMap<String, Object>(2);
        parameter.put("offset", offset);
        parameter.put("limit", limit);
        return (List<MQInfoDetail>)selectList(SQL_PREFIX + "select", parameter);
    }

    @Override
    public Integer getTotalCount() {
        return (Integer)selectOne(SQL_PREFIX + "selectTotalCount");
    }

    @Override
    public void remove(String appName, String topicName, String queueName) {
        Map<String, Object> parameter = new HashMap<String, Object>(3);
        parameter.put("appName", appName);
        parameter.put("topicName", topicName);
        parameter.put("queueName",queueName);
        delete(SQL_PREFIX + "delete", parameter);
    }

    @Override
    public List<MQInfoDetail> findByTopicName(String topicName) {
        Map<String, Object> parameter = new HashMap<String, Object>(1);
        parameter.put("topicName",topicName);
        return (List<MQInfoDetail>)selectList(SQL_PREFIX + "selectByTopicName", parameter);
    }
}
