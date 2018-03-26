package cn.com.retrans.dao;

import cn.com.retrans.pojo.Report;

import java.util.List;

public interface ReportMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Report record);

    int insertSelective(Report record);

    Report selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Report record);

    int updateByPrimaryKey(Report record);

    List<Report> selectBySearch(String s, String orderBy);

    List<Report> selectReportList();

    Report selectCurMax();
}