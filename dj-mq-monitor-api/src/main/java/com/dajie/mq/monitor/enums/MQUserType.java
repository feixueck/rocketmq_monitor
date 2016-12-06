package com.dajie.mq.monitor.enums;

import com.dajie.common.bean.CodedEnum;
import com.dajie.common.util.StringUtil;

/**
 * Created by yanan.sun on 2016/9/23.
 */
public enum MQUserType implements CodedEnum {
    CONSUMER(0,"consumer"),
    PROVIDER(1, "provider");
    private int code;
    private String desc;

    MQUserType(int code, String desc) {
        this.code = code;
        this.desc = desc;
    }

    @Override
    public int getCode() {
        return code;
    }

    public String getDesc() {
        return desc;
    }

    public static MQUserType getMQUserType(String desc){
        if(StringUtil.isEmpty(desc)){
            return null;
        }
        for(MQUserType mqUserType : MQUserType.values()){
            if(desc.equals(mqUserType.getDesc())){
                return mqUserType;
            }
        }
        return null;
    }

}
