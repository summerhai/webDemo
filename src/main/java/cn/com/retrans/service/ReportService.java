package cn.com.retrans.service;

import com.alibaba.fastjson.JSONObject;

import javax.servlet.http.HttpServletRequest;

public interface ReportService {

    String getReportList(HttpServletRequest request);

    JSONObject getSewerageInfo();

    JSONObject getAnhuanInfo();
}
