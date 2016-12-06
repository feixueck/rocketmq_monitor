package com.dajie.framework.application.reporter.event.reporter;

import com.dajie.framework.application.reporter.event.model.MQInfo;
import com.dajie.framework.application.reporter.event.reporter.util.ZKBasedMQReporterUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Created by yanan.sun on 2016/9/14.
 */
public class ZKBasedMQProviderReporter extends AbstractZKBasedReporter implements MQApplicationReporter {
    private static final Logger LOGGER = LoggerFactory.getLogger(ZKBasedMQProviderReporter.class);

    @Override
    public void report(MQInfo mqInfo) {
        LOGGER.info("start to report config ");
        super.report(mqInfo);
    }

    @Override
    protected byte[] getData(MQInfo mqInfo) {
        return ZKBasedMQReporterUtil.getData(mqInfo);
    }


    @Override
    protected String getPath(MQInfo MQInfo) {
        return ZKBasedMQReporterUtil.createPath(MQInfo);
    }

}
