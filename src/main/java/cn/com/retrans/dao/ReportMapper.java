package cn.com.retrans.dao;

import cn.com.retrans.pojo.Report;

import java.util.List;

public interface ReportMapper {
    int deleteByPrimaryKey(String id);

    int insert(Report record);

    int insertSelective(Report record);

    Report selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Report record);

    int updateByPrimaryKey(Report record);

    List<Report> selectBySearch(String search, String orderBy);

    List<Report> selectReportList();
}