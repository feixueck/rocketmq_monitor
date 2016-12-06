package com.dajie.mq.monitor.service.reporter;

import com.dajie.mq.monitor.model.MQInfo;

/**
 * Created by yanan.sun on 2016/10/9.
 */
public interface MQReporter {
    void report(MQInfo MQInfo);
}
