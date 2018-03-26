package cn.com.retrans.service.impl;

import cn.com.retrans.dao.ReportMapper;
import cn.com.retrans.pojo.Report;
import cn.com.retrans.service.ReportService;
import cn.com.retrans.utils.Constants;
import cn.com.retrans.utils.DataTablePageUtil;
import cn.com.retrans.utils.DatabaseUtil;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

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
        v10.put("name1","反水信号1");
        v10.put("value1",report.getBlackFlush1().equals((byte)1)?"开":"关");
        v10.put("name2","反水信号2");
        v10.put("value2",report.getBlackFlush2().equals((byte)1)?"开":"关");
        data.add(v10);
        JSONObject v11 = new JSONObject();
        v11.put("name1","反水信号3");
        v11.put("value1",report.getBlackFlush3().equals((byte)1)?"开":"关");
        v11.put("name2","反水信号4");
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
}
