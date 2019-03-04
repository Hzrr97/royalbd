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
                    	<ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="#">餐桌管理</a></li>
                            <li class="breadcrumb-item active" aria-current="page">餐桌管理</li>
                            <li style="position: relative;left:390px;font-weight: bold;">
                            （&nbsp;点击餐桌图片生成二维码&nbsp;）</li>
                        </ol>

						<div class="row">
						<c:forEach items="${deskList}" var="d">
							<div class="col-lg-4 col-xl-2 col-md-4 col-sm-4">
								<div class="card">
								<c:if test="${d.dStatus==0 }">
									<div class="card-header" style="padding:15px;padding-right: 0px;padding-left: 20px;">
										<h4>${d.dId }号桌
										<c:if test="${d.dStatus==0 }">
										<a style="margin-left: 18px;" href="javascript:void(0)" class="btn btn-warning" onclick="showPlanModal(this)">预<input type="hidden" value="${d.dId }" /></a>
										</c:if>
										<c:if test="${d.dStatus==1 }">
										<a style="margin-left: 18px;" href="desk-update?dId=${d.dId }" class="btn btn-warning" >查</a>
										</c:if>
										<a style="margin-left: 5px;" href="javascript:void(0)" class="btn btn-danger" onclick="showDeleteModal(this)">X<input type="hidden" value="${d.dId }" /></a>
										</h4>
									</div>
									</c:if>
									<c:if test="${d.dStatus==1 }">
									<div class="card-header" style="padding:15px;padding-right: 0px;padding-left: 20px;background-color:#F2F2F2;">
										<h4>${d.dId }号桌
										<c:if test="${d.dStatus==0 }">
										<a style="margin-left: 18px;" href="javascript:void(0)" class="btn btn-warning" onclick="showPlanModal(this)">预<input type="hidden" value="${d.dId }" /></a>
										</c:if>
										<c:if test="${d.dStatus==1 }">
										<a style="margin-left: 18px;" href="desk-update?dId=${d.dId }" class="btn btn-warning" >查</a>
										</c:if>
										<a style="margin-left: 5px;" href="javascript:void(0)" class="btn btn-danger" onclick="showDeleteModal(this)">X<input type="hidden" value="${d.dId }" /></a>
										</h4>
									</div>
									</c:if>
									<div class="card-body" data-did="${d.dId }" onclick="showQR(this)" style="padding:0px;margin-top:20px;margin-left:10px;margin-right:10px;background-image: url('assets/img/desk.jpg');background-size: 100% 100%;">
									<br/><br/><br/><br/><br/>
									</div>
								</div>
							</div>
								
						</c:forEach>
							<div class="col-lg-4 col-xl-2 col-md-4 col-sm-4">
								<div class="card"  >
									<div onclick="showAddModal(this)" style="margin:30px;;background-image: url('assets/img/add.png');background-size: 100% 100%;">
										<br/><br/><br/><br/><br/><br/>
									</div>
								</div>
							</div>
							
						</div>

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
					<form action="desk-add" class="form-horizontal" method="post">
						<div class="modal-header">
							<h4 class="modal-title" id="myModalLabel">添加餐桌</h4>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							
						</div>
						<div class="modal-body">
							<div class="form-group">
								<label class="col-sm-3 control-label">餐桌号：</label>
								<div class="col-sm-9">
									<input type="text" required="required"  class="form-control" name="dId" placeholder="请输入餐桌号"
									pattern="^\d{1,2}$" oninput="setCustomValidity('');" oninvalid="setCustomValidity('请输入1-2位餐桌号');" />
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
						<p class="mb-0">您确认要删除该餐桌吗？删除后该餐桌订单信息将一并删除</p>
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
					<form action="desk-update1" class="form-horizontal" method="post">
						<div class="modal-header">
							<h4 class="modal-title" id="myModalLabel">查看预定</h4>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							
						</div>
						<div class="modal-body">
							<div class="form-group">
								<label class="col-sm-3 control-label">名字：</label>
								<div class="col-sm-9">
									<input type="text" required="required" value="${updateInfo.dName }"  class="form-control" name="dName" placeholder="请输入菜品名称"
									pattern="^[\u4e00-\u9fa5]{1,6}$" oninput="setCustomValidity('');" oninvalid="setCustomValidity('请输入中文');" />
									<input type="hidden" id="planId" required="required" value="${updateInfo.dId }"  class="form-control" name="dId" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">电话：</label>
								<div class="col-sm-9">
									<input type="text" value="${updateInfo.dTel }" class="form-control" name="dTel" placeholder="请输入11位电话"
									pattern="^1([358][0-9]|4[579]|66|7[0135678]|9[89])[0-9]{8}$" required="required" oninvalid="setCustomValidity('请输入正确的手机号');" oninput="setCustomValidity('');" />
								</div>
							</div>		
							<div class="form-group">
								<label class="col-sm-3 control-label">就餐日期：</label>
								<div class="col-sm-9">
									<input type="date" value="${updateInfo.dTimes }" required="required" pattern="^\d{4}-\d{1,2}-\d{1,2}$" class="form-control" name="dTimes" placeholder="请输入yyyy-MM-dd格式的日期" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">就餐时间：</label>
								<div class="col-sm-9">
									<input type="time" value="${updateInfo.dTimes1 }" required="required"  class="form-control" name="dTimes1" placeholder="请输入yyyy-MM-dd格式的日期" />
								</div>
							</div>
							

						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
							<a class="btn btn-warning" href="desk-deletePlan?dId=${updateInfo.dId }">删除</a>
							<button type="submit" class="btn btn-primary">修改</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		
		</c:if>
		<div class="modal fade" id="planModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<form action="desk-update1" class="form-horizontal" method="post">
						<div class="modal-header">
							<h4 class="modal-title" id="myModalLabel">添加预定</h4>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							
						</div>
						<div class="modal-body">
							<div class="form-group">
								<label class="col-sm-3 control-label">名字：</label>
								<div class="col-sm-9">
									<input type="text" required="required"  class="form-control" name="dName" placeholder="请输入菜品名称"
									pattern="^[\u4e00-\u9fa5]{1,6}$" oninput="setCustomValidity('');" oninvalid="setCustomValidity('请输入中文');" />
									<input type="hidden" id="planId" required="required"  class="form-control" name="dId" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">电话：</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" name="dTel" placeholder="请输入11位电话"
									pattern="^1([358][0-9]|4[579]|66|7[0135678]|9[89])[0-9]{8}$" required="required" oninvalid="setCustomValidity('请输入正确的手机号');" oninput="setCustomValidity('');" />
								</div>
							</div>		
							<div class="form-group">
								<label class="col-sm-3 control-label">就餐日期：</label>
								<div class="col-sm-9">
									<input type="date" required="required" pattern="^\d{4}-\d{1,2}-\d{1,2}$" class="form-control" name="dTimes" placeholder="请输入yyyy-MM-dd格式的日期" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">就餐时间：</label>
								<div class="col-sm-9">
									<input type="time" required="required"  class="form-control" name="dTimes1" placeholder="请输入yyyy-MM-dd格式的日期" />
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
                url:"desk-delete",
                data: {dId:deleteId},
                success:function (data) {
                	if(data=="true"){
                		window.location.reload();
                        alert("删除成功");
                	}else{
                		window.location.reload();
                		alert("删除失败");
                	}
                    
                }
            })
		}
		
		function showQR(obj){
			var dId1 = $(obj).data('did');
			alert(dId1);
			var host1 = '127.0.0.1';
			$.ajax({
                type:"POST",
                url:"desk-showQR",
                data: {dId:dId1,host:host1},
                success:function (data) {
                	window.location.href='upload/'+data;
                    
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
		
		function showPlanModal(obj) {
		    var plan_id = $(obj).children("input").val();// 获取隐藏的ID
		    $("#planId").val(plan_id);// 将模态框中需要删除的大修的ID设为需要删除的ID
		    $("#planModal").modal("show");
		}
		
		function showAddModal(obj) {
		    $("#addModal").modal("show");
		}
		
		
		</script>
		<c:if test="${errorMsg!=null }">
		<div id="errorModal" class="modal fade" aria-hidden="true" style="display: none;">
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
			$('#errorModal').modal("show");
		</script>
		</c:if>
		
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
