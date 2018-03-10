package cn.com.retrans.service.impl;

import cn.com.retrans.dao.WarningMapper;
import cn.com.retrans.pojo.Warning;
import cn.com.retrans.service.WarningService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class WarningServiceImpl implements WarningService{

    @SuppressWarnings("SpringJavaAutowiringInspection")
    @Resource
    private WarningMapper warningMapper;
    @Override
    public List<Warning> getWarningList() {
        return warningMapper.selectWarningList();
    }

    @Override
    public List<Warning> getWarningListBySearch(String search, String orderBy) {
        return warningMapper.selectWarningListBySearch(search,orderBy);
    }
}
