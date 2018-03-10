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
  <title>系统主页</title>
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
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <%@include file="/WEB-INF/jsp/common/header.jsp"%>
  <!-- Left side column. contains the logo and sidebar -->
  <%@include file="/WEB-INF/jsp/common/left.jsp"%>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->

    <!-- Main content -->
    <section class="content">
      <!-- Small boxes (Stat box) -->
      <!-- /.row -->
      <!-- Main row -->
        <span>暂时为空</span>
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <%@include file="/WEB-INF/jsp/common/footer.jsp"%>


  <!-- /.control-sidebar -->
  <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->

<!-- jQuery 3 -->
<script src="<%=path%>/static/AdminLTE-2.4.2/bower_components/jquery/dist/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="<%=path%>/static/AdminLTE-2.4.2/bower_components/jquery-ui/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
  $.widget.bridge('uibutton', $.ui.button);
</script>
<!-- Bootstrap 3.3.7 -->
<script src="<%=path%>/static/AdminLTE-2.4.2/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- Morris.js charts -->
<script src="<%=path%>/static/AdminLTE-2.4.2/bower_components/raphael/raphael.min.js"></script>
<script src="<%=path%>/static/AdminLTE-2.4.2/bower_components/morris.js/morris.min.js"></script>
<!-- Sparkline -->
<script src="<%=path%>/static/AdminLTE-2.4.2/bower_components/jquery-sparkline/dist/jquery.sparkline.min.js"></script>
<!-- jvectormap -->
<script src="<%=path%>/static/AdminLTE-2.4.2/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="<%=path%>/static/AdminLTE-2.4.2/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<!-- jQuery Knob Chart -->
<script src="<%=path%>/static/AdminLTE-2.4.2/bower_components/jquery-knob/dist/jquery.knob.min.js"></script>
<!-- daterangepicker -->
<script src="<%=path%>/static/AdminLTE-2.4.2/bower_components/moment/min/moment.min.js"></script>
<script src="<%=path%>/static/AdminLTE-2.4.2/bower_components/bootstrap-daterangepicker/daterangepicker.js"></script>
<!-- datepicker -->
<script src="<%=path%>/static/AdminLTE-2.4.2/bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
<!-- Bootstrap WYSIHTML5 -->
<script src="<%=path%>/static/AdminLTE-2.4.2/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<!-- Slimscroll -->
<script src="<%=path%>/static/AdminLTE-2.4.2/bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="<%=path%>/static/AdminLTE-2.4.2/bower_components/fastclick/lib/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="<%=path%>/static/AdminLTE-2.4.2/dist/js/adminlte.min.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="<%=path%>/static/AdminLTE-2.4.2/dist/js/pages/dashboard.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="<%=path%>/static/AdminLTE-2.4.2/dist/js/demo.js"></script>
</body>
</html>
