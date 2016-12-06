package com.dajie.framework.application.reporter.event.event;

import lombok.Data;

import java.io.Serializable;

/**
 * Created by yanan.sun on 2016/9/23.
 */
@Data
public class BaseTopicEvent implements Serializable {
    private String topic;
    protected BaseTopicEvent(){
    }

    public BaseTopicEvent(String topic){
        this.topic = topic;
    }

    public String getTopic() {
        return topic;
    }
}
