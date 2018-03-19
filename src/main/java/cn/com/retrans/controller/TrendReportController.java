package cn.com.retrans.controller;

import cn.com.retrans.pojo.Report;
import cn.com.retrans.pojo.Report;
import cn.com.retrans.service.ReportService;
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

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by mingyue on 2018/2/3.
 */
@Controller
@RequestMapping("/admin")
public class TrendReportController {
    Logger logger = Logger.getLogger(TrendReportController.class);
    @Autowired
    private ReportService reportService;
    
    @RequestMapping(value = "/trendReport",method = RequestMethod.GET)
    public String trendReport(HttpServletRequest request, HttpServletResponse response) {
        logger.info("进入trendReport");
        return "trend/trendReport";
    }

    @RequestMapping(value = "/trendReport/tableData",method = RequestMethod.POST)
    @ResponseBody
    public String getReportList(HttpServletRequest request) {
        logger.info("进入trendReport tableData");
        String resultString = reportService.getReportList(request);
        return resultString;
    }

}
