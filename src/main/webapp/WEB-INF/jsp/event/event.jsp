<%
    String path = request.getContextPath();
    response.setHeader("Access-Control-Allow-Origin", "*");
%>
<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%--综合监控页面--%>
<script>var CONTEXTPATH = "${pageContext.request.contextPath}" </script>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>事件管理</title>
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
    <!-- DataTables -->
    <link rel="stylesheet"
          href="<%=path%>/static/AdminLTE-2.4.2/bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">

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

        .d22 {
            width: 30%;
        }

        .d34 {
            width: 70%;
            height: 600px;
            background-color: red;
            float: left;
        }

        .d35 {
            width: 30%;
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
                <li><a href="<%=path%>/event/event">事件管理</a></li>
            </ol>
        </section>
        <section class="content">
            <div class="d1">
                <div class="d21">
                    事件操作记录
                    <div class="d33">
                        <!-- Date -->
                        <div class="form-group">
                            <div class="input-group date" style="float: left">
                                <label style="float: left">日期:</label>
                                <div class="input-group-addon">
                                    <i class="fa fa-calendar"></i>
                                </div>
                                <input type="text" class="form-control pull-right" id="reservationtime">
                                <%--<button type="submit" class="btn btn-primary">Submit</button>--%>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-12">
                        <div class="box">
                            <div class="box-body">
                                <table id="eventTable" width="100%"
                                       class="table table-bordered table-hover dataTable">
                                    <thead>
                                    <tr>
                                        <th>序号</th>
                                        <th>操作时间</th>
                                        <th>操作人</th>
                                        <th>事件内容</th>
                                        <th>IP地址</th>
                                        <%--<th>操作</th>--%>
                                    </tr>
                                    </thead>
                                </table>
                            </div>
                            <!-- /.box-body -->
                        </div>
                        <!-- /.box -->
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
<script src="<%=path%>/static/AdminLTE-2.4.2/bower_components/jquery/dist/jquery.min.js"></script>
<script src="<%=path%>/static/AdminLTE-2.4.2/dist/js/adminlte.min.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="<%=path%>/static/AdminLTE-2.4.2/dist/js/pages/dashboard.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="<%=path%>/static/AdminLTE-2.4.2/dist/js/demo.js"></script>
<!-- date-range-picker -->
<script src="<%=path%>/static/AdminLTE-2.4.2/bower_components/moment/min/moment.min.js"></script>
<script src="<%=path%>/static/AdminLTE-2.4.2/bower_components/bootstrap-daterangepicker/daterangepicker.js"></script>
<!-- DataTables -->
<script src="<%=path%>/static/AdminLTE-2.4.2/bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="<%=path%>/static/AdminLTE-2.4.2/bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>

<script src="<%=path%>/static/script/event/event.js"></script>

</html>
