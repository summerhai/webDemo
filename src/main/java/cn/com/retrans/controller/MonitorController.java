package cn.com.retrans.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by mingyue on 2018/2/3.
 */
@Controller
@RequestMapping("/admin")
public class MonitorController {
    @RequestMapping(value = "/sewerage")
    public String sewerage(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("进入sewerage");
        return "monitor/sewerage";
    }

    @RequestMapping(value = "/integrate")
    public String integrate(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("进入integrate");
        return "monitor/integrate";
    }
}
