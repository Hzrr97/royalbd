<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<aside class="app-sidebar">
					<div class="app-sidebar__user">
					    <div class="dropdown">
							<a class="nav-link pl-2 pr-2 leading-none d-flex" href="#" data-toggle="dropdown">
								<img alt="image" src="upload/${sessionScope.emp.empImg }" class=" avatar-md rounded-circle">
								<span class="ml-2 d-lg-block">
									<span class="text-white app-sidebar__user-name mt-5">${sessionScope.emp.empName}</span><br>
									<span class="text-muted app-sidebar__user-name text-sm">${sessionScope.emp.roleName}</span>
								</span>
							</a>
						</div>
					</div>
					<ul class="side-menu">
						<li class="slide">
							<a class="side-menu__item"  data-toggle="slide" href="#"><i class="side-menu__icon fa fa-desktop"></i><span class="side-menu__label">主页</span><i class="angle fa fa-angle-right"></i></a>
							<ul class="slide-menu">
								<li><a class="slide-item"  href="index.html"><span>统计</span></a></li>
								<li><a class="slide-item" href="info"><span>个人信息</span></a></li>
								<li><a class="slide-item" href="pwd"><span>密码修改</span></a></li>
							</ul>
						</li>
						<li class="slide">
							<a class="side-menu__item" data-toggle="slide" href="#"><i class="side-menu__icon fa fa-male"></i><span class="side-menu__label">账户管理</span><i class="angle fa fa-angle-right"></i></a>
							<ul class="slide-menu">
								<li><a href="emp" class="slide-item">员工管理</a></li>
								<li><a href="role" class="slide-item"> 职位管理</a></li>
							</ul>
						</li>
						<li class="slide">
							<a class="side-menu__item" data-toggle="slide" href="#"><i class="side-menu__icon fa fa-coffee"></i><span class="side-menu__label">商品管理</span><i class="angle fa fa-angle-right"></i></a>
							<ul class="slide-menu">
								<li><a href="food" class="slide-item">食品管理</a></li>
								<li><a href="foodtype" class="slide-item">食品分类管理</a></li>
							</ul>
						</li>
						<li class="slide">
							<a class="side-menu__item"  href="order"><i class="side-menu__icon fa fa-file-text"></i><span class="side-menu__label">订单管理</span></a>
						</li>
						<li class="slide">
							<a class="side-menu__item"  href="desk"><i class="side-menu__icon fa fa-th-large"></i><span class="side-menu__label">餐桌管理</span></a>
						</li>
						
					</ul>
				</aside>
			