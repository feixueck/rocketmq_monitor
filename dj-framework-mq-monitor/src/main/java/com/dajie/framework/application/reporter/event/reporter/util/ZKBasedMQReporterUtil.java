package com.dajie.framework.application.reporter.event.reporter.util;


import com.dajie.framework.application.reporter.event.model.MQInfo;
import org.apache.curator.utils.ZKPaths;

/**
 * Created by yanan.sun on 2016/9/14.
 */
public class ZKBasedMQReporterUtil {
    private static final String SPLITER = "&";

    public static String createPath(MQInfo var1) {
        String dataPath = getPath(var1).toString();
        return ZKPaths.makePath(ZKCuratorUtil.PATH, dataPath);
    }

    private static StringBuilder getPath(MQInfo var1) {
        return new StringBuilder()
                .append("appName=").append(var1.getAppName()).append(SPLITER)
                .append("type=").append(var1.getType().getDesc()).append(SPLITER)
                .append("pid=").append(var1.getPid()).append(SPLITER)
                .append("appDesc=").append(var1.getAppDesc()).append(SPLITER)
                .append("ip=").append(var1.getIp()).append(SPLITER)
                .append("topicName=").append(var1.getTopicName()).append(SPLITER)
                .append("queueName=").append(var1.getQueueName());
    }

    public static byte[] getData(MQInfo var1){
        StringBuilder stringBuilder = getPath(var1);
        stringBuilder.append(SPLITER).append("srcPath=").append(var1.getSrcPath());
        return stringBuilder.toString().getBytes();
    }
}
