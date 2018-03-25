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
                    <li class=""><a href="#temperature" data-toggle="tab" aria-expanded="false">温度曲线</a></li>
                    <li><a href="#humidity" data-toggle="tab">湿度曲线</a></li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane active" id="mud">
                        <div class="box box-primary" style="text-align: center">
                            <div class="box-header with-border">
                                <i class="fa fa-bar-chart-o"></i>

                                <h3 class="box-title">设备实时数据图</h3>

                                <div class="box-tools pull-right">
                                    Real time
                                    <div class="btn-group" id="realtime" data-toggle="btn-toggle">
                                        <button type="button" class="btn btn-default btn-xs active"
                                                data-toggle="on">On
                                        </button>
                                        <button type="button" class="btn btn-default btn-xs" data-toggle="off">Off
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <div class="box-body">
                                <div id="interactive" style="height: 80%; padding: 0px; position: relative;">
                                    <canvas class="flot-base" width="100%" height="300"
                                            style="direction: ltr; position: absolute; left: 0px; top: 0px; width: 100%; height: 300px;"></canvas>
                                    <div class="flot-text"
                                         style="position: absolute; top: 0px; left: 0px; bottom: 0px; right: 0px; font-size: smaller; color: rgb(84, 84, 84);">
                                        <div class="flot-x-axis flot-x1-axis xAxis x1Axis"
                                             style="position: absolute; top: 0px; left: 0px; bottom: 0px; right: 0px;">
                                            <div class="flot-tick-label tickLabel"
                                                 style="position: absolute; max-width: 147px; top: 282px; left: 21px; text-align: center;">
                                                0
                                            </div>
                                            <div class="flot-tick-label tickLabel"
                                                 style="position: absolute; max-width: 147px; top: 282px; left: 179px; text-align: center;">
                                                10
                                            </div>
                                            <div class="flot-tick-label tickLabel"
                                                 style="position: absolute; max-width: 147px; top: 282px; left: 339px; text-align: center;">
                                                20
                                            </div>
                                            <div class="flot-tick-label tickLabel"
                                                 style="position: absolute; max-width: 147px; top: 282px; left: 500px; text-align: center;">
                                                30
                                            </div>
                                            <div class="flot-tick-label tickLabel"
                                                 style="position: absolute; max-width: 147px; top: 282px; left: 660px; text-align: center;">
                                                40
                                            </div>
                                            <div class="flot-tick-label tickLabel"
                                                 style="position: absolute; max-width: 147px; top: 282px; left: 821px; text-align: center;">
                                                50
                                            </div>
                                            <div class="flot-tick-label tickLabel"
                                                 style="position: absolute; max-width: 147px; top: 282px; left: 982px; text-align: center;">
                                                60
                                            </div>
                                            <div class="flot-tick-label tickLabel"
                                                 style="position: absolute; max-width: 147px; top: 282px; left: 1142px; text-align: center;">
                                                70
                                            </div>
                                            <div class="flot-tick-label tickLabel"
                                                 style="position: absolute; max-width: 147px; top: 282px; left: 1303px; text-align: center;">
                                                80
                                            </div>
                                            <div class="flot-tick-label tickLabel"
                                                 style="position: absolute; max-width: 147px; top: 282px; left: 1463px; text-align: center;">
                                                90
                                            </div>
                                        </div>
                                        <div class="flot-y-axis flot-y1-axis yAxis y1Axis"
                                             style="position: absolute; top: 0px; left: 0px; bottom: 0px; right: 0px;">
                                            <div class="flot-tick-label tickLabel"
                                                 style="position: absolute; top: 269px; left: 13px; text-align: right;">
                                                0
                                            </div>
                                            <div class="flot-tick-label tickLabel"
                                                 style="position: absolute; top: 215px; left: 7px; text-align: right;">
                                                20
                                            </div>
                                            <div class="flot-tick-label tickLabel"
                                                 style="position: absolute; top: 161px; left: 7px; text-align: right;">
                                                40
                                            </div>
                                            <div class="flot-tick-label tickLabel"
                                                 style="position: absolute; top: 108px; left: 7px; text-align: right;">
                                                60
                                            </div>
                                            <div class="flot-tick-label tickLabel"
                                                 style="position: absolute; top: 54px; left: 7px; text-align: right;">
                                                80
                                            </div>
                                            <div class="flot-tick-label tickLabel"
                                                 style="position: absolute; top: 1px; left: 1px; text-align: right;">
                                                100
                                            </div>
                                        </div>
                                    </div>
                                    <canvas class="flot-overlay"
                                            style="direction: ltr; position: absolute; left: 0px; top: 0px; "></canvas>
                                </div>
                            </div>
                            <!-- /.box-body-->
                        </div>
                    </div>
                    <div class="tab-pane" id="temperature">
                        <div class="box box-primary" style="text-align: center">
                            <div class="box-header with-border">
                                <i class="fa fa-bar-chart-o"></i>

                                <h3 class="box-title">设备实时数据图</h3>

                                <div class="box-tools pull-right">
                                    Real time
                                    <div class="btn-group" id="realtime1" data-toggle="btn-toggle">
                                        <button type="button" class="btn btn-default btn-xs active"
                                                data-toggle="on">On
                                        </button>
                                        <button type="button" class="btn btn-default btn-xs" data-toggle="off">Off
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <div class="box-body">
                                <div id="interactive1" style="height: 80%; padding: 0px; position: relative;">
                                    <canvas class="flot-base" width="100%" height="300"
                                            style="direction: ltr; position: absolute; left: 0px; top: 0px; width: 100%; height: 300px;"></canvas>
                                    <div class="flot-text"
                                         style="position: absolute; top: 0px; left: 0px; bottom: 0px; right: 0px; font-size: smaller; color: rgb(84, 84, 84);">
                                        <div class="flot-x-axis flot-x1-axis xAxis x1Axis"
                                             style="position: absolute; top: 0px; left: 0px; bottom: 0px; right: 0px;">
                                            <div class="flot-tick-label tickLabel"
                                                 style="position: absolute; max-width: 147px; top: 282px; left: 21px; text-align: center;">
                                                0
                                            </div>
                                            <div class="flot-tick-label tickLabel"
                                                 style="position: absolute; max-width: 147px; top: 282px; left: 179px; text-align: center;">
                                                10
                                            </div>
                                            <div class="flot-tick-label tickLabel"
                                                 style="position: absolute; max-width: 147px; top: 282px; left: 339px; text-align: center;">
                                                20
                                            </div>
                                            <div class="flot-tick-label tickLabel"
                                                 style="position: absolute; max-width: 147px; top: 282px; left: 500px; text-align: center;">
                                                30
                                            </div>
                                            <div class="flot-tick-label tickLabel"
                                                 style="position: absolute; max-width: 147px; top: 282px; left: 660px; text-align: center;">
                                                40
                                            </div>
                                            <div class="flot-tick-label tickLabel"
                                                 style="position: absolute; max-width: 147px; top: 282px; left: 821px; text-align: center;">
                                                50
                                            </div>
                                            <div class="flot-tick-label tickLabel"
                                                 style="position: absolute; max-width: 147px; top: 282px; left: 982px; text-align: center;">
                                                60
                                            </div>
                                            <div class="flot-tick-label tickLabel"
                                                 style="position: absolute; max-width: 147px; top: 282px; left: 1142px; text-align: center;">
                                                70
                                            </div>
                                            <div class="flot-tick-label tickLabel"
                                                 style="position: absolute; max-width: 147px; top: 282px; left: 1303px; text-align: center;">
                                                80
                                            </div>
                                            <div class="flot-tick-label tickLabel"
                                                 style="position: absolute; max-width: 147px; top: 282px; left: 1463px; text-align: center;">
                                                90
                                            </div>
                                        </div>
                                        <div class="flot-y-axis flot-y1-axis yAxis y1Axis"
                                             style="position: absolute; top: 0px; left: 0px; bottom: 0px; right: 0px;">
                                            <div class="flot-tick-label tickLabel"
                                                 style="position: absolute; top: 269px; left: 13px; text-align: right;">
                                                0
                                            </div>
                                            <div class="flot-tick-label tickLabel"
                                                 style="position: absolute; top: 215px; left: 7px; text-align: right;">
                                                20
                                            </div>
                                            <div class="flot-tick-label tickLabel"
                                                 style="position: absolute; top: 161px; left: 7px; text-align: right;">
                                                40
                                            </div>
                                            <div class="flot-tick-label tickLabel"
                                                 style="position: absolute; top: 108px; left: 7px; text-align: right;">
                                                60
                                            </div>
                                            <div class="flot-tick-label tickLabel"
                                                 style="position: absolute; top: 54px; left: 7px; text-align: right;">
                                                80
                                            </div>
                                            <div class="flot-tick-label tickLabel"
                                                 style="position: absolute; top: 1px; left: 1px; text-align: right;">
                                                100
                                            </div>
                                        </div>
                                    </div>
                                    <canvas class="flot-overlay"
                                            style="direction: ltr; position: absolute; left: 0px; top: 0px; "></canvas>
                                </div>
                            </div>
                            <!-- /.box-body-->
                        </div>
                    </div>
                    <div class="tab-pane" id="humidity">
                        <div class="box box-primary" style="text-align: center">
                            <div class="box-header with-border">
                                <i class="fa fa-bar-chart-o"></i>

                                <h3 class="box-title">设备实时数据图</h3>

                                <div class="box-tools pull-right">
                                    Real time
                                    <div class="btn-group" id="realtime2" data-toggle="btn-toggle">
                                        <button type="button" class="btn btn-default btn-xs active"
                                                data-toggle="on">On
                                        </button>
                                        <button type="button" class="btn btn-default btn-xs" data-toggle="off">Off
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <div class="box-body">
                                <div id="interactive2" style="height: 80%; padding: 0px; position: relative;">
                                    <canvas class="flot-base" width="100%" height="300"
                                            style="direction: ltr; position: absolute; left: 0px; top: 0px; width: 100%; height: 300px;"></canvas>
                                    <div class="flot-text"
                                         style="position: absolute; top: 0px; left: 0px; bottom: 0px; right: 0px; font-size: smaller; color: rgb(84, 84, 84);">
                                        <div class="flot-x-axis flot-x1-axis xAxis x1Axis"
                                             style="position: absolute; top: 0px; left: 0px; bottom: 0px; right: 0px;">
                                            <div class="flot-tick-label tickLabel"
                                                 style="position: absolute; max-width: 147px; top: 282px; left: 21px; text-align: center;">
                                                0
                                            </div>
                                            <div class="flot-tick-label tickLabel"
                                                 style="position: absolute; max-width: 147px; top: 282px; left: 179px; text-align: center;">
                                                10
                                            </div>
                                            <div class="flot-tick-label tickLabel"
                                                 style="position: absolute; max-width: 147px; top: 282px; left: 339px; text-align: center;">
                                                20
                                            </div>
                                            <div class="flot-tick-label tickLabel"
                                                 style="position: absolute; max-width: 147px; top: 282px; left: 500px; text-align: center;">
                                                30
                                            </div>
                                            <div class="flot-tick-label tickLabel"
                                                 style="position: absolute; max-width: 147px; top: 282px; left: 660px; text-align: center;">
                                                40
                                            </div>
                                            <div class="flot-tick-label tickLabel"
                                                 style="position: absolute; max-width: 147px; top: 282px; left: 821px; text-align: center;">
                                                50
                                            </div>
                                            <div class="flot-tick-label tickLabel"
                                                 style="position: absolute; max-width: 147px; top: 282px; left: 982px; text-align: center;">
                                                60
                                            </div>
                                            <div class="flot-tick-label tickLabel"
                                                 style="position: absolute; max-width: 147px; top: 282px; left: 1142px; text-align: center;">
                                                70
                                            </div>
                                            <div class="flot-tick-label tickLabel"
                                                 style="position: absolute; max-width: 147px; top: 282px; left: 1303px; text-align: center;">
                                                80
                                            </div>
                                            <div class="flot-tick-label tickLabel"
                                                 style="position: absolute; max-width: 147px; top: 282px; left: 1463px; text-align: center;">
                                                90
                                            </div>
                                        </div>
                                        <div class="flot-y-axis flot-y1-axis yAxis y1Axis"
                                             style="position: absolute; top: 0px; left: 0px; bottom: 0px; right: 0px;">
                                            <div class="flot-tick-label tickLabel"
                                                 style="position: absolute; top: 269px; left: 13px; text-align: right;">
                                                0
                                            </div>
                                            <div class="flot-tick-label tickLabel"
                                                 style="position: absolute; top: 215px; left: 7px; text-align: right;">
                                                20
                                            </div>
                                            <div class="flot-tick-label tickLabel"
                                                 style="position: absolute; top: 161px; left: 7px; text-align: right;">
                                                40
                                            </div>
                                            <div class="flot-tick-label tickLabel"
                                                 style="position: absolute; top: 108px; left: 7px; text-align: right;">
                                                60
                                            </div>
                                            <div class="flot-tick-label tickLabel"
                                                 style="position: absolute; top: 54px; left: 7px; text-align: right;">
                                                80
                                            </div>
                                            <div class="flot-tick-label tickLabel"
                                                 style="position: absolute; top: 1px; left: 1px; text-align: right;">
                                                100
                                            </div>
                                        </div>
                                    </div>
                                    <canvas class="flot-overlay"
                                            style="direction: ltr; position: absolute; left: 0px; top: 0px; "></canvas>
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
