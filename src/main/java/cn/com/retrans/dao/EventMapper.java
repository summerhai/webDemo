package cn.com.retrans.dao;

import cn.com.retrans.pojo.Event;

import java.util.List;

public interface EventMapper {
    int deleteByPrimaryKey(String id);

    int insert(Event record);

    int insertSelective(Event record);

    Event selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Event record);

    int updateByPrimaryKey(Event record);

    List<Event> selectEventList();

    List<Event> selectEventListBySearch(String search, String orderBy);
}