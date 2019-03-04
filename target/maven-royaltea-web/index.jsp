<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
	<head>
		<jsp:include page="head.jsp"/>
	</head>

	<body class="app ">

		<div id="spinner"></div>

		<div id="app">
			<div class="main-wrapper" >
				<jsp:include page="nav.jsp"/>

				<jsp:include page="aside.jsp"/>

				<div class="app-content">
					<section class="section" data-toggle="section">
                    	<ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="#" class="text-muted">Home</a></li>
                            <li class="breadcrumb-item active text-" aria-current="page">Dashboard 01</li>
                        </ol>

						<div class="row">
							<div class="col-lg-6 col-xl-3 col-md-6 col-sm-6 col-12">
								<div class="card">
									<div class="card-body">
										<div class="row">
											<div class="col-6">
												<div class="dash1">
													<h4 class="text-dark">675</h4>
													<small class="text-muted ">Posts</small>
												</div>
											</div>
											<div class="col-6">
												<div id="chart1" class="overflow-hidden"></div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-6 col-xl-3 col-md-6 col-sm-6 col-12">
								<div class="card">
									<div class="card-body">
										<div class="row">
											<div class="col-6">
												<div class="dash1">
													<h4 class="text-dark">875</h4>
													<small class="text-muted">Clicks</small>
												</div>
											</div>
											<div class="col-6">
												<div id="chart2" class="overflow-hidden"></div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-6 col-xl-3 col-md-6 col-sm-6 col-12">
								<div class="card">
									<div class="card-body">
										<div class="row">
											<div class="col-6">
												<div class="dash1">
													<h4 class="text-dark">976</h4>
													<small class="text-muted">Shares</small>
												</div>
											</div>
											<div class="col-6">
												<div id="chart3" class="overflow-hidden"></div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-6 col-xl-3 col-md-6 col-sm-6 col-12">
								<div class="card">
									<div class="card-body">
										<div class="row">
											<div class="col-6">
												<div class="dash1">
													<h4 class="text-dark">418</h4>
													<small class="text-muted">Remarks</small>
												</div>
											</div>
											<div class="col-6">
												<div id="chart4" class="overflow-hidden"></div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

						

						<div class="row ">
							<div class="col-lg-12 col-xl-6 col-md-12 col-12 col-sm-12">
								<div class="card">
									<div class="card-header">
										<h4>Monthly Sales</h4>
									</div>
									<div class="card-body">
										<div id="bar-chart" class="overflow-hidden" > </div>
									</div>
								</div>
							</div>
							<div class="col-lg-12 col-xl-6 col-md-12 col-12 col-sm-12">
								<div class="card">
									<div class="card-header">
										<h4>Yearly Template Sales</h4>
									</div>
									<div class="card-body">
										<div id="sales-chart" class="overflow-hidden"> </div>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-12 col-sm-12">
								<div class="card">
									<div class="card-header">
										<h4>Account Retention</h4>
									</div>
									<div class="card-body">
										<div id="index" class="overflow-hidden h-400 mx-auto text-center " ></div>
									</div>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-lg-12 col-xl-8 col-md-12 col-12 col-sm-12">
								<div class="card">
								<div class="pt-0 pb-0 pl-3 pr-3 card-body">
									<div class="row">
										<div class="col-xs-12 col-lg-5 cover-image weather-radius text-center position-relative transparent" data-image-src="assets/img/weather.jpg">
											<div class="weather-shade">
												<i class="wi wi-day-sleet text-white"></i>
											</div>
											<div class="card-body mt-5 pt-5">
												<i class="vl_weather-day-rain text-light  mt-5 pt-5 d-block"></i>
											</div>
											<div class="bg-transparent border-0 text-light  pt-4">
												<h3 class="weight300">Sunny Day</h3>
											</div>
										</div>
										<div class="col-xs-12 col-lg-7 widgetb p-0">
											<div class="card-body p-4">
												<h4 class="mb-0">MONDAY <br/>
													<span class="text-muted h5"> 22  October</span>
												</h4>
												<div class="fs-45 text-primary pt-4 ">
													32<sup>o</sup>
													<span class="h3 ">Sunny</span>
												</div>
											</div>
											<div class="card-footer bg-white text-center ">
												<div class="row">
													<div class="col-sm-2 col-4 mt-2 pb-2">
														<h6 class="text-muted mb-3">TUE</h6>
														<i class="fe fe-cloud-rain"></i>
														<p class="mb-0 text-muted">18<sup>o</sup>c</p>
													</div>
													<div class="col-sm-2 col-4 mt-2 pb-2">
														<h6 class="text-muted mb-3">WED</h6>
														<i class="fe fe-cloud"></i>
														<p class="mb-0 text-muted">22<sup>o</sup>c</p>
													</div>
													<div class="col-sm-2 col-4 mt-2 pb-2">
														<h6 class="text-muted mb-3">THU</h6>
														<i class="fe fe-cloud-snow"></i>
														<p class="mb-0 text-muted">15<sup>o</sup>c</p>
													</div>
													<div class="col-sm-2 col-4 mt-2 pb-2">
														<h6 class="text-muted mb-3">FRI</h6>
														<i class="fe fe-cloud-rain"></i>
														<p class="mb-0 text-muted">19<sup>o</sup>c</p>
													</div>
													<div class="col-sm-2 col-4 mt-2 pb-2">
														<h6 class="text-muted mb-3">SAT</h6>
														<i class="fe fe-cloud"></i>
														<p class="mb-0 text-muted">29<sup>o</sup>c</p>
													</div>
													<div class="col-sm-2 col-4 mt-2 pb-2">
														<h6 class="text-muted mb-3">SUN</h6>
														<i class="fe fe-cloud-snow"></i>
														<p class="mb-0 text-muted">17<sup>o</sup>c</p>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								</div>
							</div>

							<div class="col-lg-12 col-xl-4 col-md-12 col-12 col-sm-12">
								<div class="card">
									<div id="calendar-1"></div>
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

		<!--Sidemenu js-->
		<script src="assets/plugins/toggle-menu/sidemenu.js"></script>

		<!--mCustomScrollbar js-->
		<script src="assets/plugins/scroll-bar/jquery.mCustomScrollbar.concat.min.js"></script>

		<!-- ECharts -->
		<script src="assets/plugins/echarts/dist/echarts.js"></script>

		<!--Min Calendar -->
		<script src="assets/plugins/fullcalendar/calendar.min.js"></script>
		<script src="assets/plugins/fullcalendar/custom_calendar.js"></script>

		<!--Morris js-->
		<script src="assets/plugins/morris/morris.min.js"></script>
		<script src="assets/plugins/morris/raphael.min.js"></script>	

		<!--Scripts js-->
		<script src="assets/js/scripts.js"></script>

		<!--Dashboard js-->
		<script src="assets/js/dashboard.js"></script>
		<script src="assets/js/apexcharts.js"></script>
	</body>
</html>
