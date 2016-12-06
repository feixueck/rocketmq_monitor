package com.dajie.framework.application.reporter.event.reporter;


import com.dajie.framework.application.reporter.event.model.MQInfo;

/**
 * Created by yanan.sun on 2016/9/14.
 */
public interface MQApplicationReporter {

    void report(MQInfo MQInfo);

    void clean();
}
