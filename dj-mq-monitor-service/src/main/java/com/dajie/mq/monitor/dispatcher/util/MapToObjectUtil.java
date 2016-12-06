package com.dajie.mq.monitor.dispatcher.util;

import com.dajie.common.util.StringUtil;
import com.dajie.mq.monitor.enums.MQUserType;
import com.dajie.mq.monitor.model.MQInfoDetail;

import java.util.Map;

/**
 * Created by yanan.sun on 16-10-11.
 */
public class MapToObjectUtil {
    public static MQInfoDetail getMapInfoDetail(Map<String, Object> parameter){
        if(parameter == null || parameter.isEmpty()){
            return null;
        }
        MQInfoDetail mqInfoDetail = new MQInfoDetail();
        mqInfoDetail.setIp(StringUtil.isEmpty((String) parameter.get("ip")) ? "" : (String) parameter.get("ip"));
        mqInfoDetail.setAppName(StringUtil.isEmpty((String) parameter.get("appName")) ? "" : (String) parameter.get("appName"));
        mqInfoDetail.setPid(StringUtil.isEmpty((String) parameter.get("pid")) ? "" : (String) parameter.get("pid"));
        mqInfoDetail.setAppDesc(StringUtil.isEmpty((String) parameter.get("appDesc")) ? "" : (String) parameter.get("appDesc"));
        mqInfoDetail.setSrcPath(StringUtil.isEmpty((String) parameter.get("srcPath")) ? "" : (String) parameter.get("srcPath"));
        mqInfoDetail.setTopicName(StringUtil.isEmpty((String) parameter.get("topicName")) ? "" : (String) parameter.get("topicName"));
        mqInfoDetail.setQueueName(StringUtil.isEmpty((String)parameter.get("queueName")) ? "" : (String)parameter.get("queueName"));
        String type = (String) parameter.get("type");
        if(StringUtil.isNotEmpty(type)){
            MQUserType mqUserType = MQUserType.getMQUserType(type);
            mqInfoDetail.setType(mqUserType);
        }
        return mqInfoDetail;
    }
}
