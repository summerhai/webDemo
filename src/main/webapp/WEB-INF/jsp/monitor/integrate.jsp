<%
    String path = request.getContextPath();
    response.setHeader("Access-Control-Allow-Origin", "*");
%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<script>var CONTEXTPATH = "${pageContext.request.contextPath}" </script>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>综合监控</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <%@include file="/WEB-INF/jsp/common/commonCss.jsp" %>
    <%--<link rel="stylesheet" href="<%=path%>/static/css/common.css">--%>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<%@include file="/WEB-INF/jsp/tmpl/monitorTmpl.jsp" %>
<div class="wrapper">
    <%@include file="/WEB-INF/jsp/common/header.jsp" %>
    <!-- Left side column. contains the logo and sidebar -->
    <%@include file="/WEB-INF/jsp/common/left.jsp" %>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <%--<h1>--%>
            <%--Advanced Form Elements--%>
            <%--<small>Preview</small>--%>
            <%--</h1>--%>
            <ol class="breadcrumb">
                <li><a href="<%=path%>/main"><i class="fa fa-dashboard"></i> 首页</a></li>
                <li><a href="<%=path%>/admin/integrate">监控</a></li>
                <li><a href="<%=path%>/admin/integrate">综合监控</a></li>
            </ol>
        </section>
        <section class="content">
            <div class="row">
                <h2 style="text-align: center;"><strong>综合监控页面</strong></h2>
                <div style="display: inline-block;padding-left: 10px;float: right">
                    <span id="curTime" style="font-size: 20px"></span>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6" style="width: 33%;border:1px solid #F00;height: 127%">
                    <div class="box box-danger" style="background:rgb(236, 240, 245);border-top-color:rgb(236, 240, 245)">
                        <div class="box-header">
                            <h3 align="center" style="font-weight:bold;position: relative">污水处理回用单元</h3>
                        </div>
                        <!-- /.box-body -->
                        <div class="box-body">
                            <!-- Date dd/mm/yyyy -->
                            <div class="form-group">
                                <label style="padding-left: 15%">使用状态:</label>
                                <label style="color:green">运行中</label>

                                <label style="padding-left: 25%">报警:</label>
                                <label style="color:green">无</label>
                                <table class="table table-bordered text-center">
                                    <tbody>
                                    <tr>
                                        <td>
                                            <button type="button" class="btn btn-block btn-info btn-lg">系统运行
                                            </button>
                                        </td>
                                        <td>
                                            <button type="button" class="btn btn-block btn-danger btn-lg">系统停止
                                            </button>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                                <%--每隔一段时间去刷新数据--%>

                                <table class="table table-bordered text-center" id="sewerage1">
                                    <tr>
                                        <th>名称</th>
                                        <th>状态</th>
                                        <th>名称</th>
                                        <th>状态</th>
                                    </tr>
                                    <tbody id="sewerage1Body">

                                    </tbody>
                                </table>
                                <!-- /.input group -->
                            </div>
                        </div>
                    </div>
                    <!-- /.box -->
                </div>
                <div class="col-md-6" style="width: 33%;height: 127%;border:1px solid #F00">
                    <div class="box box-danger" style="background:rgb(236, 240, 245);border-top-color:rgb(236, 240, 245)">
                        <div class="box-header">
                            <h3 align="center" style="font-weight:bold">排风除臭单元</h3>
                        </div>
                        <!-- /.box-body -->
                        <div class="box-body">
                            <!-- Date dd/mm/yyyy -->
                            <div class="form-group">
                                <label style="padding-left: 15%">使用状态:</label>
                                <label style="color:green">运行中</label>

                                <label style="padding-left: 25%">报警:</label>
                                <label style="color:green">无</label>
                                <table class="table table-bordered text-center">
                                    <tbody>
                                    <tr>
                                        <td>
                                            <button type="button" class="btn btn-block btn-info btn-lg">系统运行
                                            </button>
                                        </td>
                                        <td>
                                            <button type="button" class="btn btn-block btn-danger btn-lg">系统停止
                                            </button>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                                <table class="table table-bordered text-center">
                                    <tr>
                                        <th>名称</th>
                                        <th>状态</th>
                                    </tr>
                                    <tr>
                                        <td>名称1</td>
                                        <td>状态1</td>
                                    </tr>
                                    <tr>
                                        <td>名称1</td>
                                        <td>状态1</td>
                                    </tr>

                                </table>
                                <!-- /.input group -->
                            </div>
                        </div>
                    </div>
                    <!-- /.box -->
                </div>
                <div class="col-md-6" style="width: 33%;height: 127%;border:1px solid #F00">
                    <div class="box box-danger" style="background:rgb(236, 240, 245);border-top-color:rgb(236, 240, 245)">
                        <div class="box-header">
                            <h3 align="center" style="font-weight:bold">安环监测单元</h3>
                        </div>
                        <!-- /.box-body -->
                        <div class="box-body">
                            <!-- Date dd/mm/yyyy -->
                            <div class="form-group">
                                <label style="padding-left: 40%">安环状态:</label>
                                <label style="color:green">正常</label>
                                <table class="table table-bordered text-center">
                                    <tr>
                                        <th>内容</th>
                                        <th>数值</th>
                                        <th>状态</th>
                                    </tr>
                                    <tr>
                                        <td>名称1</td>
                                        <td>状态1</td>
                                        <td>名称1</td>
                                    </tr>
                                    <tr>
                                        <td>名称1</td>
                                        <td>状态1</td>
                                        <td>名称1</td>
                                    </tr>
                                    <tr>
                                        <td>名称1</td>
                                        <td>状态1</td>
                                        <td>名称1</td>
                                    </tr>
                                    <tr>
                                        <td>名称1</td>
                                        <td>状态1</td>
                                        <td>名称1</td>
                                    </tr>
                                    <tr>
                                        <td>名称1</td>
                                        <td>状态1</td>
                                        <td>名称1</td>
                                    </tr>
                                </table>
                                <!-- /.input group -->
                            </div>
                        </div>
                    </div>
                    <!-- /.box -->
                </div>
            </div>
        </section>

        <!-- /.content-wrapper -->
        <!-- Add the sidebar's background. This div must be placed
         immediately after the control sidebar -->
        <div class="control-sidebar-bg"></div>
    </div>
    <%@include file="/WEB-INF/jsp/common/footer.jsp" %>
</body>
<%@include file="/WEB-INF/jsp/common/commonJs.jsp" %>
<script src="<%=path%>/static/js/jquery.tmpl.js"></script>
<script src="<%=path%>/static/script/monitor/integrate.js"></script>
</html>
