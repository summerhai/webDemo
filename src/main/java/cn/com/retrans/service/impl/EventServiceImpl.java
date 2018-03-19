package cn.com.retrans.service.impl;

import cn.com.retrans.dao.EventMapper;
import cn.com.retrans.pojo.Event;
import cn.com.retrans.service.EventService;
import cn.com.retrans.utils.DataTablePageUtil;
import cn.com.retrans.utils.DatabaseUtil;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Service
public class EventServiceImpl implements EventService {
    Logger logger = Logger.getLogger(EventServiceImpl.class);
    @SuppressWarnings("SpringJavaAutowiringInspection")
    @Resource
    private EventMapper eventMapper;

    @Override
    public String getEventList(HttpServletRequest request) {
        //使用DataTables的属性接收分页数据
        DataTablePageUtil<Event> dataTable = new DataTablePageUtil<Event>(request);
        //还是使用List，方便后期用到
        List<Event> events = new ArrayList<>();
        //开始分页：PageHelper会处理接下来的第一个查询
        String orderBy = null;
        if (dataTable.getOrder()[0] != 0) {
            //注意，页面上点击的排序和真实数据库中的排序并不一致，所以需要有一个映射关系
            String orderColumn = DatabaseUtil.getColumnName("event", dataTable.getOrder()[0]);
            logger.info("真正orderby的列:" + orderColumn);
            orderBy = String.valueOf(orderColumn) + " " + dataTable.getOrder_dir();
            PageHelper.orderBy(orderBy);
        }
        logger.info("分页参数1:"+dataTable.getPage_num()+","+dataTable.getPage_size());
        PageHelper.startPage(dataTable.getPage_num(), dataTable.getPage_size());
        //是否进行了查询
        boolean isSearch = false;
        //是
        if (dataTable.getSearch() != null && !dataTable.getSearch().equals("")) {
            isSearch = true;
            logger.info("查询的是："+dataTable.getSearch());
            events = eventMapper.selectEventListBySearch("%" + dataTable.getSearch() + "%", orderBy);
        }
        //否
        if (!isSearch) {
            events = eventMapper.selectEventList();
        }
        //用PageInfo对结果进行包装
        PageInfo<Event> pageInfo = new PageInfo<Event>(events);

        //封装数据给DataTables
        dataTable.setDraw(dataTable.getDraw());

        logger.info("分页参数2:"+pageInfo.getPageNum()+","+pageInfo.getPageSize());
        dataTable.setPage_size(pageInfo.getPageSize());
        dataTable.setPage_num(pageInfo.getPageNum());
//        dataTable.setIs_orderable(pageInfo.);
        dataTable.setData(pageInfo.getList());
        dataTable.setRecordsTotal((int) pageInfo.getTotal());
        dataTable.setRecordsFiltered(dataTable.getRecordsTotal());
        //返回数据到页面
        String jsonString = JSON.toJSONString(dataTable);
        return jsonString;
    }

    @Override
    public List<Event> getEventListBySearch(String search, String orderBy) {
        return eventMapper.selectEventListBySearch(search,orderBy);
    }
}
