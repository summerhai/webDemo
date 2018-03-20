package cn.com.retrans.controller;

import cn.com.retrans.service.ReportService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by mingyue on 2018/2/3.
 */
@Controller
@RequestMapping("/admin")
public class TrendController {
    Logger logger = Logger.getLogger(TrendController.class);
    
    @RequestMapping(value = "/trend",method = RequestMethod.GET)
    public String trend(HttpServletRequest request, HttpServletResponse response) {
        logger.info("进入trend");
        return "trend/trend";
    }
}
