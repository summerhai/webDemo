package cn.com.retrans.controller;

import cn.com.retrans.pojo.Event;
import cn.com.retrans.service.EventService;
import cn.com.retrans.utils.DataTablePageUtil;
import cn.com.retrans.utils.DatabaseUtil;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.json.JsonObject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by mingyue on 2018/2/3.
 */
@Controller
@RequestMapping("/admin")
public class EventController {
    Logger logger = Logger.getLogger(Event.class);
    @Autowired
    private EventService eventService;

    @RequestMapping(value = "/event",method = RequestMethod.GET)
    public String event(HttpServletRequest request, HttpServletResponse response) {
        logger.info("进入event");
        return "event/event";
    }

    @RequestMapping(value = "/event/list",method = RequestMethod.POST)
    @ResponseBody
    public String getEventList(HttpServletRequest request) {
        logger.info("进入event list");
        String resultString = eventService.getEventList(request);
        return resultString;
    }

}
