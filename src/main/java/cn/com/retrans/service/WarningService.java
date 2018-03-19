package cn.com.retrans.service;

import cn.com.retrans.pojo.Warning;
import com.alibaba.fastjson.JSONObject;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public interface WarningService {
    String getWarningList(HttpServletRequest request);

    List<Warning> getWarningListBySearch(String s, String orderBy);
}
