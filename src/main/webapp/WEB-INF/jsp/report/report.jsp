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
    <title>报表管理</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <%@include file="/WEB-INF/jsp/common/commonCss.jsp" %>
    <!-- Daterange picker -->
    <link rel="stylesheet"
          href="<%=path%>/static/AdminLTE-2.4.2/bower_components/bootstrap-daterangepicker/daterangepicker.css">
    <!-- DataTables -->
    <link rel="stylesheet"
          href="<%=path%>/static/AdminLTE-2.4.2/bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">
    <link rel="stylesheet" href="<%=path%>/static/css/common.css">

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
                <li><a href="<%=path%>/admin/report">报表管理</a></li>
            </ol>
        </section>
        <section class="content">
            <div class="d1">
                <div class="d21">
                    报表记录
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
                                <table id="reportTable" width="100%"
                                       class="table table-bordered table-hover dataTable">
                                    <thead>
                                    <tr>
                                        <th>序号</th>
                                        <th>采集日期</th>
                                        <th>采集时间</th>
                                        <th>1#过滤泵</th>
                                        <th>2#过滤泵</th>
                                        <th>PAC搅拌机</th>
                                        <th>PAM搅拌机</th>
                                        <th>1#PAC计量泵</th>
                                        <th>2#PAC计量泵</th>
                                        <th>1#PAM计量泵</th>
                                        <th>2#PAM计量泵</th>
                                        <th>1#原水泵</th>
                                        <th>2#原水泵</th>
                                        <th>1#供水泵</th>
                                        <th>2#供水泵</th>
                                        <th>反冲水泵</th>
                                        <th>排风机</th>
                                        <th>杀毒装置</th>
                                        <th>电动阀</th>
                                        <th>药箱低液位</th>
                                        <th>调节池低液位</th>
                                        <th>调节池高液位</th>
                                        <th>中间池低液位</th>
                                        <th>中间池中液位</th>
                                        <th>中间池高液位</th>
                                        <th>清水池低液位</th>
                                        <th>清水池中液位</th>
                                        <th>清水池高液位</th>
                                        <th>1#反洗信号</th>
                                        <th>2#反洗信号</th>
                                        <th>3#反洗信号</th>
                                        <th>4#反洗信号</th>
                                        <th>泥位液位</th>
                                        <th>环境温度</th>
                                        <th>环境湿度</th>
                                        <th>电缆温度</th>
                                        <th>烟感信号</th>
                                        <th>水浸信号</th>
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
<%@include file="/WEB-INF/jsp/common/commonJs.jsp" %>
<!-- date-range-picker -->
<script src="<%=path%>/static/AdminLTE-2.4.2/bower_components/moment/min/moment.min.js"></script>
<script src="<%=path%>/static/AdminLTE-2.4.2/bower_components/bootstrap-daterangepicker/daterangepicker.js"></script>
<!-- DataTables -->
<script src="<%=path%>/static/AdminLTE-2.4.2/bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="<%=path%>/static/AdminLTE-2.4.2/bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>

<script src="<%=path%>/static/script/report/report.js"></script>
</html>
