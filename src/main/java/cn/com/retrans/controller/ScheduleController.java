package cn.com.retrans.controller;

import cn.com.retrans.pojo.Warning;
import cn.com.retrans.service.WarningService;
import cn.com.retrans.utils.DataTablePageUtil;
import cn.com.retrans.utils.DatabaseUtil;
import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by mingyue on 2018/2/3.
 */
@Controller
@RequestMapping("/schedule")
public class ScheduleController {

    @RequestMapping(value = "/schedule")
    public String schedule(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("进入schedule");
        return "schedule/schedule";
    }

}
