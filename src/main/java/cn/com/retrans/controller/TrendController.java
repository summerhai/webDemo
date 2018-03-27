package cn.com.retrans.controller;

import cn.com.retrans.service.ReportService;
import com.alibaba.fastjson.JSONObject;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.ParseException;

/**
 * Created by mingyue on 2018/2/3.
 */
@Controller
@RequestMapping("/admin")
public class TrendController {

    Logger logger = Logger.getLogger(TrendController.class);
    @Autowired
    private ReportService reportService;

    @RequestMapping(value = "/trend",method = RequestMethod.GET)
    public String trend() {
        logger.info("进入trend");
        return "trend/trend";
    }

    @RequestMapping(value = "/mudData",method = RequestMethod.GET)
    @ResponseBody
    public JSONObject mudData() throws ParseException {
        logger.info("获取污泥液位");
        JSONObject resultObject = reportService.getMudData();
        return resultObject;
    }

}
