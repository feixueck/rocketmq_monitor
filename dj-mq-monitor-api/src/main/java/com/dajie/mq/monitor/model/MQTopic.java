package com.dajie.mq.monitor.model;

import lombok.Data;

import java.io.Serializable;

/**
 * Created by yanan.sun on 2016/10/8.
 */
@Data
public class MQTopic implements Serializable {
    private String topicName;
}
