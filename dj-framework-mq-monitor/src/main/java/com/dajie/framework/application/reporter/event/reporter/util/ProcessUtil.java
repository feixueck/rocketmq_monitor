package com.dajie.framework.application.reporter.event.reporter.util;

import java.lang.management.ManagementFactory;

public class ProcessUtil {
    public static String findPid(){
        try {
            String name = ManagementFactory.getRuntimeMXBean().getName();
            return name.split("@")[0];
        }catch (Exception e){
            return null;
        }
    }
}