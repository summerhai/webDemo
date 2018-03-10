package cn.com.retrans.service;

import cn.com.retrans.pojo.Event;

import java.util.List;

public interface EventService {
    List<Event> getEventList();
    List<Event> getEventListBySearch(String search,String orderBy);
}
