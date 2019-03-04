<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
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
					<section class="section" data-toggle="section">
                    	<ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="#">主页</a></li>
                            <li class="breadcrumb-item active" aria-current="page">密码修改</li>
                        </ol>

						<div class="row">
							<div class="col-lg-12 col-xl-3 col-md-12 col-sm-12"></div>
							<div class="col-lg-12 col-xl-6 col-md-12 col-sm-12">
								<div class="card">
									<div class="card-header">
										<h4><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">个人信息</font></font></h4>
									</div>
									<div class="card-body">
										<form class="form-horizontal" action="pwd-update" method="post">
											<div class="form-group">
												<label class="col-sm-3 control-label">原密码：</label>
												<div class="col-sm-9">
													<input type="password" required="required" pattern="^.{3,10}$" class="form-control" name="oldPwd" placeholder="请输入3-10位的密码" />
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-3 control-label">新密码：</label>
												<div class="col-sm-9">
													<input type="password" id="pwd1" required="required" pattern="^.{3,10}$" class="form-control" name="empPwd" placeholder="请输入3-10位的密码" />
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-3 control-label">新密码确认：</label>
												<div class="col-sm-9">
													<input type="password" id="pwd2" required="required" pattern="^.{3,10}$" class="form-control" name="empPwdc" placeholder="请输入3-10位的密码" />
												</div>
											</div>
											
											
											<div class="form-group pull-right">
											<button type="submit" class="btn btn-primary m-b-5 m-t-5 "><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">修改</font></font></button>							
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
					</section>
				</div>

				<footer class="main-footer">
					<div class="text-center">
						Copyright &copy;Royaltea 2018. Design By<a href="#"> ZhuoRan Huang</a>
					</div>
				</footer>

			</div>
		</div>
		
		

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
		
		<script type="text/javascript">
		
		$(".btn").bind('click', function(event) {
			event.stopPropagation();
		});
		
		</script>
		<c:if test="${errorMsg!=null }">
		<div id="smallModal" class="modal fade" aria-hidden="true" style="display: none;">
			<div class="modal-dialog modal-sm" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h6 class="tx-14 mg-b-0 tx-uppercase tx-inverse tx-bold">错误提示</h6>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body">
						<input type="hidden" id="deleteId" />
						<p class="mb-0">${errorMsg }</p>
					</div><!-- modal-body -->
					<div class="modal-footer">
						<button type="button" class="btn btn-success" data-dismiss="modal" >关闭</button>
					</div>
				</div>
			</div><!-- modal-dialog -->
		</div>
		<script type="text/javascript">
			$('#smallModal').modal("show");
		</script>
		</c:if>
	</body>
</html>