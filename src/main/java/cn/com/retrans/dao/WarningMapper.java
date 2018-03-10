package cn.com.retrans.dao;

import cn.com.retrans.pojo.Warning;

import java.util.List;

public interface WarningMapper {
    int deleteByPrimaryKey(String id);

    int insert(Warning record);

    int insertSelective(Warning record);

    Warning selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Warning record);

    int updateByPrimaryKey(Warning record);

    List<Warning> selectWarningList();

    List<Warning> selectWarningListBySearch(String search, String orderBy);
}