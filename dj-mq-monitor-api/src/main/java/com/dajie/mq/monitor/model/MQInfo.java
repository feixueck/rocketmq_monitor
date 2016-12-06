package com.dajie.mq.monitor.model;

import com.dajie.common.util.StringUtil;
import com.dajie.mq.monitor.enums.MQUserType;

import java.io.Serializable;

/**
 * Created by yanan.sun on 2016/10/9.
 */
public class MQInfo implements Serializable {
    private String ip;
    private String appName;
    private String pid;
    private String appDesc;
    private String srcPath;
    private String topicName;
    private String queueName;
    private MQUserType type ;


    public String getIp() {
        return getProperty(ip);
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public String getAppName() {
        return getProperty(appName);
    }

    public void setAppName(String appName) {
        this.appName = appName;
    }

    public String getPid() {
        return getProperty(pid);
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public String getAppDesc() {
        return getProperty(appDesc);
    }

    public void setAppDesc(String appDesc) {
        this.appDesc = appDesc;
    }

    public void setTopicName(String topicName) {
        this.topicName = topicName;
    }

    public void setQueueName(String queueName) {
        this.queueName = queueName;
    }

    public void setType(MQUserType type) {
        this.type = type;
    }

    public String getSrcPath() {
        return getProperty(srcPath);
    }

    public void setSrcPath(String srcPath) {
        this.srcPath = srcPath;
    }

    public String getTopicName() {
        return topicName;
    }

    public String getQueueName() {
        return queueName;
    }

    public MQUserType getType() {
        return type;
    }

    private String getProperty(String property){
        return StringUtil.isEmpty(property)? "" : property;
    }

    public MQInfoDetail getMQInfoDetail(){
        MQInfoDetail mqInfoDetail = new MQInfoDetail();
        mqInfoDetail.setIp(this.ip);
        mqInfoDetail.setAppName(this.appName);
        mqInfoDetail.setPid(this.pid);
        mqInfoDetail.setAppDesc(this.appDesc);
        mqInfoDetail.setSrcPath(this.srcPath);
        mqInfoDetail.setTopicName(this.topicName);
        mqInfoDetail.setQueueName(this.queueName);
        return mqInfoDetail;
    }

    @Override
    public String toString() {
        return "MQInfo{" +
                "ip='" + ip + '\'' +
                ", appName='" + appName + '\'' +
                ", pid='" + pid + '\'' +
                ", appDesc='" + appDesc + '\'' +
                ", srcPath='" + srcPath + '\'' +
                ", topicName='" + topicName + '\'' +
                ", queueName='" + queueName + '\'' +
                ", type=" + type +
                '}';
    }
}
