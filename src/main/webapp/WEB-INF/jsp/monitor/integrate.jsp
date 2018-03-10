<%
    String path = request.getContextPath();
    response.setHeader("Access-Control-Allow-Origin", "*");
%>
<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%--综合监控页面--%>
<script>var CONTEXTPATH = "${pageContext.request.contextPath}" </script>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>综合监控</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.7 -->
    <link rel="stylesheet" href="<%=path%>/static/AdminLTE-2.4.2/bower_components/bootstrap/dist/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="<%=path%>/static/AdminLTE-2.4.2/bower_components/font-awesome/css/font-awesome.min.css">
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
    <!-- Date Picker -->
    <link rel="stylesheet" href="<%=path%>/static/AdminLTE-2.4.2/bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
    <!-- Daterange picker -->
    <link rel="stylesheet" href="<%=path%>/static/AdminLTE-2.4.2/bower_components/bootstrap-daterangepicker/daterangepicker.css">
    <!-- bootstrap wysihtml5 - text editor -->
    <link rel="stylesheet" href="<%=path%>/static/AdminLTE-2.4.2/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="<%=path%>/static/js/html5shiv.min.js"></script>
    <script src="<%=path%>/static/js/respond.min.js"></script>
    <![endif]-->
    <!-- Google Font -->
    <link rel="stylesheet" href="<%=path%>/static/css/googleFonts.css">

    <style>
        .d1{
            width: 100%;
            height: 100%;
            margin: 0;
            padding: 0;
            margin-top:15px;
        }
        .d21{
            width: 100%;
            font-size: 50px;
            line-height: 80px;
            text-align: center;
            position:relative;
        }

        .d32{
            width: 65%;
            float: left;
            text-align: center;
            font-size: 50px;
            line-height: 80px;
            /*border: solid 1px black;*/
        }
        .d33{
            width: 280px;
            height: 82px;
            /*background-color: yellow;*/

            position:absolute;
            font-size: 15px;
            right: 10px;
            top: 23px;
            line-height: 23px;
        }
        .d22{
            width: 30%;
        }
        .d34{
            width: 70%;
            height: 600px;
            background-color: red;
            float: left;
        }
        .d35{
            width: 30%;
            height: 600px;
            float: left;
        }

        .d41{
            width: 100%;
            background-color: cornflowerblue;

        }
        .p1{
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
                <li><a href="#"><i class="fa fa-dashboard"></i> 首页</a></li>
                <li><a href="<%=path%>/monitor/integrate">监控</a></li>
                <li><a href="<%=path%>/monitor/integrate">综合监控</a></li>
            </ol>
        </section>
        <section class="content">
            <div class="d1">
                <div class="d21">
                    监控系统界面
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
                    <div class="col-md-6" style="width: 33%">
                        <div class="box box-danger" style="background-color: #fff4e8">
                            <div class="box-header">
                                <h3 align="center" style="font-weight:bold">污水处理回用单元</h3>
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
                                                    <button type="button" class="btn btn-block btn-info btn-lg">系统运行</button>
                                                </td>
                                                <td>
                                                    <button type="button" class="btn btn-block btn-danger btn-lg">系统停止</button>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <%--每隔一段时间去刷新数据--%>

                                    <table class="table table-bordered text-center"id="sewerage1">
                                        <tr>
                                            <th>名称</th>
                                            <th>状态</th>
                                            <th>名称</th>
                                            <th>状态</th>
                                        </tr>
                                        <tbody id="sewerage1Body">

                                        </tbody>
                                        <%--<tr>--%>
                                            <%--<td>过滤泵</td>--%>
                                            <%--<td>运行中</td>--%>
                                            <%--<td>杀毒装置</td>--%>
                                            <%--<td>运作中</td>--%>
                                        <%--</tr>--%>
                                        <%--<tr>--%>
                                            <%--<td>PAC搅拌机</td>--%>
                                            <%--<td>运行中</td>--%>
                                            <%--<td>电动阀</td>--%>
                                            <%--<td>运行中</td>--%>
                                        <%--</tr>--%>
                                        <%--<tr>--%>
                                            <%--<td>PAM搅拌机</td>--%>
                                            <%--<td>运行中</td>--%>
                                            <%--<td>反冲洗</td>--%>
                                            <%--<td>运行中</td>--%>
                                        <%--</tr>--%>
                                        <%--<tr>--%>
                                            <%--<td>PAC计量泵</td>--%>
                                            <%--<td>运行中</td>--%>
                                            <%--<td>药箱液位</td>--%>
                                            <%--<td>正常</td>--%>
                                        <%--</tr>--%>
                                        <%--<tr>--%>
                                            <%--<td>PAM计量泵</td>--%>
                                            <%--<td>运行中</td>--%>
                                            <%--<td>中间池液位</td>--%>
                                            <%--<td>中</td>--%>
                                        <%--</tr>--%>
                                        <%--<tr>--%>
                                            <%--<td>原水泵</td>--%>
                                            <%--<td>运行中</td>--%>
                                            <%--<td>清水池液位</td>--%>
                                            <%--<td>中</td>--%>
                                        <%--</tr>--%>
                                        <%--<tr>--%>
                                            <%--<td>供水泵</td>--%>
                                            <%--<td>运行中</td>--%>
                                            <%--<td>调节池液位</td>--%>
                                            <%--<td>中</td>--%>
                                        <%--</tr>--%>
                                        <%--<tr>--%>
                                            <%--<td>反冲水泵</td>--%>
                                            <%--<td>运行中</td>--%>
                                            <%--<td>污泥液位</td>--%>
                                            <%--<td>0.3</td>--%>
                                        <%--</tr>--%>
                                    </table>
                                    <!-- /.input group -->
                                </div>
                            </div>
                        </div>
                        <!-- /.box -->
                    </div>
                    <div class="col-md-6" style="width: 33%">
                        <div class="box box-danger" style="background-color: #fff4e8">
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
                                                <button type="button" class="btn btn-block btn-info btn-lg">系统运行</button>
                                            </td>
                                            <td>
                                                <button type="button" class="btn btn-block btn-danger btn-lg">系统停止</button>
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
                    <div class="col-md-6" style="width: 33%">
                        <div class="box box-danger" style="background-color: #fff4e8">
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

            </div>
        </section>

    <!-- /.content-wrapper -->
    <!-- Add the sidebar's background. This div must be placed
     immediately after the control sidebar -->
    <div class="control-sidebar-bg"></div>
    </div>
    <%@include file="/WEB-INF/jsp/common/footer.jsp"%>
</body>
<script src="<%=path%>/static/AdminLTE-2.4.2/bower_components/jquery/dist/jquery.min.js"></script>
<script src="<%=path%>/static/js/jquery.tmpl.js"></script>
<script src="<%=path%>/static/AdminLTE-2.4.2/bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
<script src="<%=path%>/static/AdminLTE-2.4.2/dist/js/adminlte.min.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="<%=path%>/static/AdminLTE-2.4.2/dist/js/pages/dashboard.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="<%=path%>/static/AdminLTE-2.4.2/dist/js/demo.js"></script>
<script src="<%=path%>/static/script/monitor/integrate.js"></script>
<script>

</script>
</html>
