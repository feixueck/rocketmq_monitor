package com.dajie.framework.application.reporter.event.model;

import lombok.Data;

import java.util.Date;

/**
 * Created by yanan.sun on 2016/9/22.
 * TODO 以后如果把worker的统计信息加进来的话可以用
 */
@Data
public class WorkerStatistics {
    private final Date startDate = new Date();
    private Integer loadedCount ;
    private Integer submittedCount;
    private Integer successCount ;
    private Integer failedCount ;
    private Integer errorCount;
}
