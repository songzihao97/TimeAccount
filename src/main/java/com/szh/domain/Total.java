package com.szh.domain;

//用于时间统计
public class Total{

    private int typeId;
    private String typeName;
    private String total;

    public int getTypeId() {
        return typeId;
    }

    public void setTypeId(int typeId) {
        this.typeId = typeId;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public String getTotal() {
        return total;
    }

    public void setTotal(String total) {
        if (total!=null&&total.length()!=0){
            //时间不满整小时的，大于30分钟按一小时计算
            int sub=total.indexOf(':');
            int H=Integer.parseInt(total.substring(0,sub));
            int m=Integer.parseInt(total.substring(sub+1,sub+3));
            if (m>30){
                H=H+1;
            }
            total=String.valueOf(H);
        }
        this.total = total;
    }

}
