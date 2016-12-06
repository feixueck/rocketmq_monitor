package com.dajie.mq.monitor.parser;

import com.dajie.common.util.StringUtil;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by yanan.sun on 16-10-11.
 */
public class ZkNodeDataParser {

  /*  public static void main(String[] args) {
        String path = "ppName=dj-guanke-service&type=provider&pid=&appDesc=guanke-service&ip=172.20.10.2&topicName=guanke_accost_v2&queueName=";
        Map<String, Object> map = parseData(path.getBytes());
        System.out.println("1");
        System.out.println("1");
    }*/

    public static Map<String, Object> parseData(byte[] data){
        String dataStr = dataArrayToStr(data);
        String[] strArrayWithEqualSign = dataStr.split("&");
        Map<String, Object> parameter = new HashMap<String, Object>(strArrayWithEqualSign.length);

        for(String strArray : strArrayWithEqualSign){
            String[] strs = strArray.split("=");
            if(strs.length == 0){
                continue;
            }
            if(strs.length == 1){
                parameter.put(strs[0],  "" );
                continue;
            }
            parameter.put(strs[0], StringUtil.isEmpty(strs[1])? "" : strs[1]);
        }
        return parameter;
    }

    private static String dataArrayToStr(byte[] data){
        return new String(data);
    }
}
