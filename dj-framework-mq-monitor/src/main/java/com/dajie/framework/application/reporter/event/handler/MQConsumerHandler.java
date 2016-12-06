package com.dajie.framework.application.reporter.event.handler;

import com.dajie.framework.application.reporter.event.event.ConsumerTopicEvent;

/**
 * Created by yanan.sun on 2016/9/26.
 */
public interface MQConsumerHandler {
    boolean handle(ConsumerTopicEvent event);
}
