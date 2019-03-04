<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="zh-CN">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>后台登录</title>
<!--Favicon -->
<link rel="icon" href="assets/img/bitbug_favicon.ico" type="image/x-icon"/>
<link href="assets/css/bootstrap-cerulean.min.css" rel="stylesheet">
<link rel="stylesheet" href="assets/css/animate.min.css" />
<style type="text/css">
body.custom-background {
	background-image: url('assets/img/royaltea .jpg');
	background-size: 100% 100%;
	background-repeat: no-repeat;
	background-position: top left;
	background-attachment: fixed;
}
</style>
</head>

<body class="custom-background" id="abc" style="opacity:0.7;filter:alpha(opacity=70);">
	<div class="snow-container"
		style="position: fixed; top: 0; left: 0; width: 100%; height: 100%; pointer-events: none; z-index: 1;">
	</div>
	<div class="panel panel-primary animated bounceIn"
		style="position: absolute; width: 233px; top: 45%; right: 24.5%; z-index: 2;background-color: rgb(200,150,104);border:0px;">
		<div class="panel-heading" style="background-color: rgb(200,150,104)">皇茶后台管理系统</div>
		
		<div class="panel-body">
			<form class="form-horizontal" action="emp-login" method="post">
				<div class="form-group">
					<label class="col-sm-3 control-label">账号</label>
					<div class="col-sm-9">
						<input type="text" required="required" name="empLid"
							class="form-control" placeholder="请输入账号">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label">密码</label>
					<div class="col-sm-9">
						<input type="password" class="form-control" placeholder="请输入密码"
							required="required" name="empPwd">
					</div>
				</div>
				<div class="form-group" >
					<div class="col-sm-offset-3 col-sm-9" >
						<button type="submit" class="btn btn-primary" style="background-color: rgb(150,110,80);border-color:rgb(150,110,80);background-image:linear-gradient(rgb(150,110,80), rgb(150,110,80) 60%, rgb(150,110,80));">登录</button>
					</div>
				</div>
				</form>
		</div>
	</div>
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	
	<script>
	window.onload=function(){
	  var div1=document.getElementById("abc");
	  div1.onmouseover=function(){
	    startMove(90);
	  }
	  div1.onmouseout=function(){
	    startMove(70);
	  }
	}
	var timer=null;
	var alpha=30;
	function startMove(itarget){
	  clearInterval(timer);
	  var div1=document.getElementById("abc");
	  timer=setInterval(function(){
	    var speed=0;
	    if(alpha>itarget){
	      speed=-10;
	    }else{
	      speed=10;
	    }
	    if(alpha==itarget){
	      clearInterval(timer);
	    }else{
	      alpha+=speed;
	      div1.style.filter="alpha(opacity:"+alpha+")";
	      div1.style.opacity=alpha/100;
	    }
	  },100)
	}
	</script> 
	<c:if test="${errorMsg!=null }">
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog modal-sm" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">登录提示</h4>
	      </div>
	      <div class="modal-body">
	        ${errorMsg }
	      </div>
	    </div>
	  </div>
	</div>
	<script type="text/javascript">
		$('#myModal').modal("show");
	</script>
	</c:if>
	
</body>

</html>