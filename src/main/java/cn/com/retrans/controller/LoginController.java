package cn.com.retrans.controller;

import cn.com.retrans.service.ReportService;
import cn.com.retrans.utils.MyMD5;
import com.alibaba.fastjson.JSONObject;
import com.google.code.kaptcha.Constants;
import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.text.DecimalFormat;
import java.util.Random;

/**
 * Created by mingyue on 2018/1/23.
 */
@Controller
public class LoginController {
    @Autowired
    private ReportService reportService;
    /**
     * 用户登录
     */
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject login(HttpServletRequest request, HttpServletResponse response) {
        JSONObject flag = new JSONObject();

//        String verifyCode = request.getParameter("verifyCode");
//        HttpSession session = request.getSession();
//        String code = (String) session.getAttribute(Constants.KAPTCHA_SESSION_KEY);
//        System.out.println("取出的验证码:" + code);
//        //首先校验验证码
//        if (!verifyCode.equals(code)) {
//            flag.put("flag", false);
//            flag.put("error", "验证码输入有误");
//            return flag;
//        }
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        password = MyMD5.md5(password);

        UsernamePasswordToken token = new UsernamePasswordToken(username, password);
        token.setRememberMe(true);
        System.out.println("为了验证登录用户而封装的token为" + ReflectionToStringBuilder.toString(token, ToStringStyle.MULTI_LINE_STYLE));
        //获取当前的Subject
        Subject currentUser = SecurityUtils.getSubject();
        try {
            //在调用了login方法后,SecurityManager会收到AuthenticationToken,并将其发送给已配置的Realm执行必须的认证检查
            //每个Realm都能在必要时对提交的AuthenticationTokens作出反应
            //所以这一步在调用login(token)方法时,它会走到MyRealm.doGetAuthenticationInfo()方法中,具体验证方式详见此方法
            System.out.println("对用户[" + username + "]进行登录验证..验证开始");
            currentUser.login(token);
            System.out.println("对用户[" + username + "]进行登录验证..验证通过");
        } catch (UnknownAccountException uae) {
            System.out.println("对用户[" + username + "]进行登录验证..验证未通过,未知账户");
            flag.put("flag", false);
            flag.put("error", "账户名不存在");
        } catch (IncorrectCredentialsException ice) {
            System.out.println("对用户[" + username + "]进行登录验证..验证未通过,错误的凭证");
            flag.put("flag", false);
            flag.put("error", "密码错误");
        } catch (LockedAccountException lae) {
            System.out.println("对用户[" + username + "]进行登录验证..验证未通过,账户已锁定");
            flag.put("flag", false);
            flag.put("error", "账户已锁定");
        } catch (ExcessiveAttemptsException eae) {
            System.out.println("对用户[" + username + "]进行登录验证..验证未通过,错误次数过多");
            flag.put("flag", false);
            flag.put("error", "密码错误次数过多");
        } catch (AuthenticationException ae) {
            //通过处理Shiro的运行时AuthenticationException就可以控制用户登录失败或密码错误时的情景
            System.out.println("对用户[" + username + "]进行登录验证..验证未通过,堆栈轨迹如下");
            ae.printStackTrace();
            flag.put("flag", false);
            flag.put("error", ae.getMessage());
        }
        //验证是否登录成功
        if (currentUser.isAuthenticated()) {
//            Session session = currentUser.getSession();
            //对Session进行管理
            flag.put("flag", true);
            System.out.println("用户[" + username + "]登录认证通过(这里可以进行一些认证通过后的一些系统参数初始化操作)");
        } else {
            token.clear();
            if (!flag.containsKey("flag")) {
                flag.put("flag", false);
            }
            if (!flag.containsKey("error")) {
                flag.put("error", "登陆认证错误");
            }
        }
        //启动一个测试服务，每一分钟插入一条数据
//        Random random = new Random(8);
//        DecimalFormat df = new DecimalFormat("0.0");
//        Thread thread = new Thread(new Runnable() {
//            @Override
//            public void run() {
//                while(true){
//                    double value = Double.valueOf(df.format(random.nextDouble()*10));
//                    reportService.addRandom(value);
//                    try {
//                        Thread.sleep(300000);
//                    } catch (InterruptedException e) {
//                        e.printStackTrace();
//                    }
//                }
//
//            }
//        });
//        thread.start();
        return flag;
    }

    @RequestMapping(value = "/main",method = RequestMethod.GET)
    public String main(HttpServletRequest request, HttpServletResponse response) {
        response.setHeader("Access-Control-Allow-Origin","*");
        return "monitor/integrate";
    }

    @RequestMapping(value = "/index",method = RequestMethod.GET)
    public String index(HttpServletRequest request, HttpServletResponse response) {
        response.setHeader("Access-Control-Allow-Origin","*");
        return "index";
    }


    /**
     * 用户登出
     */
    @RequestMapping("/logout")
    public String logout(HttpServletRequest request) {
        SecurityUtils.getSubject().logout();
        return InternalResourceViewResolver.REDIRECT_URL_PREFIX + "/";
    }
}
