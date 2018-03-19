package cn.com.retrans.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by mingyue on 2018/2/3.
 */
@Controller
@RequestMapping("/admin")
public class MonitorController {
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
}
