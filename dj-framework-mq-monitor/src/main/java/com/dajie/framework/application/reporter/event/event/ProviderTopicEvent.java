package com.dajie.framework.application.reporter.event.event;

import lombok.Data;

/**
 * Created by yanan.sun on 2016/9/22.
 */
@Data
public class ProviderTopicEvent  extends BaseTopicEvent{
    private ProviderTopicEvent(){
        super();
    }

    public ProviderTopicEvent(String topic){
        super(topic);
    }
}
