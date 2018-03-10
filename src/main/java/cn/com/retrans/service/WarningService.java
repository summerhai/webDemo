package cn.com.retrans.service;

import cn.com.retrans.pojo.Warning;

import java.util.List;

public interface WarningService {
    List<Warning> getWarningList();

    List<Warning> getWarningListBySearch(String s, String orderBy);
}
