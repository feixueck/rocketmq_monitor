package com.dajie.mq.monitor;

import com.dajie.mq.monitor.service.MQConsumerService;
import com.dajie.mq.monitor.service.MQProviderService;
import com.dajie.mq.monitor.service.reporter.MQConsumerReporter;
import com.dajie.mq.monitor.service.reporter.MQProviderReporter;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class MQMonitorServiceContext {
    private static final String[] CONFIG_FILES = new String[]{
            "classpath*:dubbo_config/common.xml",
            "classpath*:dubbo_config/common_consumer.xml",
            "classpath*:dubbo_config/*-app.xml",
            "classpath:dubbo_config/dj-mq-monitor-consumer.xml"
    };

    private static final MQMonitorServiceContext INSTANCE = new MQMonitorServiceContext();

    private final ClassPathXmlApplicationContext applicationContext;

    private MQMonitorServiceContext() {
        this.applicationContext = new ClassPathXmlApplicationContext(CONFIG_FILES);
    }

    public static MQMonitorServiceContext getInstance() {
        return INSTANCE;
    }

    public MQProviderService getMQProviderService() {
        return (MQProviderService) applicationContext.getBean("mqProviderService");
    }

    public MQConsumerService getMQConsumerService() {
        return (MQConsumerService) applicationContext.getBean("mqConsumerService");
    }

    public MQConsumerReporter getMQConsumerReorter() {
        return (MQConsumerReporter) applicationContext.getBean("mqConsumerReporter");
    }
    public MQProviderReporter getMQProviderReporter() {
        return (MQProviderReporter) applicationContext.getBean("mqProviderReporter");
    }

}
