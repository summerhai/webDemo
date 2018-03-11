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
    <title>污水回用处理单元</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <%@include file="/WEB-INF/jsp/common/commonCss.jsp" %>
    <link rel="stylesheet" href="<%=path%>/static/css/common.css">
    <%@include file="/WEB-INF/jsp/common/commonJs.jsp" %>

</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
    <%@include file="/WEB-INF/jsp/common/header.jsp" %>
    <!-- Left side column. contains the logo and sidebar -->
    <%@include file="/WEB-INF/jsp/common/left.jsp" %>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header" style="padding: 45px 15px 0 15px">
            <%--<h1>--%>
            <%--Advanced Form Elements--%>
            <%--<small>Preview</small>--%>
            <%--</h1>--%>
            <ol class="breadcrumb">
                <li><a href="<%=path%>/main"><i class="fa fa-dashboard"></i> 首页</a></li>
                <li><a href="<%=path%>/admin/schedule">计划任务</a></li>
            </ol>
        </section>
        <section class="content">
            <div class="row">
                <div class="col-md-3">
                    <div class="box box-primary">
                        <div class="box-body box-profile">
                            <h3 class="profile-username text-center">设备列表</h3>

                            <ul class="list-group list-group-unbordered" style="text-align: center;">
                                <li class="list-group-item">
                                    <a href="#device1" data-toggle="tab" class="btn btn-primary btn-block">设备1</a>
                                </li>
                                <li class="list-group-item">
                                    <a href="#device2" data-toggle="tab" class="btn btn-primary btn-block">设备2</a>
                                </li>
                                <li class="list-group-item">
                                    <a href="#device3" data-toggle="tab" class="btn btn-primary btn-block">设备3</a>
                                </li>
                                <li class="list-group-item">
                                    <a href="#" class="btn btn-primary btn-block">设备4</a>
                                </li>
                                <li class="list-group-item">
                                    <a href="#" class="btn btn-primary btn-block">设备5</a>
                                </li>
                                <li class="list-group-item">
                                    <a href="#" class="btn btn-primary btn-block">设备6</a>
                                </li>
                                <li class="list-group-item">
                                    <a href="#" class="btn btn-primary btn-block">设备7</a>
                                </li>
                                <li class="list-group-item">
                                    <a href="#" class="btn btn-primary btn-block">设备8</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-md-9">
                    <div class="nav-tabs-custom">
                        <div class="tab-content">
                            <div class="active tab-pane" id="device1">
                                <div class="box box-primary">
                                    <div class="box-header with-border">
                                        <h3 class="box-title">设备1计划配置</h3>
                                    </div>
                                    <!-- /.box-header -->
                                    <!-- form start -->
                                    <form role="form">
                                        <div class="box-body">
                                            <div class="form-group">
                                                <label>属性1</label>
                                                <input type="text" class="form-control" placeholder="Enter ...">
                                            </div>
                                            <div class="form-group">
                                                <label>属性2</label>
                                                <input type="text" class="form-control" placeholder="Enter ...">
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleInputFile">设备图片</label>
                                                <input type="file" id="exampleInputFile1">

                                                <p class="help-block">更改设备图片</p>
                                            </div>
                                        </div>
                                        <!-- /.box-body -->

                                        <div class="box-footer">
                                            <button type="submit" class="btn btn-primary">确定</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div class="tab-pane" id="device2">
                                <div class="box box-primary">
                                    <div class="box-header with-border">
                                        <h3 class="box-title">设备2计划配置</h3>
                                    </div>
                                    <!-- /.box-header -->
                                    <!-- form start -->
                                    <form role="form">
                                        <div class="box-body">
                                            <div class="form-group">
                                                <label>属性1</label>
                                                <input type="text" class="form-control" placeholder="Enter ...">
                                            </div>
                                            <div class="form-group">
                                                <label>属性2</label>
                                                <input type="text" class="form-control" placeholder="Enter ...">
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleInputFile">设备图片</label>
                                                <input type="file" id="exampleInputFile1">

                                                <p class="help-block">更改设备图片</p>
                                            </div>
                                        </div>
                                        <!-- /.box-body -->

                                        <div class="box-footer">
                                            <button type="submit" class="btn btn-primary">确定</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <!-- /.tab-pane -->
                            <div class="tab-pane" id="device3">
                                <div class="box box-primary">
                                    <div class="box-header with-border">
                                        <h3 class="box-title">设备3计划配置</h3>
                                    </div>
                                    <!-- /.box-header -->
                                    <!-- form start -->
                                    <form role="form">
                                        <div class="box-body">
                                            <div class="form-group">
                                                <label>属性1</label>
                                                <input type="text" class="form-control" placeholder="Enter ...">
                                            </div>
                                            <div class="form-group">
                                                <label>属性2</label>
                                                <input type="text" class="form-control" placeholder="Enter ...">
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleInputFile">设备图片</label>
                                                <input type="file" id="exampleInputFile1">

                                                <p class="help-block">更改设备图片</p>
                                            </div>
                                        </div>
                                        <!-- /.box-body -->

                                        <div class="box-footer">
                                            <button type="submit" class="btn btn-primary">确定</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <!-- /.tab-pane -->
                        </div>
                        <!-- /.tab-content -->
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

<script src="<%=path%>/static/script/monitor/sewerage.js"></script>

</html>
