package com.dajie.framework.application.reporter.event.model.builder;

import com.dajie.framework.application.reporter.event.enums.MQUserType;
import com.dajie.framework.application.reporter.event.event.ProviderTopicEvent;
import com.dajie.framework.application.reporter.event.model.MQInfo;

/**
 * Created by yanan.sun on 2016/9/23.
 */
public class MQProviderInfoBuilder extends MQSupportedBaseInfoBuilder implements MQInfoBuilder<ProviderTopicEvent> {
    @Override
    public MQInfo buildMQInfo(ProviderTopicEvent providerTopicEvent) {
        MQInfo mqInfo = buildAppConfig();
        mqInfo.setTopicName(providerTopicEvent.getTopic());
        mqInfo.setType(MQUserType.PROVIDER);
        return mqInfo;
    }
}
