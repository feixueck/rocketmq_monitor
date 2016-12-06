package com.dajie.mq.monitor;

import com.dajie.common.cqrs.service.query.Page;
import com.dajie.common.util.CollectionUtil;
import com.dajie.mq.monitor.model.MQInfoDetail;
import com.dajie.mq.monitor.service.MQProviderService;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * Created by yanan.sun on 2016/9/27.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
        "classpath*:/app_config/*.xml",
        "classpath*:/dubbo_config/*.xml",
})
public class MQProviderServiceTest {
    @Autowired
    private MQProviderService MQProviderService;

    @Test
    public void addMQInfoTest(){
        MQInfoDetail mqInfoDetail = new MQInfoDetail();
        mqInfoDetail.setAppDesc("app_desc");
        mqInfoDetail.setTopicName("topic_name");
        mqInfoDetail.setIp("192.168.20.38");
        mqInfoDetail.setPid("1234");
        MQProviderService.addMQProvider(mqInfoDetail);
    }

    @Test
    public void getMQInfoTest(){
        Page<MQInfoDetail> result =  MQProviderService.getMqProviders(1, 10);
        Assert.assertTrue(CollectionUtil.isCollectionNotEmpty(result.getContent()));
    }
}
