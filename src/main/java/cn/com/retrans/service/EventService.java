package cn.com.retrans.service;

import cn.com.retrans.pojo.Event;
import com.alibaba.fastjson.JSONObject;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public interface EventService {
    String getEventList(HttpServletRequest request);
    List<Event> getEventListBySearch(String search,String orderBy);
}
