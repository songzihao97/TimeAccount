package com.szh.domain;

import java.io.Serializable;

public class LearnType implements Serializable {
    private Integer leaId;
    private String leaType;

    public Integer getLeaId() {
        return leaId;
    }

    public void setLeaId(Integer leaId) {
        this.leaId = leaId;
    }

    public String getLeaType() {
        return leaType;
    }

    public void setLeaType(String leaType) {
        this.leaType = leaType;
    }
}
