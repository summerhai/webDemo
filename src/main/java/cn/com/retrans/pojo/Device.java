package cn.com.retrans.pojo;

import java.util.Date;

public class Device {
    private String id;

    private Date collectDate;

    private Date collectTime;

    private Boolean filterPump1;

    private Boolean filterPump2;

    private Boolean pacBlender;

    private Boolean pamBlender;

    private Boolean pacMeteringPumb1;

    private Boolean pacMeteringPumb2;

    private Boolean pamMeteringPumb1;

    private Boolean pamMeteringPumb2;

    private Boolean rawWaterPumb1;

    private Boolean rawWaterPumb2;

    private Boolean waterSupplyPumb1;

    private Boolean waterSupplyPumb2;

    private Boolean backFlushPumb;

    private Boolean blower;

    private Boolean antiVirusDevice;

    private Boolean electricValve;

    private Boolean medicalKitIndex;

    private Boolean regulateLow;

    private Boolean regulateHigh;

    private Boolean middleLow;

    private Boolean middleMiddle;

    private Boolean middleHigh;

    private Boolean waterLow;

    private Boolean waterMiddle;

    private Boolean waterHigh;

    private Boolean blackFlush1;

    private Boolean blackFlush2;

    private Boolean blackFlush3;

    private Boolean blackFlush4;

    private Boolean systemRun;

    private Double mudLevel;

    private Double envDimidity;

    private Double envTemperature;

    private Double cableTemperature;

    private Double smokeSignal;

    private Double waterSignal;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public Date getCollectDate() {
        return collectDate;
    }

    public void setCollectDate(Date collectDate) {
        this.collectDate = collectDate;
    }

    public Date getCollectTime() {
        return collectTime;
    }

    public void setCollectTime(Date collectTime) {
        this.collectTime = collectTime;
    }

    public Boolean getFilterPump1() {
        return filterPump1;
    }

    public void setFilterPump1(Boolean filterPump1) {
        this.filterPump1 = filterPump1;
    }

    public Boolean getFilterPump2() {
        return filterPump2;
    }

    public void setFilterPump2(Boolean filterPump2) {
        this.filterPump2 = filterPump2;
    }

    public Boolean getPacBlender() {
        return pacBlender;
    }

    public void setPacBlender(Boolean pacBlender) {
        this.pacBlender = pacBlender;
    }

    public Boolean getPamBlender() {
        return pamBlender;
    }

    public void setPamBlender(Boolean pamBlender) {
        this.pamBlender = pamBlender;
    }

    public Boolean getPacMeteringPumb1() {
        return pacMeteringPumb1;
    }

    public void setPacMeteringPumb1(Boolean pacMeteringPumb1) {
        this.pacMeteringPumb1 = pacMeteringPumb1;
    }

    public Boolean getPacMeteringPumb2() {
        return pacMeteringPumb2;
    }

    public void setPacMeteringPumb2(Boolean pacMeteringPumb2) {
        this.pacMeteringPumb2 = pacMeteringPumb2;
    }

    public Boolean getPamMeteringPumb1() {
        return pamMeteringPumb1;
    }

    public void setPamMeteringPumb1(Boolean pamMeteringPumb1) {
        this.pamMeteringPumb1 = pamMeteringPumb1;
    }

    public Boolean getPamMeteringPumb2() {
        return pamMeteringPumb2;
    }

    public void setPamMeteringPumb2(Boolean pamMeteringPumb2) {
        this.pamMeteringPumb2 = pamMeteringPumb2;
    }

    public Boolean getRawWaterPumb1() {
        return rawWaterPumb1;
    }

    public void setRawWaterPumb1(Boolean rawWaterPumb1) {
        this.rawWaterPumb1 = rawWaterPumb1;
    }

    public Boolean getRawWaterPumb2() {
        return rawWaterPumb2;
    }

    public void setRawWaterPumb2(Boolean rawWaterPumb2) {
        this.rawWaterPumb2 = rawWaterPumb2;
    }

    public Boolean getWaterSupplyPumb1() {
        return waterSupplyPumb1;
    }

    public void setWaterSupplyPumb1(Boolean waterSupplyPumb1) {
        this.waterSupplyPumb1 = waterSupplyPumb1;
    }

    public Boolean getWaterSupplyPumb2() {
        return waterSupplyPumb2;
    }

    public void setWaterSupplyPumb2(Boolean waterSupplyPumb2) {
        this.waterSupplyPumb2 = waterSupplyPumb2;
    }

    public Boolean getBackFlushPumb() {
        return backFlushPumb;
    }

    public void setBackFlushPumb(Boolean backFlushPumb) {
        this.backFlushPumb = backFlushPumb;
    }

    public Boolean getBlower() {
        return blower;
    }

    public void setBlower(Boolean blower) {
        this.blower = blower;
    }

    public Boolean getAntiVirusDevice() {
        return antiVirusDevice;
    }

    public void setAntiVirusDevice(Boolean antiVirusDevice) {
        this.antiVirusDevice = antiVirusDevice;
    }

    public Boolean getElectricValve() {
        return electricValve;
    }

    public void setElectricValve(Boolean electricValve) {
        this.electricValve = electricValve;
    }

    public Boolean getMedicalKitIndex() {
        return medicalKitIndex;
    }

    public void setMedicalKitIndex(Boolean medicalKitIndex) {
        this.medicalKitIndex = medicalKitIndex;
    }

    public Boolean getRegulateLow() {
        return regulateLow;
    }

    public void setRegulateLow(Boolean regulateLow) {
        this.regulateLow = regulateLow;
    }

    public Boolean getRegulateHigh() {
        return regulateHigh;
    }

    public void setRegulateHigh(Boolean regulateHigh) {
        this.regulateHigh = regulateHigh;
    }

    public Boolean getMiddleLow() {
        return middleLow;
    }

    public void setMiddleLow(Boolean middleLow) {
        this.middleLow = middleLow;
    }

    public Boolean getMiddleMiddle() {
        return middleMiddle;
    }

    public void setMiddleMiddle(Boolean middleMiddle) {
        this.middleMiddle = middleMiddle;
    }

    public Boolean getMiddleHigh() {
        return middleHigh;
    }

    public void setMiddleHigh(Boolean middleHigh) {
        this.middleHigh = middleHigh;
    }

    public Boolean getWaterLow() {
        return waterLow;
    }

    public void setWaterLow(Boolean waterLow) {
        this.waterLow = waterLow;
    }

    public Boolean getWaterMiddle() {
        return waterMiddle;
    }

    public void setWaterMiddle(Boolean waterMiddle) {
        this.waterMiddle = waterMiddle;
    }

    public Boolean getWaterHigh() {
        return waterHigh;
    }

    public void setWaterHigh(Boolean waterHigh) {
        this.waterHigh = waterHigh;
    }

    public Boolean getBlackFlush1() {
        return blackFlush1;
    }

    public void setBlackFlush1(Boolean blackFlush1) {
        this.blackFlush1 = blackFlush1;
    }

    public Boolean getBlackFlush2() {
        return blackFlush2;
    }

    public void setBlackFlush2(Boolean blackFlush2) {
        this.blackFlush2 = blackFlush2;
    }

    public Boolean getBlackFlush3() {
        return blackFlush3;
    }

    public void setBlackFlush3(Boolean blackFlush3) {
        this.blackFlush3 = blackFlush3;
    }

    public Boolean getBlackFlush4() {
        return blackFlush4;
    }

    public void setBlackFlush4(Boolean blackFlush4) {
        this.blackFlush4 = blackFlush4;
    }

    public Boolean getSystemRun() {
        return systemRun;
    }

    public void setSystemRun(Boolean systemRun) {
        this.systemRun = systemRun;
    }

    public Double getMudLevel() {
        return mudLevel;
    }

    public void setMudLevel(Double mudLevel) {
        this.mudLevel = mudLevel;
    }

    public Double getEnvDimidity() {
        return envDimidity;
    }

    public void setEnvDimidity(Double envDimidity) {
        this.envDimidity = envDimidity;
    }

    public Double getEnvTemperature() {
        return envTemperature;
    }

    public void setEnvTemperature(Double envTemperature) {
        this.envTemperature = envTemperature;
    }

    public Double getCableTemperature() {
        return cableTemperature;
    }

    public void setCableTemperature(Double cableTemperature) {
        this.cableTemperature = cableTemperature;
    }

    public Double getSmokeSignal() {
        return smokeSignal;
    }

    public void setSmokeSignal(Double smokeSignal) {
        this.smokeSignal = smokeSignal;
    }

    public Double getWaterSignal() {
        return waterSignal;
    }

    public void setWaterSignal(Double waterSignal) {
        this.waterSignal = waterSignal;
    }
}