package cn.com.retrans.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by mingyue on 2018/2/3.
 */
@Controller
@RequestMapping("/monitor")
public class MonitorController {
    @RequestMapping(value = "/sewerage")
    public String main(HttpServletRequest request, HttpServletResponse response) {
        return "monitor/sewerage";
    }

}
