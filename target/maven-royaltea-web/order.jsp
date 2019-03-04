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
                            <li class="breadcrumb-item"><a href="#">订单管理</a></li>
                            <li class="breadcrumb-item active" aria-current="page">订单管理</li>
                        </ol>

						<div class="row">
								<div class="col-lg-12">
									<div class="card">
										<div class="card-header">
											<h4>订单表</h4>
										</div>
										<div class="card-body">
											<form class="form-inline mr-auto" action="order-search">
												<ul class="navbar-nav mr-auto">
													<li><button class="btn btn-primary" onclick="location.reload()" type="button"><i class="ion ion-refresh"></i>刷新</button>
													&nbsp;&nbsp;
													<button class="btn btn-danger" onclick="reFresh()" type="button" name="false"><i class="ion ion-pause"></i>取消刷新</button>&nbsp;&nbsp;(该页面默认30s刷新一次)</li>
													</li>
												</ul>
												
												
												<div class="search-element">
													<select class="form-control" name="dId">
														  <option value ="">所有桌号</option>
														  <c:forEach items="${deskInfo}" var="d">
															<c:choose> 
					
															 <c:when test="${d.dId==sessionScope.orderKey.dId }">    <!--如果 --> 
																<option value="${d.dId }" selected="selected">
																${d.dId }号桌
																</option>
															 </c:when>      
															
															  <c:otherwise>  <!--否则 -->    
																<option value="${d.dId }">
																${d.dId }号桌
																</option>
															  </c:otherwise> 
															
															</c:choose>
															
															</c:forEach>
													</select>
													&nbsp;
													<select class="form-control" name="time">
														  <option value =0>所有时间</option>
														  <c:if test="${sessionScope.orderKey.time==0 || sessionScope.orderKey.time==null }">
															<option value = 1 >今天</option>
															<option value = 2>昨天</option> 
															<option value = 3>一周内</option> 
															<option value = 4>一个月内</option> 
															<option value = 5>三个月内</option> 
														</c:if>
														 <c:if test="${sessionScope.orderKey.time==1 }">
															<option value = 1 selected="selected">今天</option>
															<option value = 2>昨天</option> 
															<option value = 3>一周内</option> 
															<option value = 4>一个月内</option> 
															<option value = 5>三个月内</option> 
														</c:if>
														<c:if test="${sessionScope.orderKey.time==2 }">
															<option value = 1>今天</option>
															<option value = 2 selected="selected">昨天</option> 
															<option value = 3>一周内</option> 
															<option value = 4>一个月内</option> 
															<option value = 5>三个月内</option> 
														</c:if>
														<c:if test="${sessionScope.orderKey.time==3 }">
															<option value = 1>今天</option>
															<option value = 2>昨天</option> 
															<option value = 3 selected="selected">一周内</option> 
															<option value = 4>一个月内</option> 
															<option value = 5>三个月内</option> 
														</c:if>
														<c:if test="${sessionScope.orderKey.time==4 }">
															<option value = 1>今天</option>
															<option value = 2>昨天</option> 
															<option value = 3>一周内</option> 
															<option value = 4 selected="selected">一个月内</option> 
															<option value = 5>三个月内</option> 
														</c:if>
														<c:if test="${sessionScope.orderKey.time==5 }">
															<option value = 1>今天</option>
															<option value = 2>昨天</option> 
															<option value = 3>一周内</option> 
															<option value = 4>一个月内</option> 
															<option value = 5 selected="selected">三个月内</option> 
														</c:if>
													</select>
													&nbsp;
													<select class="form-control" name="out">
														  <option value =0>所有形式</option>
														  <c:if test="${sessionScope.orderKey.out==0 || sessionScope.orderKey.out==null }">
															<option value = 1 >堂吃</option>
															<option value = 2>打包</option> 
														</c:if>
														 <c:if test="${sessionScope.orderKey.out==1 }">
															<option value = 1 selected="selected">堂吃</option>
															<option value = 2>打包</option> 
														</c:if>
														<c:if test="${sessionScope.orderKey.out==2 }">
															<option value = 1 >堂吃</option>
															<option value = 2 selected="selected">打包</option> 
														</c:if>
													</select>
													&nbsp;
													<select class="form-control" name="status">
														  <option value =0>所有状态</option>
														  <c:if test="${sessionScope.orderKey.status==0 || sessionScope.orderKey.status==null }">
															<option value = 1 >未完成</option>
															<option value = 2>完成</option> 
														</c:if>
														 <c:if test="${sessionScope.orderKey.status==1 }">
															<option value = 1 selected="selected">未完成</option>
															<option value = 2>完成</option> 
														</c:if>
														<c:if test="${sessionScope.orderKey.status==2 }">
															<option value = 1 >未完成</option>
															<option value = 2 selected="selected">完成</option> 
														</c:if>
													</select>
													&nbsp;
													<input class="form-control" type="search" placeholder="搜索订单号" aria-label="Search" name="oId" value="${sessionScope.orderKey.oId }">
													<button class="btn btn-primary btn-abc" type="submit"><i class="ion ion-search"></i></button>
												</div>
											</form>
											<br />
											<div class="table-responsive">
												<table class="table table-bordered mb-0 text-nowrap table-hover table-expandable">
													<thead style="background: white;">
													<tr>
														<th>#</th>
														<th>订单编号</th>
														<th>桌号</th>
														<th>下单时间</th>
														<th>形式</th>
														<th>完成状态</th>
														<th>总价</th>
														<th>备注</th>
														<th>操作</th>
													</tr>
													</thead>
													<tbody>
													<c:set var="count" value="0" />
													<c:forEach items="${pageInfo.list}" var="o">
													<c:set var="count" value="${count+1}" />
											          <tr>
											            <td>${count}</td>
											            <td>${o.oId}</td>
											            <td>${o.odId}号桌</td>
											            <td>${o.oTimes}</td>
											            <td>
											            	<c:if test="${o.oOut==0}">
											            	堂吃
											            	</c:if>
											            	<c:if test="${o.oOut==1}">
											            	打包
											            	</c:if>
											            </td>
											            <td>
											            	<c:if test="${o.oStatus==0}">
											            	<label class="custom-switch">
																<input type="checkbox" name="custom-switch-checkbox" class="custom-switch-input" onclick="checkboxOnclick(this)" value="true" >
																<input id="status" type="hidden" value="${o.oId }" />
																<span class="custom-switch-indicator"></span>
															</label>
															</c:if>
															<c:if test="${o.oStatus==1}">
											            	<label class="custom-switch">
																<input type="checkbox" name="custom-switch-checkbox" class="custom-switch-input" onclick="checkboxOnclick(this)" value="true" checked="checked">
																<input id="status" type="hidden" value="${o.oId }" />
																<span class="custom-switch-indicator"></span>
															</label>
															</c:if>
											            </td>
											            <td>¥${o.oTotal }</td>
											            <td>${o.oDec }</td>
											            <td>
											            <c:if test="${sessionScope.emp.roleRule==1 }">
															<a href="javascript:void(0)" class="btn btn-danger" onclick="showDeleteModal(this)">删除	<input type="hidden" value="${o.oId }" /></a>
											            </c:if>
											            <c:if test="${sessionScope.emp.roleRule==0 }">
															<a href="javascript:void(0)" class="btn btn-danger root" >删除	<input type="hidden" value="${o.oId }" /></a>
											            </c:if>
											            </td>
											          </tr>
											         <tr>
											         	<td colspan="9" style="padding-bottom: 0px;padding-top: 20px">
											         	<div class="col-lg-12">
															<div class="card" >
																<div class="card-header" style="padding-top: 10px;padding-bottom: 10px;">
																	<h4>订单详情</h4>
																</div>
																<div class="card-body" style="padding-top: 15px;padding-bottom: 15px;">
																	
																	<div class="table-responsive">
																		<table class="table table-bordered mb-0 text-nowrap">
																			<tr>
																				<th>#</th>
																				<th>图片</th>
																				<th>名称</th>
																				<th>类型</th>
																				<th>价格</th>
																				<th>数量</th>
																			</tr>
																			
																			<c:set var="count1" value="0" />
																			<c:forEach items="${o.oiList}" var="oi">
																			<c:set var="count1" value="${count1+1}" />
																	          <tr>
																	            <td>${count1}</td>
																	            <td style="padding: 0px;width: 110px">
																	            	<img alt="无" src="upload/${oi.fImg }" width="100px" height="50px">							
																	            </td>
																	            <td>${oi.fName}</td>
																	            <td>${oi.ftName}</td>
																	            
																	            <td>
																		            <c:if test="${oi.fPrice==oi.fDprice}">
																		            ¥${oi.fPrice}
																		            </c:if>
																		            <c:if test="${oi.fPrice!=oi.fDprice}">
																		            <font color='red'>¥${oi.fDprice}</font>(¥${oi.fPrice})
																		        	</c:if>
																	            </td>
																	            <td>x${oi.fNum }</td>
																	          </tr>
																	         </c:forEach>
																		</table>
																	</div>
																</div>
															</div>
														</div>
											         	</td>
											         	</tr>
											         </c:forEach>
											         </tbody>
												</table>
											</div>
											<br/>
											
									        <nav aria-label="Page navigation example">
									        <span style="color:black">
									        	当前<font style="color:#66CD00"> ${pageInfo.pageNum }</font> / <font style="color:#66CD00">${pageInfo.pages }</font>页,
									        	共<font style="color:#66CD00"> ${pageInfo.total }</font> 条记录</span>
												<ul class="pagination  mb-0 pull-right">
													
													<li class="page-item">
														<a class="page-link" href="order?pageNo=${pageInfo.firstPage}"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">首页</font></font></a>
													</li>
													
													<c:if test="${pageInfo.hasPreviousPage }">
													<li class="page-item">
														<a class="page-link" href="order?pageNo=${pageInfo.pageNum-1}"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">上一页</font></font></a>
													</li>
													</c:if>
													<c:if test="${pageInfo.hasNextPage }">
													<li class="page-item">
														<a class="page-link" href="order?pageNo=${pageInfo.pageNum+1}"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">下一页</font></font></a>
													</li>
													</c:if>
													<li class="page-item">
														<a class="page-link" href="order?pageNo=${pageInfo.lastPage}"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">最后页</font></font></a>
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
                url:"order-delete",
                data: {oId:deleteId},
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
		$(".btn-danger").bind('click', function(event) {
			event.stopPropagation();
		});
		$(".btn-abc").bind('click', function(event) {
			event.stopPropagation();
		});
		$(".dec").bind('click', function(event) {
			event.stopPropagation();
		});
		$(".custom-switch-indicator").bind('click', function(event) {
			event.stopPropagation();
		});
		$(".custom-switch-input").bind('click', function(event) {
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
		
		var t1=window.setInterval(refreshCount, 30000);
	    function refreshCount() {
	    	location.reload();
	    }
	    //去掉定时器的方法  
	    
		function reFresh(){
				window.clearInterval(t1);
				alert("您已取消自动刷新");
		} 
		
		(function ($) {
		    $(function () {
		        $('.table-expandable').each(function () {
		            var table = $(this);
		            table.children('tbody').children('tr').filter(':odd').hide();
		            table.children('tbody').children('tr').filter(':even').click(function () {
		                var element = $(this);
		                element.next('tr').toggle('normal');
		                element.find(".table-expandable-arrow").toggleClass("up");
		            });
		            table.children('tbody').children('tr').filter(':even').each(function () {
		                var element = $(this).children("td:last-child");
		                element.append('<div class="table-expandable-arrow"></div>');
		            });
		        });
		    });
		})(jQuery); 
		
		function checkboxOnclick(checkbox){
			var delete_id = $(checkbox).next().val();
			if ( checkbox.checked == true){
			//Action for checked
				$.ajax({
	                type:"POST",
	                url:"ostatus-update",
	                data: {oId:delete_id,status:1},
	                success:function (data) {
	                	if(data=="true"){
	                        alert("订单完成");
	                	}else{
	                		alert("订单未完成");
	                	}
	                    
	                }
	            })
			 
			}else{
			//Action for not checked
			 $.ajax({
                type:"POST",
                url:"ostatus-update",
                data: {oId:delete_id,status:0},
                success:function (data) {
                	if(data=="true"){
                        alert("订单未完成");
                	}else{
                		alert("订单已完成");
                	}
                    
                }
            })
			}
		}
		</script>
		
	</body>
</html>
