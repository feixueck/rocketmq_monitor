package com.dajie.framework.application.reporter.event.event;

import lombok.Data;

/**
 * Created by yanan.sun on 2016/9/23.
 */
@Data
public class ConsumerTopicEvent extends BaseTopicEvent{
    private String queueName;

    private ConsumerTopicEvent(){
        super();
    }

    public ConsumerTopicEvent(String topic, String queueName) {
        super(topic);
        this.queueName = queueName;
    }

    public String getQueueName() {
        return queueName;
    }
}
