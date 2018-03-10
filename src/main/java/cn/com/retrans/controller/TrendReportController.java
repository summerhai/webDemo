package cn.com.retrans.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by mingyue on 2018/2/3.
 */
@Controller
@RequestMapping("/trendReport")
public class TrendReportController {
    @RequestMapping(value = "/trendReport")
    public String trendReport(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("进入trendReport");
        return "trend/trendReport";
    }

}