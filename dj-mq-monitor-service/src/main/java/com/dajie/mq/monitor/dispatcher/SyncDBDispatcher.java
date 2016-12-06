package com.dajie.mq.monitor.dispatcher;

import java.util.Map;

/**
 * Created by yanan.sun on 16-10-11.
 */
public interface SyncDBDispatcher {
    public void syncAdded(Map<String, Object> data);

    public void syncUpdated(Map<String, Object> data);

    public void synRemoved(Map<String, Object> data);
}
