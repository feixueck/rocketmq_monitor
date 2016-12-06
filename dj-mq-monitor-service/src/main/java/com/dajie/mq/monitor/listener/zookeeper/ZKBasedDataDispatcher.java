package com.dajie.mq.monitor.listener.zookeeper;

import com.dajie.framework.application.reporter.event.enums.MQUserType;
import com.dajie.mq.monitor.parser.ZkNodeDataParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import java.util.Map;

/**
 * Created by yanan.sun on 16-10-11.
 */
public class ZKBasedDataDispatcher extends ZKBasedNodeListener {
    private static final Logger LOGGER = LoggerFactory.getLogger(ZKBasedDataDispatcher.class);
    @Autowired
    @Qualifier("zkProviderDataDispatcher")
    private ZKDataDispatcher zkProviderDataDispatcher;

    @Autowired
    @Qualifier("zkConsumerDataDispatcher")
    private ZKDataDispatcher zkConsumerDataDispatcher;

    @Override
    protected void publishRemoved(String path, byte[] data) {
        Map<String, Object> dataMap = ZkNodeDataParser.parseData(data);
        LOGGER.info("path {} data {}", path, dataMap);
        if(isProvider(dataMap)){
            zkProviderDataDispatcher.doDispatchRemove(dataMap);
            return;
        }
        zkConsumerDataDispatcher.doDispatchRemove(dataMap);
    }

    @Override
    protected void publishUpdated(String path, byte[] data) {
        Map<String, Object> dataMap = ZkNodeDataParser.parseData(data);
        LOGGER.info("path {} data {}", path, dataMap);
        if(isProvider(dataMap)){
            zkProviderDataDispatcher.doDispatchUpdate(dataMap);
            return;
        }
        zkConsumerDataDispatcher.doDispatchUpdate(dataMap);
    }

    @Override
    void publishAdded(String path, byte[] data) {
        Map<String, Object> dataMap = ZkNodeDataParser.parseData(data);
        LOGGER.info("path {} data {}", path, dataMap);
        if(isProvider(dataMap)){
            zkProviderDataDispatcher.doDispatchAdd(dataMap);
            return;
        }
        zkConsumerDataDispatcher.doDispatchAdd(dataMap);
    }


    private boolean isProvider(Map<String, Object> dataMap){
        String type =(String)dataMap.get("type");
        MQUserType mqUserType = MQUserType.getMQUserType(type);
        if(mqUserType == null){
            return false;
        }
        return MQUserType.PROVIDER.equals(mqUserType);
    }

}