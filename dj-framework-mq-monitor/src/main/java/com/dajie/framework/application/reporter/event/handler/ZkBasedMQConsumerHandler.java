package com.dajie.framework.application.reporter.event.handler;

import com.dajie.framework.application.reporter.event.event.ConsumerTopicEvent;
import com.dajie.framework.application.reporter.event.model.MQInfo;
import com.dajie.framework.application.reporter.event.model.builder.MQConsumerInfoBuilder;
import com.dajie.framework.application.reporter.event.model.builder.MQInfoBuilder;
import com.dajie.framework.application.reporter.event.reporter.MQApplicationReporter;
import com.dajie.framework.application.reporter.event.reporter.ZKBasedMQConsumerReporter;
import com.dajie.framework.application.reporter.event.reporter.ZKBasedMQProviderReporter;

/**
 * Created by yanan.sun on 2016/9/13.
 */
public class ZkBasedMQConsumerHandler implements MQConsumerHandler {
    public boolean handle(ConsumerTopicEvent event) {
        registerProviderTopic(event);
        return true;
    }

    public void registerProviderTopic(ConsumerTopicEvent event) {
        MQInfoBuilder<ConsumerTopicEvent> mqInfoBuilder = new MQConsumerInfoBuilder();
        MQInfo MQInfo = mqInfoBuilder.buildMQInfo(event);
        MQApplicationReporter zkBasedMQConsumerReporter = new ZKBasedMQConsumerReporter();
        zkBasedMQConsumerReporter.report(MQInfo);
    }

    public void onShutDown() {
        MQApplicationReporter MQApplicationReporter = new ZKBasedMQProviderReporter();
        MQApplicationReporter.clean();
    }
}
