package cn.com.retrans.service.impl;

import cn.com.retrans.dao.EventMapper;
import cn.com.retrans.pojo.Event;
import cn.com.retrans.service.EventService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class EventServiceImpl implements EventService {
    @SuppressWarnings("SpringJavaAutowiringInspection")
    @Resource
    private EventMapper eventMapper;

    @Override
    public List<Event> getEventList() {
        return eventMapper.selectEventList();
    }

    @Override
    public List<Event> getEventListBySearch(String search, String orderBy) {
        return eventMapper.selectEventListBySearch(search,orderBy);
    }
}
