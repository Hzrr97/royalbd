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
                            <li class="breadcrumb-item active" aria-current="page">个人信息</li>
                        </ol>

						<div class="row">
							<div class="col-lg-12 col-xl-3 col-md-12 col-sm-12"></div>
							<div class="col-lg-12 col-xl-6 col-md-12 col-sm-12">
								<div class="card">
									<div class="card-header">
										<h4><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">个人信息</font></font></h4>
									</div>
									<div class="card-body">
										<form class="form-horizontal" action="info-update" method="post" enctype="multipart/form-data">
											<div class="form-group">
												<label class="col-sm-3 control-label">员工账户名：</label>
												<div class="col-sm-9">
													<input type="text" readonly="r" value="${sessionScope.emp.empLid }" required="required" pattern="^[a-zA-Z]\w{2,14}$" class="form-control" name="empLid" placeholder="请输入3-15位的字符" />
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-3 control-label">头像上传：</label>
												<div class="col-sm-9">
												<input type=file name="img" id="doc" onchange="showImage();">												
												</div>
											
												<div id="localImag">
								                    <img id="preview" width=-1 height=-1 style="diplay:none" />
								                </div>
											</div>
											
											<div class="form-group">
												<label class="col-sm-3 control-label">职位：</label>
												<div class="col-sm-9">
												<c:if test="${sessionScope.emp.roleRule==0 }">
													<select id ="selectroot" required="required" name="roleId" class="form-control" 
													onfocus="this.defaultIndex=this.selectedIndex;"
													onchange="this.selectedIndex=this.defaultIndex;" >
													
												</c:if>
												<c:if test="${sessionScope.emp.roleRule==1 }">
													<select required="required" name="roleId" class="form-control">
												</c:if>
														<option value="">请选择职位</option>
														
														<c:forEach items="${roleInfo}" var="role">
														<c:choose> 
				
														 <c:when test="${role.roleId==sessionScope.emp.roleId }">    <!--如果 --> 
															<option value="${role.roleId }" selected="selected">
															${role.roleName }
															</option>
														 </c:when>      
														
														  <c:otherwise>  <!--否则 -->    
															<option value="${role.roleId }">
															${role.roleName }
															</option>
														  </c:otherwise> 
														
														</c:choose>
														
														</c:forEach>
													</select>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-3 control-label">姓名：</label>
												<div class="col-sm-9">
													<input type="hidden" value="${sessionScope.emp.empId }" required="required"  class="form-control" name="empId" />
													<input type="text" value="${sessionScope.emp.empName }" required="required" pattern="^[\u4e00-\u9fa5]{2,4}$" class="form-control" name="empName" placeholder="请输入2-4位的中文姓名" oninvalid="setCustomValidity('请输入中文名字');" oninput="setCustomValidity('');" />
												</div>
											</div>
											
											<div class="form-group">
												<label class="col-sm-3 control-label">性别：</label>
												<div class="col-sm-9">
													<c:choose> 
														 <c:when test="${sessionScope.emp.empSex == 0}">    <!--如果 --> 
															<label class="checkbox-inline">
															  <input type="radio" value="0" name="empSex" checked="checked"/> 男
															</label>
															<label class="checkbox-inline">
															  <input type="radio" value="1" name="empSex" /> 女
															</label>
														 </c:when>      
														  <c:otherwise>  <!--否则 -->    
															<label class="checkbox-inline">
															  <input type="radio" value="0" name="empSex" /> 男
															</label>
															<label class="checkbox-inline">
															  <input type="radio" value="1" name="empSex" checked="checked"/> 女
															</label>
														  </c:otherwise> 
														</c:choose>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-3 control-label">出生日期：</label>
												<div class="col-sm-9">
													<input type="date" value="${sessionScope.emp.birthtime }" required="required" pattern="^\d{4}-\d{1,2}-\d{1,2}$" class="form-control" name="empBirthtime1" placeholder="请输入yyyy-MM-dd格式的日期" />
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-3 control-label">入职日期：</label>
												<div class="col-sm-9">
													<input type="date" value="${sessionScope.emp.worktime }" required="required" pattern="^\d{4}-\d{1,2}-\d{1,2}$" class="form-control" name="empWorktime1" placeholder="请输入yyyy-MM-dd格式的日期" />
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-3 control-label">电话：</label>
												<div class="col-sm-9">
													<input type="text" value="${sessionScope.emp.empTel }" class="form-control" name="empTel" placeholder="请输入电话"
													pattern="^1([358][0-9]|4[579]|66|7[0135678]|9[89])[0-9]{8}$" required="required" oninvalid="setCustomValidity('请输入正确的手机号');" oninput="setCustomValidity('');" />
												</div>
											</div>		
											<c:if test="${sessionScope.emp.roleRule==1 }">					
											<div class="form-group">
												<label class="col-sm-3 control-label">月薪：</label>
												<div class="col-sm-9">
													<input type="text" value="${sessionScope.emp.empSalary }" class="form-control" required="required" 
													pattern="^[0-9]+([.]{1}[0-9]{0,2}){0,1}$" name="empSalary" placeholder="请输入月薪" oninvalid="setCustomValidity('请输入小数不超过两位的数字');" oninput="setCustomValidity('');" />
												</div>
											</div>
											</c:if>
											<c:if test="${sessionScope.emp.roleRule==0 }">					
											<div class="form-group">
												<label class="col-sm-3 control-label">月薪：</label>
												<div class="col-sm-9">
													<input type="text" value="${sessionScope.emp.empSalary }" class="form-control" required="required" readonly="readonly"
													pattern="^[0-9]+([.]{1}[0-9]{0,2}){0,1}$" name="empSalary" placeholder="请输入月薪" oninvalid="setCustomValidity('请输入小数不超过两位的数字');" oninput="setCustomValidity('');" />
												</div>
											</div>
											</c:if>
											<div class="form-group pull-right">
											<a href="info" class="btn btn-warning m-b-5 m-t-5 "><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">重置</font></font></a>
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
		$(".form-control").bind('click', function(event) {
			event.stopPropagation();
		});
		$(".checkbox-inline").bind('click', function(event) {
			event.stopPropagation();
		});
		$(".btn").bind('click', function(event) {
			event.stopPropagation();
		});
		$("#doc").bind('click', function(event) {
			event.stopPropagation();
		});
		</script>
		<script type="text/javascript">
    function showImage() {
        var docObj = document.getElementById("doc");
        var f=$(docObj).val();
        var imgObjPreview = document.getElementById("preview");
        if(!/\.(?:png|jpg|bmp|gif|PNG|JPG|BMP|GIF)$/.test(f))
        {
            alert("类型必须是图片(.png|jpg|bmp|gif|PNG|JPG|BMP|GIF)");
            $(docObj).val('');
            return false;
        }
        if (docObj.files && docObj.files[0]) {
            //火狐下，直接设img属性  
            imgObjPreview.style.display = 'block';
            imgObjPreview.style.width = '220px';
            imgObjPreview.style.height = '200px';
            //imgObjPreview.src = docObj.files[0].getAsDataURL();  
            //火狐7以上版本不能用上面的getAsDataURL()方式获取，需要一下方式  
            imgObjPreview.src = window.URL.createObjectURL(docObj.files[0]);
        } else {
            //IE下，使用滤镜  
            docObj.select();
            var imgSrc = document.selection.createRange().text;
            var localImagId = document.getElementById("localImag");
            //必须设置初始大小  
            localImagId.style.width = "150px";
            localImagId.style.height = "200px";
          
            //图片异常的捕捉，防止用户修改后缀来伪造图片 
            try {
                localImagId.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
                localImagId.filters
                        .item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;
            } catch (e) {
                alert("您上传的图片格式不正确，请重新选择!");
                return false;
            }
            imgObjPreview.style.display = 'none';
            document.selection.empty();
        }
        return true;
    }
</script>

		<script type="text/javascript">
		$("#selectroot").click( function(event) {
			alert("抱歉，您没有权限进行此项操作！");
		});
		
		</script>
	</body>
</html>