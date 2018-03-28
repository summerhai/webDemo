package cn.com.retrans.service.impl;

import cn.com.retrans.dao.ReportMapper;
import cn.com.retrans.pojo.Report;
import cn.com.retrans.service.ReportService;
import cn.com.retrans.utils.Constants;
import cn.com.retrans.utils.DataTablePageUtil;
import cn.com.retrans.utils.DatabaseUtil;
import cn.com.retrans.utils.DateUtils;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.json.JsonObject;
import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

@Service
public class ReportServiceImpl implements ReportService {
    Logger logger = Logger.getLogger(ReportServiceImpl.class);
    @SuppressWarnings("SpringJavaAutowiringInspection")
    @Autowired
    private ReportMapper reportMapper;

    /**
     * 报表页数据来源
     * @param request
     * @return
     */
    @Override
    public String getReportList(HttpServletRequest request) {
        //使用DataTables的属性接收分页数据
        DataTablePageUtil<Report> dataTable = new DataTablePageUtil<Report>(request);
        //还是使用List，方便后期用到
        List<Report> reports = new ArrayList<>();
        //开始分页：PageHelper会处理接下来的第一个查询
        String orderBy = null;
        if (dataTable.getOrder()[0] != 0) {
            //注意，页面上点击的排序和真实数据库中的排序并不一致，所以需要有一个映射关系
            String orderColumn = DatabaseUtil.getColumnName("report", dataTable.getOrder()[0]);
            logger.info("真正orderby的列:" + orderColumn);
            orderBy = String.valueOf(orderColumn) + " " + dataTable.getOrder_dir();
            PageHelper.orderBy(orderBy);
        }
        logger.info("分页参数1:"+dataTable.getPage_num()+","+dataTable.getPage_size());
        PageHelper.startPage(dataTable.getPage_num(), dataTable.getPage_size());
        //是否进行了查询
        boolean isSearch = false;
        //是
        if (dataTable.getSearch() != null && !dataTable.getSearch().equals("")) {
            isSearch = true;
            logger.info("查询的是："+dataTable.getSearch());
            reports = reportMapper.selectBySearch("%" + dataTable.getSearch() + "%", orderBy);
        }
        //否
        if (!isSearch) {
            reports = reportMapper.selectReportList();
        }
        //用PageInfo对结果进行包装
        PageInfo<Report> pageInfo = new PageInfo<Report>(reports);

        //封装数据给DataTables
        dataTable.setDraw(dataTable.getDraw());

        logger.info("分页参数2:"+pageInfo.getPageNum()+","+pageInfo.getPageSize());
        dataTable.setPage_size(pageInfo.getPageSize());
        dataTable.setPage_num(pageInfo.getPageNum());
//        dataTable.setIs_orderable(pageInfo.);
        dataTable.setData(pageInfo.getList());
        dataTable.setRecordsTotal((int) pageInfo.getTotal());
        dataTable.setRecordsFiltered(dataTable.getRecordsTotal());
        //返回数据到页面
        String jsonString = JSON.toJSONString(dataTable);
        return jsonString;
    }

    @Override
    public JSONObject getSewerageInfo() {
        Report report = reportMapper.selectCurMax();
        //解析这一条数据
        JSONArray data = new JSONArray();
        JSONObject v1 = new JSONObject();
        v1.put("name1","原水泵1");
        v1.put("value1",report.getRawWaterPumb1().equals((byte)1)?"运行中":"已停止");
        v1.put("name2","原水泵2");
        v1.put("value2",report.getRawWaterPumb2().equals((byte)1)?"运行中":"已停止");
        data.add(v1);
        JSONObject v2 = new JSONObject();
        v2.put("name1","过滤泵1");
        v2.put("value1",report.getFilterPumb1().equals((byte)1)?"运行中":"已停止");
        v2.put("name2","过滤泵2");
        v2.put("value2",report.getFilterPumb2().equals((byte)1)?"运行中":"已停止");
        data.add(v2);
        JSONObject v3 = new JSONObject();
        v3.put("name1","PAC计量泵1");
        v3.put("value1",report.getPacMeteringPumb1().equals((byte)1)?"运行中":"已停止");
        v3.put("name2","PAC计量泵2");
        v3.put("value2",report.getPacMeteringPumb2().equals((byte)1)?"运行中":"已停止");
        data.add(v3);
        JSONObject v4 = new JSONObject();
        v4.put("name1","PAM计量泵1");
        v4.put("value1",report.getPamMeteringPumb1().equals((byte)1)?"运行中":"已停止");
        v4.put("name2","PAM计量泵2");
        v4.put("value2",report.getPamMeteringPumb2().equals((byte)1)?"运行中":"已停止");
        data.add(v4);
        JSONObject v5 = new JSONObject();
        v5.put("name1","PAC搅拌机");
        v5.put("value1",report.getPacBlender().equals((byte)1)?"运行中":"已停止");
        v5.put("name2","PAM搅拌机");
        v5.put("value2",report.getPamBlender().equals((byte)1)?"运行中":"已停止");
        data.add(v5);
        JSONObject v6 = new JSONObject();
        v6.put("name1","反冲水泵");
        v6.put("value1",report.getBackFlushPumb().equals((byte)1)?"运行中":"已停止");
        v6.put("name2","排风机");
        v6.put("value2",report.getBlower().equals((byte)1)?"运行中":"已停止");
        data.add(v6);
        JSONObject v7 = new JSONObject();
        v7.put("name1","杀毒装置");
        v7.put("value1",report.getAntiVirusDevice().equals((byte)1)?"运行中":"已停止");
        v7.put("name2","电动阀");
        v7.put("value2",report.getElectricValve().equals((byte)1)?"已开启":"已关闭");
        data.add(v7);
        JSONObject v8 = new JSONObject();
        v8.put("name1","药箱液位");
        v8.put("value1",report.getMedicalKitIndex().equals((byte)1)?"低":"已停止");
        v8.put("name2","调节池");
        if(report.getRegulateLow().equals((byte)1)){
            v8.put("value2","低");
        }else if(report.getRegulateHigh().equals((byte)1)){
            v8.put("value2","高");
        }
        data.add(v8);
        JSONObject v9 = new JSONObject();
        v9.put("name1","中间池液位");
        if(report.getMiddleLow().equals((byte)1)){
            v9.put("value1","低");
        }else if(report.getMiddleMiddle().equals((byte)1)){
            v9.put("value1","中");
        }else if(report.getMiddleHigh().equals((byte)1)){
            v9.put("value1","高");
        }
        v9.put("name2","清水池液位");
        if(report.getWaterLow().equals((byte)1)){
            v9.put("value2","低");
        }else if(report.getWaterMiddle().equals((byte)1)){
            v9.put("value2","中");
        }else if(report.getWaterHigh().equals((byte)1)){
            v9.put("value2","高");
        }
        data.add(v9);
        JSONObject v10 = new JSONObject();
        v10.put("name1","反洗信号1");
        v10.put("value1",report.getBlackFlush1().equals((byte)1)?"开":"关");
        v10.put("name2","反洗信号2");
        v10.put("value2",report.getBlackFlush2().equals((byte)1)?"开":"关");
        data.add(v10);
        JSONObject v11 = new JSONObject();
        v11.put("name1","反洗信号3");
        v11.put("value1",report.getBlackFlush3().equals((byte)1)?"开":"关");
        v11.put("name2","反洗信号4");
        v11.put("value2",report.getBlackFlush4().equals((byte)1)?"开":"关");
        data.add(v11);
        JSONObject v12 = new JSONObject();
        v12.put("name1","泥位液位");
        v12.put("value1",report.getMudLevel());
        data.add(v12);
        JSONObject result = new JSONObject();
        result.put("flag",true);
        result.put("data",data);
        return result;
    }

    @Override
    public JSONObject getAnhuanInfo() {
        Report report = reportMapper.selectCurMax();
        //解析这一条数据
        JSONArray data = new JSONArray();
        JSONObject v1 = new JSONObject();
        v1.put("name","环境温度");
        v1.put("value",report.getEnvTemperature()+"℃");
        data.add(v1);
        JSONObject v2 = new JSONObject();
        v2.put("name","环境湿度");
        v2.put("value",report.getEnvDimidity()+"%RH");
        data.add(v2);
        JSONObject v3 = new JSONObject();
        v3.put("name","电缆温度");
        v3.put("value",report.getCableTemperature()+"℃");
        data.add(v3);
        JSONObject v4 = new JSONObject();
        v4.put("name","烟感信号");
        v4.put("value",report.getSmokeSignal().equals((byte)1)?"有":"无");
        data.add(v4);
        JSONObject v5 = new JSONObject();
        v5.put("name","水浸信号");
        v5.put("value",report.getWaterSignal().equals((byte)1)?"有":"无");
        data.add(v5);
        JSONObject result = new JSONObject();
        result.put("flag",true);
        result.put("data",data);
        return result;
    }

    @Override
    public JSONObject getMudData() throws ParseException {

        List<Report> lastTen = reportMapper.selectLastTen();
        JSONArray xArray = new JSONArray();
        JSONArray yArray = new JSONArray();
        //倒序的，所以倒着解析
        for(int i=lastTen.size()-1;i>=0;i--){
            Report report = lastTen.get(i);
            String realTime = DateUtils.sdf1.format(report.getCollectDate())+" "+DateUtils.sdf2.format(report.getCollectTime());
            //1522127816371 right
            //1521986327000
            long x = DateUtils.sdf3.parse(realTime).getTime();
            double y = report.getMudLevel();
            xArray.add(x);
            yArray.add(y);
        }
        JSONObject result = new JSONObject();
        result.put("x",xArray);
        result.put("y",yArray);
        System.out.println("x:"+xArray.toString());
        System.out.println("y:"+yArray.toString());
        return result;
    }

    @Override
    public void addRandom(double value) {
        Report report = new Report();
        report.setCollectDate(new Date());
        report.setCollectTime(new Date());
        report.setAntiVirusDevice(randomValue());
        report.setBackFlushPumb(randomValue());
        report.setBlackFlush1(randomValue());
        report.setBlackFlush2(randomValue());
        report.setBlackFlush3(randomValue());
        report.setBlackFlush4(randomValue());
        report.setBlower(randomValue());
        report.setCableTemperature(value);
        report.setElectricValve(randomValue());
        report.setEnvDimidity(value);
        report.setEnvTemperature(value);
        report.setFilterPumb1(randomValue());
        report.setFilterPumb2(randomValue());
        report.setMedicalKitIndex(randomValue());
        report.setMiddleHigh((byte)1);
        report.setMiddleLow((byte)0);
        report.setMiddleMiddle((byte)0);
        report.setPacBlender(randomValue());
        report.setPacMeteringPumb1(randomValue());
        report.setPacMeteringPumb2(randomValue());
        report.setPamBlender(randomValue());
        report.setPamMeteringPumb1(randomValue());
        report.setPamMeteringPumb2(randomValue());
        report.setRegulateHigh((byte)0);
        report.setRegulateLow((byte)1);
        report.setSmokeSignal(0.0);
        report.setSystemRun((byte)1);
        report.setWaterHigh((byte)0);
        report.setWaterLow((byte)0);
        report.setWaterMiddle((byte)1);
        report.setWaterSupplyPumb1(randomValue());
        report.setWaterSupplyPumb2(randomValue());
        report.setRawWaterPumb1(randomValue());
        report.setRawWaterPumb2(randomValue());
        report.setWaterSignal(0.0);
        report.setWaterSignal(0.0);
        report.setMudLevel(value);
        reportMapper.insert(report);
    }

    @Override
    public JSONObject getTemperatureData() throws ParseException {
        List<Report> lastTen = reportMapper.selectLastTen();
        JSONArray xArray = new JSONArray();
        JSONArray yArray = new JSONArray();
        //倒序的，所以倒着解析
        for(int i=lastTen.size()-1;i>=0;i--){
            Report report = lastTen.get(i);
            String realTime = DateUtils.sdf1.format(report.getCollectDate())+" "+DateUtils.sdf2.format(report.getCollectTime());
            //1522127816371 right
            //1521986327000
            long x = DateUtils.sdf3.parse(realTime).getTime();
            double y = report.getEnvTemperature();
            xArray.add(x);
            yArray.add(y);
        }
        JSONObject result = new JSONObject();
        result.put("x",xArray);
        result.put("y",yArray);
        System.out.println("x:"+xArray.toString());
        System.out.println("y:"+yArray.toString());
        return result;
    }

    @Override
    public JSONObject getHumidityData() throws ParseException {
        List<Report> lastTen = reportMapper.selectLastTen();
        JSONArray xArray = new JSONArray();
        JSONArray yArray = new JSONArray();
        //倒序的，所以倒着解析
        for(int i=lastTen.size()-1;i>=0;i--){
            Report report = lastTen.get(i);
            String realTime = DateUtils.sdf1.format(report.getCollectDate())+" "+DateUtils.sdf2.format(report.getCollectTime());
            //1522127816371 right
            //1521986327000
            long x = DateUtils.sdf3.parse(realTime).getTime();
            double y = report.getEnvDimidity();
            xArray.add(x);
            yArray.add(y);
        }
        JSONObject result = new JSONObject();
        result.put("x",xArray);
        result.put("y",yArray);
        System.out.println("x:"+xArray.toString());
        System.out.println("y:"+yArray.toString());
        return result;
    }

    @Override
    public JSONObject getSewerageStatus() {
        Report report = reportMapper.selectCurMax();
        //解析这一条数据
        JSONArray data = new JSONArray();
        data.add(getRunStatus("95", "360",report.getRawWaterPumb1()));
        data.add(getRunStatus("145", "360",report.getRawWaterPumb2()));
        data.add(getRunStatus("565", "220",report.getFilterPumb1()));
        data.add(getRunStatus("565", "320",report.getFilterPumb2()));
        data.add(getRunStatus("685", "130",report.getPacMeteringPumb1()));
        data.add(getRunStatus("680", "210",report.getPacMeteringPumb2()));
        data.add(getRunStatus("680", "300",report.getPamMeteringPumb1()));
        data.add(getRunStatus("675", "380",report.getPamMeteringPumb2()));
        data.add(getRunStatus("765", "155",report.getPacBlender()));
        data.add(getRunStatus("765", "340",report.getPamBlender()));
        data.add(getRunStatus("100", "600",report.getWaterSupplyPumb1()));
        data.add(getRunStatus("100", "700",report.getWaterSupplyPumb2()));
        data.add(getRunStatus("260", "670",report.getBackFlushPumb()));
        if(report.getRegulateHigh().equals((byte)1)){
            data.add(getRunStatus("123","250","高水位"));
        }else if(report.getRegulateLow().equals((byte)1)){
            data.add(getRunStatus("123","250","低水位"));
        }
        if(report.getMiddleLow().equals((byte)1)){
            data.add(getRunStatus("480","300","低水位"));
        }else if(report.getMiddleMiddle().equals((byte)1)){
            data.add(getRunStatus("480","300","中水位"));
        }else if(report.getMiddleHigh().equals((byte)1)){
            data.add(getRunStatus("480","300","高水位"));
        }
        if(report.getWaterLow().equals((byte)1)){
            data.add(getRunStatus("180","620","低水位"));
        }else if(report.getWaterMiddle().equals((byte)1)){
            data.add(getRunStatus("180","620","中水位"));
        }else if(report.getWaterHigh().equals((byte)1)){
            data.add(getRunStatus("180","620","高水位"));
        }
        JSONObject result = new JSONObject();
        result.put("flag",true);
        result.put("data",data);
        return result;
    }

    private JSONObject getRunStatus(String x,String y,String status) {
        JSONObject device = new JSONObject();
        device.put("x",x);
        device.put("y",y);
        device.put("status",status);
        device.put("color","blue");
        return device;
    }

    /**
     * 封装单个设备在画布上的显示状态
     * @return
     */
    private JSONObject getRunStatus(String x,String y,Byte status) {
        boolean flag = status.equals((byte)1);
        JSONObject device = new JSONObject();
        device.put("x",x);
        device.put("y",y);
        device.put("status",flag?"运行中":"停止");
        device.put("color",flag?"blue":"red");
        return device;
    }

    public Byte randomValue(){
        Random random = new Random();
        int value = random.nextInt();
        if(value%2==0){
            return (byte)0;
        }else{
            return (byte)1;
        }
    }
}
