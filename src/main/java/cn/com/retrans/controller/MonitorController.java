package cn.com.retrans.controller;

import cn.com.retrans.service.ReportService;
import com.alibaba.fastjson.JSONObject;
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
public class MonitorController {
    @Autowired
    private ReportService reportService;

    @RequestMapping(value = "/sewerage",method = RequestMethod.GET)
    public String sewerage(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("进入sewerage");
        return "monitor/sewerage";
    }

    @RequestMapping(value = "/integrate",method = RequestMethod.GET)
    public String integrate(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("进入integrate");
        return "monitor/integrate";
    }

    @RequestMapping(value = "/integrate/sewerage",method = RequestMethod.GET)
    @ResponseBody
    public JSONObject sewerageInfo(){
        System.out.println("获取综合监控中污水单元的数据");
        JSONObject result = reportService.getSewerageInfo();
        return result;
    }

    @RequestMapping(value = "/sewerage/status",method = RequestMethod.GET)
    @ResponseBody
    public JSONObject sewerageStatus(){
        System.out.println("获取污水单元监控中的数据");
        JSONObject result = reportService.getSewerageStatus();
        return result;
    }

    @RequestMapping(value = "/integrate/anhuan",method = RequestMethod.GET)
    @ResponseBody
    public JSONObject anhuanInfo(){
        System.out.println("获取综合监控中安环监控的数据");
        JSONObject result = reportService.getAnhuanInfo();
        return result;
    }
}
