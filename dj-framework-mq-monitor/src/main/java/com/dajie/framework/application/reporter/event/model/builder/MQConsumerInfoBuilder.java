package com.dajie.framework.application.reporter.event.model.builder;

import com.dajie.framework.application.reporter.event.enums.MQUserType;
import com.dajie.framework.application.reporter.event.event.ConsumerTopicEvent;
import com.dajie.framework.application.reporter.event.model.MQInfo;

/**
 * Created by yanan.sun on 2016/9/23.
 */
public class MQConsumerInfoBuilder extends MQSupportedBaseInfoBuilder implements MQInfoBuilder<ConsumerTopicEvent> {
    @Override
    public MQInfo buildMQInfo(ConsumerTopicEvent consumerTopicEvent) {
        MQInfo mqInfo = buildAppConfig();
        mqInfo.setTopicName(consumerTopicEvent.getTopic());
        mqInfo.setQueueName(consumerTopicEvent.getQueueName());
        mqInfo.setType(MQUserType.CONSUMER);
        return mqInfo;
    }
}
