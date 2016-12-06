package com.dajie.mq.monitor.dao.impl.handler;

import com.dajie.common.framework.ibatis.handler.CodedEnumTypeHandler;
import com.dajie.mq.monitor.enums.MQUserType;

/**
 * Created by yanan.sun on 2016/9/27.
 */
public class MQUserTypeHandler extends CodedEnumTypeHandler {
    public MQUserTypeHandler() {
        super(MQUserType.class);
    }
}
