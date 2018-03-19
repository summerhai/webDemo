package cn.com.retrans.controller;

import cn.com.retrans.pojo.Warning;
import cn.com.retrans.service.WarningService;
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
import java.util.Date;
import java.util.List;

/**
 * Created by mingyue on 2018/2/3.
 */
@Controller
@RequestMapping("/admin")
public class WarningController {
    Logger logger = Logger.getLogger(WarningController.class);
    @Autowired
    private WarningService warningService;

    @RequestMapping(value = "/warning",method = RequestMethod.GET)
    public String warning(HttpServletRequest request, HttpServletResponse response) {
        logger.info("进入warning");
        return "warning/warning";
    }

    @RequestMapping(value = "/warning/list",method = RequestMethod.POST)
    @ResponseBody
    public String getWarningList(HttpServletRequest request, HttpServletResponse response) {
        logger.info("进入warning list");
        String resultString = warningService.getWarningList(request);
        return resultString;
    }

}
