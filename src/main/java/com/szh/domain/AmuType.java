package com.szh.domain;

import java.io.Serializable;

public class AmuType implements Serializable {

    private Integer amuId;
    private String amuType;

    public Integer getAmuId() {
        return amuId;
    }

    public void setAmuId(Integer amuId) {
        this.amuId = amuId;
    }

    public String getAmuType() {
        return amuType;
    }

    public void setAmuType(String amuType) {
        this.amuType = amuType;
    }
}
