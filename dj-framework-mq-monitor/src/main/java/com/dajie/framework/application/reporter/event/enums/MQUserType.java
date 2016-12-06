package com.dajie.framework.application.reporter.event.enums;

import com.dajie.common.util.StringUtil;
import sun.swing.StringUIClientPropertyKey;

/**
 * Created by yanan.sun on 2016/9/23.
 */
public enum MQUserType {
    CONSUMER(0,"consumer"),
    PROVIDER(1, "provider");
    private int type;
    private String desc;

    MQUserType(int type,String desc) {
        this.type = type;
        this.desc = desc;
    }

    public int getType() {
        return type;
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
