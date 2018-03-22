package cn.com.retrans.pojo;

import java.util.Date;

public class Report {
    private String id;

    private Date collectTime;

    private Double setPower;

    private Double runPower;

    private Integer allSum;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public Date getCollectTime() {
        return collectTime;
    }

    public void setCollectTime(Date collectTime) {
        this.collectTime = collectTime;
    }

    public Double getSetPower() {
        return setPower;
    }

    public void setSetPower(Double setPower) {
        this.setPower = setPower;
    }

    public Double getRunPower() {
        return runPower;
    }

    public void setRunPower(Double runPower) {
        this.runPower = runPower;
    }

    public Integer getAllSum() {
        return allSum;
    }

    public void setAllSum(Integer allSum) {
        this.allSum = allSum;
    }
}