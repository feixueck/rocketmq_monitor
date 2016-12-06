package com.dajie.framework.application.reporter.event.model.builder;

import com.dajie.framework.application.reporter.event.model.MQInfo;
import com.dajie.framework.application.reporter.event.reporter.util.ProcessUtil;
import com.dajie.framework.config.impl.DefaultConfigManager;
import com.dajie.framework.logger.util.HostUtil;

/**
 * Created by yanan.sun on 2016/9/23.
 */
abstract class MQSupportedBaseInfoBuilder {
    protected MQInfo buildAppConfig() {
        DefaultConfigManager manager = DefaultConfigManager.getInstance();
        MQInfo mqInfo = new MQInfo();
        mqInfo.setIp(HostUtil.getLocalIp());
        mqInfo.setPid(ProcessUtil.findPid());
        mqInfo.setAppName(manager.getAppName());
        mqInfo.setAppDesc(manager.getAppDesc());
        mqInfo.setSrcPath(manager.getProjectSrcPath());
        return mqInfo;
    }
}
