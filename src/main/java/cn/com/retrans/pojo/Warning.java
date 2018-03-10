package cn.com.retrans.pojo;

import java.util.Date;

public class Warning {
    private String id;

    private Date warningTime;

    private String warningObject;

    private String warningType;

    private String warningEvent;

    private Double currentValue;

    private Double limitValue;

    private String warningDesc;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public Date getWarningTime() {
        return warningTime;
    }

    public void setWarningTime(Date warningTime) {
        this.warningTime = warningTime;
    }

    public String getWarningObject() {
        return warningObject;
    }

    public void setWarningObject(String warningObject) {
        this.warningObject = warningObject == null ? null : warningObject.trim();
    }

    public String getWarningType() {
        return warningType;
    }

    public void setWarningType(String warningType) {
        this.warningType = warningType == null ? null : warningType.trim();
    }

    public String getWarningEvent() {
        return warningEvent;
    }

    public void setWarningEvent(String warningEvent) {
        this.warningEvent = warningEvent == null ? null : warningEvent.trim();
    }

    public Double getCurrentValue() {
        return currentValue;
    }

    public void setCurrentValue(Double currentValue) {
        this.currentValue = currentValue;
    }

    public Double getLimitValue() {
        return limitValue;
    }

    public void setLimitValue(Double limitValue) {
        this.limitValue = limitValue;
    }

    public String getWarningDesc() {
        return warningDesc;
    }

    public void setWarningDesc(String warningDesc) {
        this.warningDesc = warningDesc == null ? null : warningDesc.trim();
    }
}