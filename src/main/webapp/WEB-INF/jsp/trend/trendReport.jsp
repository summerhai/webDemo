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
    <title>趋势报表</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.7 -->
    <link rel="stylesheet" href="<%=path%>/static/AdminLTE-2.4.2/bower_components/bootstrap/dist/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet"
          href="<%=path%>/static/AdminLTE-2.4.2/bower_components/font-awesome/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="<%=path%>/static/AdminLTE-2.4.2/bower_components/Ionicons/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="<%=path%>/static/AdminLTE-2.4.2/dist/css/AdminLTE.min.css">
    <!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="<%=path%>/static/AdminLTE-2.4.2/dist/css/skins/_all-skins.min.css">
    <!-- Morris chart -->
    <link rel="stylesheet" href="<%=path%>/static/AdminLTE-2.4.2/bower_components/morris.js/morris.css">
    <!-- jvectormap -->
    <link rel="stylesheet" href="<%=path%>/static/AdminLTE-2.4.2/bower_components/jvectormap/jquery-jvectormap.css">
    <!-- Daterange picker -->
    <link rel="stylesheet"
          href="<%=path%>/static/AdminLTE-2.4.2/bower_components/bootstrap-daterangepicker/daterangepicker.css">
    <!-- bootstrap wysihtml5 - text editor -->
    <link rel="stylesheet"
          href="<%=path%>/static/AdminLTE-2.4.2/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="<%=path%>/static/js/html5shiv.min.js"></script>
    <script src="<%=path%>/static/js/respond.min.js"></script>
    <![endif]-->
    <!-- Google Font -->
    <link rel="stylesheet" href="<%=path%>/static/css/googleFonts.css">

    <style>
        .d1 {
            width: 100%;
            height: 100%;
            margin: 0;
            padding: 0;
        }

        .d21 {
            width: 100%;
            font-size: 50px;
            line-height: 80px;
            text-align: center;
            position: relative;
        }

        .d32 {
            width: 65%;
            float: left;
            text-align: center;
            font-size: 50px;
            line-height: 80px;
            /*border: solid 1px black;*/
        }

        .d33 {
            width: 280px;
            height: 82px;
            /*background-color: yellow;*/

            position: absolute;
            font-size: 15px;
            right: 10px;
            top: 23px;
            line-height: 23px;
        }

        .d22 {;
        }

        .d34 {
            width: 70%;
            height: 600px;
            background-color: red;
            float: left;
        }

        .d35 {;
            height: 600px;
            float: left;
        }

        .d41 {
            width: 100%;
            background-color: cornflowerblue;

        }

        .p1 {
            width: 200px;
            height: 50px;
            font-size: 25px;
            line-height: 40px;
            margin: auto;
            text-align: center;
            border: 1px solid black;
        }
    </style>
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
                <li><a href="<%=path%>/trendReport/trendReport">趋势报表</a></li>
            </ol>
        </section>
        <section class="content">
            <div class="d1">
                <div class="d21">
                    趋势报表
                    <div class="d33">
                        <!-- Date -->
                        <div class="form-group">
                            <div class="input-group date" style="float: left">
                                <label style="float: left">日期:</label>
                                <div class="input-group-addon">
                                    <i class="fa fa-clock-o"></i>
                                </div>
                                <input type="text" class="form-control pull-right" id="reservationtime">
                                <%--<button type="submit" class="btn btn-primary">Submit</button>--%>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row" style="height: 80%;">
                    <div class="col-md-4" border: 1px solid white;>
                        <img class="img-responsive pad" id="myCopyImage" src="<%=path%>/static/imgs/device1.png"
                             alt="Photo" style="width:90%; height:90%; margin: 0 auto">
                    </div>
                    <div class="col-md-8">
                        <div class="col-xs-12">
                            <!-- interactive chart -->
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
                                    <div id="interactive" style="height: 300px; padding: 0px; position: relative;">
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
                                        <canvas class="flot-overlay" width="1623" height="300"
                                                style="direction: ltr; position: absolute; left: 0px; top: 0px; width: 100%; height: 300px;"></canvas>
                                    </div>
                                </div>
                                <!-- /.box-body-->
                            </div>
                            <!-- /.box -->

                        </div>
                        <div style="border: 1px solid white;">
                            <table class="table table-bordered text-center" id="device1">
                                <tr>
                                    <th>采集时间</th>
                                    <th>属性1</th>
                                    <th>属性2</th>
                                    <th>属性3</th>
                                    <th>属性4</th>
                                </tr>
                                <tbody id="device1Body">

                                </tbody>
                            </table>
                        </div>
                        <div style="border: 1px solid white;">
                            <table class="table table-bordered text-center" id="device1Sum">
                                <tbody id="device1SumBody">

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="row" style="height: 20%;">
                    <table class="table table-bordered text-center">
                        <tbody>
                        <tr>
                            <td>
                                <button type="button" class="btn btn-block btn-success btn-lg">运行界面</button>
                            </td>
                            <td>
                                <button type="button" class="btn btn-block btn-info btn-lg">参数设置</button>
                            </td>
                            <td>
                                <button type="button" class="btn btn-block btn-danger btn-lg">报警界面</button>
                            </td>
                            <td>
                                <button type="button" class="btn btn-block btn-primary btn-lg"
                                        style="text-align:center;">1#
                                </button>
                            </td>
                            <td>
                                <button type="button" class="btn btn-block btn-primary btn-lg"
                                        style="text-align:center;">2#
                                </button>
                            </td>
                            <td>
                                <button type="button" class="btn btn-block btn-primary btn-lg"
                                        style="text-align:center;">3#
                                </button>
                            </td>
                            <td>
                                <button type="button" class="btn btn-block btn-primary btn-lg"
                                        style="text-align:center;">4#
                                </button>
                            </td>
                            <td>
                                <button type="button" class="btn btn-block btn-primary btn-lg"
                                        style="text-align:center;">5#
                                </button>
                            </td>
                            <td>
                                <button type="button" class="btn btn-block btn-primary btn-lg"
                                        style="text-align:center;">6#
                                </button>
                            </td>
                            <td>
                                <button type="button" class="btn btn-block btn-primary btn-lg"
                                        style="text-align:center;">7#
                                </button>
                            </td>
                            <td>
                                <button type="button" class="btn btn-block btn-primary btn-lg"
                                        style="text-align:center;">8#
                                </button>
                            </td>
                            <td>
                                <button type="button" class="btn btn-block btn-primary btn-lg"
                                        style="text-align:center;">9#
                                </button>
                            </td>
                            <td>
                                <button type="button" class="btn btn-block btn-primary btn-lg"
                                        style="text-align:center;">10#
                                </button>
                            </td>
                            <td>
                                <button type="button" class="btn btn-block btn-primary btn-lg"
                                        style="text-align:center;">11#
                                </button>
                            </td>
                            <td>
                                <button type="button" class="btn btn-block btn-primary btn-lg"
                                        style="text-align:center;">12#
                                </button>
                            </td>
                            <td>
                                <button type="button" class="btn btn-block btn-primary btn-lg"
                                        style="text-align:center;">13#
                                </button>
                            </td>
                        </tr>
                        </tbody>
                    </table>
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
<script src="<%=path%>/static/AdminLTE-2.4.2/bower_components/jquery/dist/jquery.min.js"></script>
<script src="<%=path%>/static/js/jquery.tmpl.js"></script>
<script src="<%=path%>/static/AdminLTE-2.4.2/dist/js/adminlte.min.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="<%=path%>/static/AdminLTE-2.4.2/dist/js/pages/dashboard.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="<%=path%>/static/AdminLTE-2.4.2/dist/js/demo.js"></script>
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
<script src="<%=path%>/static/script/trendReport/trendReport.js"></script>
</html>
