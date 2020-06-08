package com.szh.domain;

import java.io.Serializable;

public class WorkType implements Serializable {

    private Integer workId;
    private String workType;

    public Integer getWorkId() {
        return workId;
    }

    public void setWorkId(Integer workId) {
        this.workId = workId;
    }

    public String getWorkType() {
        return workType;
    }

    public void setWorkType(String workType) {
        this.workType = workType;
    }
}
