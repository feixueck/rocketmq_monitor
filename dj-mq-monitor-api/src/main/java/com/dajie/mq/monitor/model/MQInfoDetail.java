package com.dajie.mq.monitor.model;

import com.dajie.mq.monitor.enums.MQUserType;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by yanan.sun on 2016/9/27.
 */
public class MQInfoDetail implements Serializable {
    private Integer id;
    private String ip = "";
    private String appName = "";
    private String pid = "";
    private String appDesc = "";
    private String srcPath = "";
    private String topicName = "";
    private String queueName = "";
    private MQUserType type ;
    private Date createDate;
    private Date updateDate;

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public String getAppName() {
        return appName;
    }

    public void setAppName(String appName) {
        this.appName = appName;
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public String getAppDesc() {
        return appDesc;
    }

    public void setAppDesc(String appDesc) {
        this.appDesc = appDesc;
    }

    public String getSrcPath() {
        return srcPath;
    }

    public void setSrcPath(String srcPath) {
        this.srcPath = srcPath;
    }

    public String getTopicName() {
        return topicName;
    }

    public void setTopicName(String topicName) {
        this.topicName = topicName;
    }

    public String getQueueName() {
        return queueName;
    }

    public void setQueueName(String queueName) {
        this.queueName = queueName;
    }

    public MQUserType getType() {
        return type;
    }

    public void setType(MQUserType type) {
        this.type = type;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

    @Override
    public String toString() {
        return "MQInfoDetail{" +
                "id=" + id +
                ", ip='" + ip + '\'' +
                ", appName='" + appName + '\'' +
                ", pid='" + pid + '\'' +
                ", appDesc='" + appDesc + '\'' +
                ", srcPath='" + srcPath + '\'' +
                ", topicName='" + topicName + '\'' +
                ", queueName='" + queueName + '\'' +
                ", type=" + type +
                ", createDate=" + createDate +
                ", updateDate=" + updateDate +
                '}';
    }
}
