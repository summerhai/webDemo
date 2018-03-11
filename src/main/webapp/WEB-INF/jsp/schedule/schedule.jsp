<%
    String path = request.getContextPath();
    response.setHeader("Access-Control-Allow-Origin", "*");
%>
<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<script>var CONTEXTPATH = "${pageContext.request.contextPath}" </script>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>污水回用处理单元</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <%@include file="/WEB-INF/jsp/common/commonCss.jsp" %>
    <link rel="stylesheet" href="<%=path%>/static/css/common.css">
    <%@include file="/WEB-INF/jsp/common/commonJs.jsp" %>

</head>
<body class="hold-transition skin-blue sidebar-mini">
<%@include file="/WEB-INF/jsp/tmpl/monitorTmpl.jsp"%>
<div class="wrapper">
    <%@include file="/WEB-INF/jsp/common/header.jsp"%>
    <!-- Left side column. contains the logo and sidebar -->
    <%@include file="/WEB-INF/jsp/common/left.jsp"%>

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
                <li><a href="<%=path%>/monitor/integrate">监控</a></li>
                <li><a href="<%=path%>/monitor/sewerage">污水处理回用</a></li>
            </ol>
        </section>
        <section class="content">
            <div class="d1">
                <div class="d21">
                    污水处理回用单元
                    <div class="d33">
                        <!-- Date -->
                        <div class="form-group">
                            <div class="input-group date" style="float: left">
                                <label style="float: left">日期:</label>
                                <div class="input-group-addon">
                                    <i class="fa fa-calendar"></i>
                                </div>
                                <input type="text" class="form-control pull-right" id="datepicker">
                                <%--<button type="submit" class="btn btn-primary">Submit</button>--%>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div style="display:none">
                        <img class="img-responsive pad" id="myCopyImage" src="<%=path%>/static/imgs/sewerage.png" alt="Photo" style="width:80%; height:80%; margin: 0 auto">
                    </div>
                    <div style="width: 100%; text-align: center">
                        <canvas id="myCanvas" style="border: 1px solid white;width:80%; height:80%;">
                            您的浏览器不支持canvas标签。
                        </canvas>
                    </div>
                </div>

            </div>
        </section>

    <!-- /.content-wrapper -->
    <!-- Add the sidebar's background. This div must be placed
     immediately after the control sidebar -->
        <div class="control-sidebar-bg"></div>
    </div>
    <%@include file="/WEB-INF/jsp/common/footer.jsp"%>
</body>

<script src="<%=path%>/static/script/monitor/sewerage.js"></script>

</html>
