<%
    String path = request.getContextPath();
    response.setHeader("Access-Control-Allow-Origin", "*");
%>
<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<script>var CONTEXTPATH = "${pageContext.request.contextPath}" </script>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>趋势曲线</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <%@include file="/WEB-INF/jsp/common/commonCss.jsp" %>
    <!-- Daterange picker -->
    <link rel="stylesheet"
          href="<%=path%>/static/AdminLTE-2.4.2/bower_components/bootstrap-daterangepicker/daterangepicker.css">
    <%--<link rel="stylesheet" href="<%=path%>/static/css/common.css">--%>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<%@include file="/WEB-INF/jsp/tmpl/trendReportTmpl.jsp" %>
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
                <li><a href="<%=path%>/admin/trend">趋势曲线</a></li>
            </ol>
        </section>
        <section class="content">
            <div class="row">
                <h2 style="text-align: center;"><strong>趋势曲线图</strong></h2>
                <div class="input-group" style="float: right;width: 20%;padding-bottom: 10px;padding-right: 10px;">
                    <div class="input-group-addon">
                        <i class="fa fa-clock-o"></i>
                    </div>
                    <input type="text" class="form-control pull-right" id="reservationtime">
                </div>
            </div>

            <div class="row" style="height: 75%;">
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#mud" data-toggle="tab" aria-expanded="true">泥位曲线</a></li>
                    <li ><a href="#temperature" data-toggle="tab" aria-expanded="false">温度曲线</a></li>
                    <li><a href="#humidity" data-toggle="tab" aria-expanded="false">湿度曲线</a></li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane active" id="mud">
                        <div class="box box-primary" style="text-align: center">
                            <div class="box-header with-border">
                                <i class="fa fa-bar-chart-o"></i>
                                <h3 class="box-title">泥位实时数据图</h3>
                                <div class="box-tools pull-right">
                                    实时数据
                                    <div class="btn-group" id="mudRealtime" data-toggle="btn-toggle">
                                        <button type="button" class="btn btn-default btn-xs active"
                                                data-toggle="on">开
                                        </button>
                                        <button type="button" class="btn btn-default btn-xs" data-toggle="off">关
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <div class="box-body">
                                <div id="mudFlot" style="height: 80%; padding: 0px; position: relative;">
                                </div>
                            </div>
                            <!-- /.box-body-->
                        </div>
                    </div>
                    <div class="tab-pane" id="temperature">
                        <div class="box box-primary" style="text-align: center">
                            <div class="box-header with-border">
                                <i class="fa fa-bar-chart-o"></i>
                                <h3 class="box-title">环境温度实时数据图</h3>
                                <div class="box-tools pull-right">
                                    实时数据
                                    <div class="btn-group" id="temperatureRealtime" data-toggle="btn-toggle">
                                        <button type="button" class="btn btn-default btn-xs active"
                                                data-toggle="on">开
                                        </button>
                                        <button type="button" class="btn btn-default btn-xs" data-toggle="off">关
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <div class="box-body">
                                <div id="temperatureFlot" style="height: 80%; padding: 0px; position: relative;">
                                </div>
                            </div>
                            <!-- /.box-body-->
                        </div>
                    </div>
                    <div class="tab-pane" id="humidity">
                        <div class="box box-primary" style="text-align: center">
                            <div class="box-header with-border">
                                <i class="fa fa-bar-chart-o"></i>

                                <h3 class="box-title">环境湿度实时数据图</h3>

                                <div class="box-tools pull-right">
                                    实时数据
                                    <div class="btn-group" id="humidityRealtime" data-toggle="btn-toggle">
                                        <button type="button" class="btn btn-default btn-xs active"
                                                data-toggle="on">开
                                        </button>
                                        <button type="button" class="btn btn-default btn-xs" data-toggle="off">关
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <div class="box-body">
                                <div id="humidityFlot" style="height: 80%; padding: 0px; position: relative;">
                                </div>
                            </div>
                            <!-- /.box-body-->
                        </div>
                    </div>
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
<!-- date-range-picker -->
<script src="<%=path%>/static/AdminLTE-2.4.2/bower_components/moment/min/moment.min.js"></script>
<script src="<%=path%>/static/AdminLTE-2.4.2/bower_components/bootstrap-daterangepicker/daterangepicker.js"></script>
<!-- bootstrap datepicker -->
<!-- FLOT CHARTS -->
<script src="<%=path%>/static/AdminLTE-2.4.2/bower_components/Flot/jquery.flot.js"></script>
<!-- FLOT RESIZE PLUGIN - allows the chart to redraw when the window is resized -->
<script src="<%=path%>/static/AdminLTE-2.4.2/bower_components/Flot/jquery.flot.resize.js"></script>
<!-- FLOT PIE PLUGIN - also used to draw donut charts -->
<script src="<%=path%>/static/AdminLTE-2.4.2/bower_components/Flot/jquery.flot.pie.js"></script>
<!-- FLOT CATEGORIES PLUGIN - Used to draw bar charts -->
<script src="<%=path%>/static/AdminLTE-2.4.2/bower_components/Flot/jquery.flot.categories.js"></script>
<script src="<%=path%>/static/script/trend/trend.js"></script>
</html>
