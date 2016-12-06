package com.dajie.mq.monitor;

import com.dajie.common.cqrs.service.query.Page;
import com.dajie.common.util.CollectionUtil;
import com.dajie.mq.monitor.model.MQInfoDetail;
import com.dajie.mq.monitor.service.MQConsumerService;
import com.dajie.mq.monitor.service.MQTopicService;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

/**
 * Created by yanan.sun on 2016/9/27.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
        "classpath*:/app_config/*.xml",
        "classpath*:/dubbo_config/*.xml",
})
public class MQConsumerServiceTest {
    @Autowired
    private MQConsumerService mqConsumerService;
    @Autowired
    private MQTopicService mqTopicService;

    @Test
    public void addMQInfoTest(){
        MQInfoDetail mqInfoDetail = new MQInfoDetail();
        mqInfoDetail.setAppDesc("app_desc");
        mqInfoDetail.setTopicName("topic_name");
        mqInfoDetail.setQueueName("queue_name");
        mqInfoDetail.setIp("192.168.20.38");
        mqInfoDetail.setPid("1234");
        mqConsumerService.addMQConsumer(mqInfoDetail);
    }

    @Test
    public void getMQInfoTest(){
        Page<MQInfoDetail> result =  mqConsumerService.getMqConsumers(1, 10);
        Assert.assertTrue(CollectionUtil.isCollectionNotEmpty(result.getContent()));
    }
    @Test
    public void getTopics(){
        List<String> result = mqTopicService.getAllMQTopics();
        System.out.println("1");
    }
}
