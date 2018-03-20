<%--
  Created by IntelliJ IDEA.
  User: mingyue
  Date: 2018/2/3
  Time: 11:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<header class="main-header">
    <!-- Logo -->
    <a href="index2.html" class="logo">
        <!-- mini logo for sidebar mini 50x50 pixels -->
        <span class="logo-mini"><b>A</b>LT</span>
        <!-- logo for regular state and mobile devices -->
        <span class="logo-lg"><b>安环监测平台</b></span>
    </a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
        <!-- Sidebar toggle button-->
        <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
            <span class="sr-only">Toggle navigation</span>
        </a>

        <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
                <!-- Messages: style can be found in dropdown.less-->
                <li class="dropdown messages-menu">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <i class="fa fa-envelope-o"></i>
                        <span class="label label-success">4</span>
                    </a>
                    <ul class="dropdown-menu">
                        <li class="header">你有4条信息</li>
                        <li>
                            <!-- inner menu: contains the actual data -->
                            <ul class="menu">
                                <li><!-- start message -->
                                    <a href="#">
                                        <div class="pull-left">
                                            <img src="<%=path%>/static/AdminLTE-2.4.2/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
                                        </div>
                                        <h4>
                                            信息标题1
                                            <small><i class="fa fa-clock-o"></i> 5 mins</small>
                                        </h4>
                                        <p>信息1</p>
                                    </a>
                                </li>
                                <!-- end message -->
                                <li>
                                    <a href="#">
                                        <div class="pull-left">
                                            <img src="<%=path%>/static/AdminLTE-2.4.2/dist/img/user3-128x128.jpg" class="img-circle" alt="User Image">
                                        </div>
                                        <h4>
                                            信息标题2
                                            <small><i class="fa fa-clock-o"></i> 2 hours</small>
                                        </h4>
                                        <p>消息2</p>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <div class="pull-left">
                                            <img src="<%=path%>/static/AdminLTE-2.4.2/dist/img/user4-128x128.jpg" class="img-circle" alt="User Image">
                                        </div>
                                        <h4>
                                            信息标题3
                                            <small><i class="fa fa-clock-o"></i> 今天</small>
                                        </h4>
                                        <p>信息3</p>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <div class="pull-left">
                                            <img src="<%=path%>/static/AdminLTE-2.4.2/dist/img/user3-128x128.jpg" class="img-circle" alt="User Image">
                                        </div>
                                        <h4>
                                            信息标题4
                                            <small><i class="fa fa-clock-o"></i> 昨天</small>
                                        </h4>
                                        <p>信息4</p>
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li class="footer"><a href="#">查看全部</a></li>
                    </ul>
                </li>
                <!-- Notifications: style can be found in dropdown.less -->
                <li class="dropdown notifications-menu">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <i class="fa fa-bell-o"></i>
                        <span class="label label-warning">10</span>
                    </a>
                    <ul class="dropdown-menu">
                        <li class="header">有10条未读通知</li>
                        <li>
                            <!-- inner menu: contains the actual data -->
                            <ul class="menu">
                                <li>
                                    <a href="#">
                                        <i class="fa fa-users text-aqua"></i> 消息1
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <i class="fa fa-warning text-yellow"></i> 消息2
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <i class="fa fa-users text-red"></i> 消息3
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <i class="fa fa-shopping-cart text-green"></i> 消息4
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <i class="fa fa-user text-red"></i> 消息5
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li class="footer"><a href="#">查看全部</a></li>
                    </ul>
                </li>
                <!-- Tasks: style can be found in dropdown.less -->
                <li class="dropdown tasks-menu">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <i class="fa fa-flag-o"></i>
                        <span class="label label-danger">2</span>
                    </a>
                    <ul class="dropdown-menu">
                        <li class="header">你有两个待做任务</li>
                        <li>
                            <!-- inner menu: contains the actual data -->
                            <ul class="menu">
                                <li><!-- Task item -->
                                    <a href="#">
                                        <h3>
                                            任务1
                                            <small class="pull-right">20%</small>
                                        </h3>
                                        <div class="progress xs">
                                            <div class="progress-bar progress-bar-aqua" style="width: 20%" role="progressbar"
                                                 aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                                                <span class="sr-only">完成20%</span>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <!-- end task item -->
                                <li><!-- Task item -->
                                    <a href="#">
                                        <h3>
                                            任务2
                                            <small class="pull-right">40%</small>
                                        </h3>
                                        <div class="progress xs">
                                            <div class="progress-bar progress-bar-green" style="width: 40%" role="progressbar"
                                                 aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                                                <span class="sr-only">完成40%</span>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <!-- end task item -->
                            </ul>
                        </li>
                        <li class="footer">
                            <a href="#">View all tasks</a>
                        </li>
                    </ul>
                </li>
                <!-- User Account: style can be found in dropdown.less -->
                <li class="dropdown user user-menu">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <img src="<%=path%>/static/AdminLTE-2.4.2/dist/img/user2-160x160.jpg" class="user-image" alt="User Image">
                        <span class="hidden-xs">系统管理员</span>
                    </a>
                    <ul class="dropdown-menu">
                        <!-- User image -->
                        <li class="user-header">
                            <img src="<%=path%>/static/AdminLTE-2.4.2/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">

                            <p>
                                系统管理员
                            </p>
                        </li>
                        <!-- Menu Body -->
                        <li class="user-body">
                            <%--<div class="row">--%>
                                <%--<div class="col-xs-4 text-center">--%>
                                    <%--<a href="#">个人信息</a>--%>
                                <%--</div>--%>
                                <%--<div class="col-xs-4 text-center">--%>
                                    <%--<a href="#">Sales</a>--%>
                                <%--</div>--%>
                                <%--<div class="col-xs-4 text-center">--%>
                                    <%--<a href="#">Friends</a>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                            <!-- /.row -->
                        </li>
                        <!-- Menu Footer-->
                        <li class="user-footer">
                            <div class="pull-left">
                                <a href="#" class="btn btn-default btn-flat">个人中心</a>
                            </div>
                            <div class="pull-right">
                                <a href="<%=path%>/logout" class="btn btn-default btn-flat">退出登陆</a>
                            </div>
                        </li>
                    </ul>
                </li>
                <%--<!-- Control Sidebar Toggle Button -->--%>
                <%--<li>--%>
                    <%--<a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>--%>
                <%--</li>--%>
            </ul>
        </div>
    </nav>
</header>
