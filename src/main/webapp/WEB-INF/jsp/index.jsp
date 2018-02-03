<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script>var CONTEXTPATH = "${pageContext.request.contextPath}" </script>

<!DOCTYPE HTML>
<html>

<head>
  <title>登录</title>

  <link href="static/css/style.css" rel="stylesheet" type="text/css" media="all" />
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta name="keywords" content="后台登录" />

</head>

<body>

<div class="login-form">

    <span class="logo"><img src=" static/imgs/logo.png" alt="logo" /></span>

  <h2>
    <b>安全环境监测SEMS®</b>一体化平台
  </h2>
  <!--<h1>登录</h1>-->
  <div class="login-top">
    <form>
      <div class="login-ic">
        <i></i>
        <input id="username" type="text" value="" placeholder="用户名" />
        <div class="clear"> </div>
      </div>
      <div class="login-ic">
        <i class="icon"></i>
        <input id="password"      type="password" value="" placeholder="请输入密码"/>
        <div class="clear"> </div>
      </div>
      <div class="log-bwn" id="loginButton">
        <input type="button" value="登录">
      </div>
    </form>
  </div>
  <p class="copy">河北瑞程思科技有限公司</p>
</div>

</body>
<script src="static/AdminLTE-2.4.2/bower_components/jquery/dist/jquery.min.js"></script>
<script src="static/script/login/login.js"></script>
<script src="static/layer/layer.js"></script>

</html>