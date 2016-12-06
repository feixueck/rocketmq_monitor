package com.dajie.mq.monitor.listener.zookeeper;

import java.util.Map;

/**
 * Created by yanan.sun on 16-10-11.
 */
public interface ZKDataDispatcher {
    void doDispatchAdd(Map<String, Object> data);

    void doDispatchUpdate(Map<String, Object> data);

    void doDispatchRemove(Map<String, Object> data);
}
