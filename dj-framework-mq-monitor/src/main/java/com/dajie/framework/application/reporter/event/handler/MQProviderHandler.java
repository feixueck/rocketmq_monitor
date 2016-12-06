package com.dajie.framework.application.reporter.event.handler;

import com.dajie.framework.application.reporter.event.event.ProviderTopicEvent;

/**
 * Created by yanan.sun on 2016/9/26.
 */
public interface MQProviderHandler {
    boolean handle(ProviderTopicEvent event);
}
