package com.dajie.framework.application.reporter.event.model.builder;

import com.dajie.framework.application.reporter.event.event.BaseTopicEvent;
import com.dajie.framework.application.reporter.event.model.MQInfo;

/**
 * Created by yanan.sun on 2016/9/23.
 */
public interface MQInfoBuilder<E extends BaseTopicEvent> {
    MQInfo buildMQInfo(E e);
}
