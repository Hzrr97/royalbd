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
                            <li class="breadcrumb-item"><a href="#">商品管理</a></li>
                            <li class="breadcrumb-item active" aria-current="page">食物分类管理</li>
                        </ol>

						<div class="row">
								<div class="col-lg-12">
									<div class="card">
										<div class="card-header">
											<h4>菜品表</h4>
										</div>
										<div class="card-body">
											<form class="form-inline mr-auto">
												<ul class="navbar-nav mr-auto">
													<c:if test="${sessionScope.emp.roleRule==1}">
													<ul class="navbar-nav mr-auto">
														<li><a href="#" data-toggle="modal" data-target="#addModal" class="nav-link nav-link-lg"><button class="btn btn-primary" type="button"><i class="ion ion-plus"></i>添加</button></a></li>
													</ul>
													</c:if>
													<c:if test="${sessionScope.emp.roleRule==0 }">
													<ul class="navbar-nav mr-auto">
														<li><a href="#" data-toggle="modal" data-target="" class="nav-link nav-link-lg root"><button class="btn btn-primary" type="button"><i class="ion ion-plus"></i>添加</button></a></li>
													</ul>
													</c:if>
												</ul>
												
											</form>
											<br />
											<div class="table-responsive">
												<table class="table table-bordered mb-0 text-nowrap">
													<tr>
														<th>#</th>
														<th>菜品名称</th>
														<th>菜品描述</th>
														<th>操作</th>
													</tr>
													<c:set var="count" value="0" />
													<c:forEach items="${pageInfo.list}" var="ft">
													<c:set var="count" value="${count+1}" />
											          <tr>
											            <td>${count}</td>
											            <td>${ft.ftName}</td>
											            <td>${ft.ftDec}</td>
											            <td>
											            <c:if test="${sessionScope.emp.roleRule==1}">
															<a href="foodtype-update?ftId=${ft.ftId }&&pageNo=${pageInfo.pageNum }" class="btn btn-warning" >修改</a>
															<a href="javascript:void(0)" class="btn btn-danger" onclick="showDeleteModal(this)">删除	<input type="hidden" value="${ft.ftId }" /></a>
											            </c:if>
											            <c:if test="${sessionScope.emp.roleRule==0 }">
											            	<a href="#" class="btn btn-warning root" >修改</a>
															<a href="javascript:void(0)" class="btn btn-danger root" >删除	<input type="hidden" value="${ft.ftId }" /></a>
											            </c:if>
											            </td>
											          </tr>
											         </c:forEach>
												</table>
											</div>
											<br/>
											
									        <nav aria-label="Page navigation example">
									        <span style="color:black">
									        	当前<font style="color:#66CD00"> ${pageInfo.pageNum }</font> / <font style="color:#66CD00">${pageInfo.pages }</font>页,
									        	共<font style="color:#66CD00"> ${pageInfo.total }</font> 条记录</span>
												<ul class="pagination  mb-0 pull-right">
													
													<li class="page-item">
														<a class="page-link" href="role?pageNo=${pageInfo.firstPage}"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">首页</font></font></a>
													</li>
													
													<c:if test="${pageInfo.hasPreviousPage }">
													<li class="page-item">
														<a class="page-link" href="role?pageNo=${pageInfo.pageNum-1}"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">上一页</font></font></a>
													</li>
													</c:if>
													<c:if test="${pageInfo.hasNextPage }">
													<li class="page-item">
														<a class="page-link" href="role?pageNo=${pageInfo.pageNum+1}"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">下一页</font></font></a>
													</li>
													</c:if>
													<li class="page-item">
														<a class="page-link" href="role?pageNo=${pageInfo.lastPage}"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">最后页</font></font></a>
													</li>
												</ul>
											</nav>
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
		<!-- 添加 -->
		<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<form action="foodtype-add" class="form-horizontal" method="post">
						<div class="modal-header">
							<h4 class="modal-title" id="myModalLabel">添加菜品</h4>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							
						</div>
						<div class="modal-body">
							<div class="form-group">
								<label class="col-sm-3 control-label">菜品名称：</label>
								<div class="col-sm-9">
									<input type="text" required="required"  class="form-control" name="ftName" placeholder="请输入菜品名称"
									pattern="^[\u4e00-\u9fa5]{1,6}$" oninput="setCustomValidity('');" oninvalid="setCustomValidity('请输入中文');" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">描述：</label>
								<div class="col-sm-9">
									<textarea name="ftDec" rows="7" cols="60" placeholder="请输入少于50字的描述" maxlength="100" onchange="this.value=this.value.substring(0, 100)" onkeydown="this.value=this.value.substring(0, 100)" onkeyup="this.value=this.value.substring(0, 100)"
									pattern="^.{0,50}$" oninvalid="setCustomValidity('请输入少于50字的描述');" oninput="setCustomValidity('');" ></textarea>
								</div>
							</div>
						
							

						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
							<button type="submit" class="btn btn-primary">添加</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<!-- 删除 -->
		<div id="smallModal" class="modal fade" aria-hidden="true" style="display: none;">
			<div class="modal-dialog modal-sm" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h6 class="tx-14 mg-b-0 tx-uppercase tx-inverse tx-bold">提示</h6>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body">
						<input type="hidden" id="deleteId" />
						<p class="mb-0">您确认要删除该条信息吗？</p>
					</div><!-- modal-body -->
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" id="deleteBtn">删除</button>
						<button type="button" class="btn btn-success" data-dismiss="modal" >关闭</button>
					</div>
				</div>
			</div><!-- modal-dialog -->
		</div>
		<c:if test="${updateInfo!=null }"> 
		<!-- 修改 -->
		<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<form action="foodtype-update1" class="form-horizontal" method="post">
						<div class="modal-header">
							<h4 class="modal-title" id="myModalLabel">修改职位</h4>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							
						</div>
						<div class="modal-body">
							<div class="form-group">
								<label class="col-sm-3 control-label">菜品名称：</label>
								<div class="col-sm-9">
									<input type="text" value="${updateInfo.ftName }" required="required"  class="form-control" name="ftName" placeholder="请输入菜品名称"
									pattern="^[\u4e00-\u9fa5]{1,6}$" oninput="setCustomValidity('');" oninvalid="setCustomValidity('请输入中文');" />
									<input type="hidden" value="${updateInfo.ftId }" required="required"  class="form-control" name="ftId" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">描述：</label>
								<div class="col-sm-9">
									<textarea name="ftDec" rows="7" cols="60" placeholder="请输入少于50字的描述" maxlength="100" onchange="this.value=this.value.substring(0, 100)" onkeydown="this.value=this.value.substring(0, 100)" onkeyup="this.value=this.value.substring(0, 100)"
									pattern="^.{0,50}$" oninvalid="setCustomValidity('请输入少于50字的描述');" oninput="setCustomValidity('');" >${updateInfo.ftDec }</textarea>
								</div>
							</div>
							

						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
							<button type="submit" class="btn btn-primary">修改</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		
		</c:if>

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
		// 打开询问是否删除的模态框并设置需要删除的大修的ID
		function showDeleteModal(obj) {
		    var delete_id = $(obj).children("input").val();// 获取隐藏的ID
		    $("#deleteId").val(delete_id);// 将模态框中需要删除的大修的ID设为需要删除的ID
		    $("#smallModal").modal("show");
		}
		function deleteHaulinfo() {
		    var deleteId = $("#deleteId").val();
		    $.ajax({
                type:"POST",
                url:"foodtype-delete",
                data: {ftId:deleteId},
                success:function (data) {
                	if(data=="true"){
                		window.location.reload();
                        alert("删除成功");
                	}else{
                		window.location.reload();
                		alert("删除失败,请先删除该类型下所有食品");
                	}
                    
                }
            })
		}

		$(function() {
			// 删除大修模态框的确定按钮的点击事件
			$("#deleteBtn").click(function() {
				// ajax异步删除
				deleteHaulinfo();
			});
		});

		</script>
		
		<script type="text/javascript">
		$(".page-link").bind('click', function(event) {
			event.stopPropagation();
		});
		$(".btn-warning").bind('click', function(event) {
			event.stopPropagation();
		});
		</script>
		<script type="text/javascript">
		var roots = $(".root");
		roots.click(function() {
			  alert("抱歉，您没有权限进行此项操作");
		});
		
		</script>
		<script type="text/javascript">
		$('#updateModal').modal("show");
		</script>
	</body>
</html>
