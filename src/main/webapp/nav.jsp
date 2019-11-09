<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
				<nav class="navbar navbar-expand-lg main-navbar">
					<a class="header-brand" href="index.jsp">
						<img src="assets/img/brand/logo1.png" class="header-brand-img" alt="Kharna-Admin  logo">
					</a>
					<!--<form class="form-inline mr-auto">-->
						<ul class="navbar-nav mr-auto">
							<li><a href="#" data-toggle="sidebar" class="nav-link nav-link-lg"><i class="ion ion-navicon-round"></i></a></li>
							<!--<li><a href="#" data-toggle="search" class="nav-link nav-link-lg d-md-none navsearch"><i class="ion ion-search"></i></a></li>-->
						</ul>
						<!--<div class="search-element">-->
							<!--<input class="form-control" type="search" placeholder="搜索商品" aria-label="Search">-->
							<!--<button class="btn btn-primary" type="submit"><i class="ion ion-search"></i></button>-->
						<!--</div>-->
					<!--</form>-->
					<ul class="navbar-nav navbar-right">
						
						<li class="dropdown dropdown-list-toggle">
							<a href="#" class="nav-link nav-link-lg full-screen-link">
								<i class="ion-arrow-expand"  id="fullscreen-button"></i>
							</a>
						</li>
						<li class="dropdown"><a href="#" data-toggle="dropdown" class="nav-link dropdown-toggle nav-link-lg">
							<img src="upload/${sessionScope.emp.empImg }" alt="profile-user" class="rounded-circle w-32">
							<div class="d-sm-none d-lg-inline-block">${sessionScope.emp.empName}</div></a>
							<div class="dropdown-menu dropdown-menu-right">
								<a href="info" class="dropdown-item has-icon">
									<i class="ion ion-android-person"></i> 个人信息
								</a>
								<a href="pwd" class="dropdown-item has-icon">
									<i class="ion ion-gear-a"></i> 密码修改
								</a>
								<a href="login" class="dropdown-item has-icon">
									<i class="ion-ios-redo"></i> 注销
								</a>
							</div>
						</li>
					</ul>
				</nav>