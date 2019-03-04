<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="head.jsp"></jsp:include>
</head>
<body class="app ">

	<div id="spinner"></div>
	
	<div id="app">
		<div class="main-wrapper" >
		
			<jsp:include page="nav.jsp"></jsp:include>
			
			<jsp:include page="aside.jsp"></jsp:include>
			<div class="app-content">
			登陆失效，请重新
			<a href="login.jsp">登录</a>！
			</div>
		</div>
	</div>
	<footer class="main-footer">
		<div class="text-center">
			Copyright &copy;Royaltea 2018. Design By<a href="#"> ZhuoRan Huang</a>
		</div>
	</footer>
</body>

		<!--Jquery.min js-->
		<script src="assets/js/jquery.min.js"></script>

		<!--popper js-->
		<script src="assets/js/popper.js"></script>

		<!--Tooltip js-->
		<script src="assets/js/tooltip.js"></script>

		<!--Bootstrap.min js-->
		<script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>

		<!--Jquery.nicescroll.min js-->
		<script src="assets/plugins/nicescroll/jquery.nicescroll.min.js"></script>

		<!--Scroll-up-bar.min js-->
		<script src="assets/plugins/scroll-up-bar/dist/scroll-up-bar.min.js"></script>

		<!--mCustomScrollbar js-->
		<script src="assets/plugins/scroll-bar/jquery.mCustomScrollbar.concat.min.js"></script>
		
		<!--Sidemenu js-->
		<script src="assets/plugins/toggle-menu/sidemenu.js"></script>

		<!--Scripts js-->
		<script src="assets/js/scripts.js"></script>
</html>