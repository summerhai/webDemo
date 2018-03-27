package cn.com.retrans.service;

import com.alibaba.fastjson.JSONObject;

import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;

public interface ReportService {

    String getReportList(HttpServletRequest request);

    JSONObject getSewerageInfo();

    JSONObject getAnhuanInfo();

    JSONObject getMudData() throws ParseException;

    void addRandom(double value);
}
