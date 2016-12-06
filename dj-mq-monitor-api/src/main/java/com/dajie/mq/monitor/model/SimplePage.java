package com.dajie.mq.monitor.model;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by yanan.sun on 16-11-17.
 */
public class SimplePage<T> implements java.io.Serializable {
    private int page;
    private int pageSize;
    private int totalCount;
    private List<T> data = new ArrayList<T>();


    public static <T> SimplePage<T> of(int page, int pageSize, int totalCount) {
        SimplePage<T> simplePage = new SimplePage<T>();
        simplePage.setPage(page);
        simplePage.setPageSize(pageSize);
        simplePage.setTotalCount(totalCount);
        return simplePage;
    }

    public static <T> SimplePage<T> empty(int page, int pageSize) {
        SimplePage<T> simplePage = new SimplePage<T>();
        simplePage.setPage(page);
        simplePage.setPageSize(pageSize);
        simplePage.setTotalCount(0);
        return simplePage;
    }

    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }

    public List<T> getData() {
        return data;
    }

    public void setData(List<T> data) {
        this.data = data;
    }

    public boolean isLastPage() {
        return page * pageSize >= totalCount;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }
}
