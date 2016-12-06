package com.dajie.framework.application.reporter.event.handler;

import com.dajie.framework.application.reporter.event.event.ProviderTopicEvent;
import com.dajie.framework.application.reporter.event.model.MQInfo;
import com.dajie.framework.application.reporter.event.model.builder.MQInfoBuilder;
import com.dajie.framework.application.reporter.event.model.builder.MQProviderInfoBuilder;
import com.dajie.framework.application.reporter.event.reporter.MQApplicationReporter;
import com.dajie.framework.application.reporter.event.reporter.ZKBasedMQProviderReporter;

/**
 * Created by yanan.sun on 2016/9/13.
 */
public class ZkBasedMQProviderHandler implements MQProviderHandler {
    public boolean handle(ProviderTopicEvent event) {
        registerProviderTopic(event);
        return true;
    }

    public void registerProviderTopic(ProviderTopicEvent event) {
        MQInfoBuilder<ProviderTopicEvent> mqProviderInfoBuilderMQInfoBuilder = new MQProviderInfoBuilder();
        MQInfo MQInfo = mqProviderInfoBuilderMQInfoBuilder.buildMQInfo(event);
        MQApplicationReporter mqApplicationReporter = new ZKBasedMQProviderReporter();
        mqApplicationReporter.report(MQInfo);
    }

    public void onShutDown() {
        MQApplicationReporter MQApplicationReporter = new ZKBasedMQProviderReporter();
        MQApplicationReporter.clean();
    }
}
