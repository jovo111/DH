<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.js"
	type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/Chart.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.peity.min.js"></script>
<link href="${pageContext.request.contextPath}/css/bootstraps.min.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/animate.css" rel="stylesheet" type="text/css" />

<style type="text/css">
.dashboard {
	padding: 20px 30px;
}

.dashboard span {
	font-size: 60px;
	color: #ffffff;
}

.dashboard div {
	font-size: 39px;
	color: #ffffff;
}

.list div {
	font-size: 25px;
	color: #0FC5EB;
}

.progress {
	height: 8px;
}

.progress-bar {
	background: #a4c1da;
}

.dashboard-bottom {
	padding: 2px 20px;
	color: #ffffff85;
}

.number {
	float: right;
	text-align: right;
	letter-spacing: -1px;
	font-weight: 300;
}

.list-group-item {
	border: 0;
	line-height: 0;
}

.timeline-item .date {
	text-align: right;
	width: 110px;
	position: relative;
	padding-top: 30px;
}

.timeline-item .date {
	text-align: right;
	width: 110px;
	position: relative;
	padding-top: 30px;
}

.timeline-item .content {
	border-left: 1px solid #e7eaec;
	border-top: 1px solid #e7eaec;
	padding-top: 10px;
	min-height: 100px;
}

.timeline-item .content p:hover {
	background: #f8f8f8;
}

.timeline-item .date span {
	position: absolute;
	top: 0;
	right: 0;
	padding: 5px;
	width: 30px;
	text-align: center;
	border-top: 1px solid #e7eaec;
	border-bottom: 1px solid #e7eaec;
	border-left: 1px solid #e7eaec;
	background: #f8f8f8;
}

#p2 {
	overflow: hidden;
	text-overflow: ellipsis;
	display: -webkit-box;
	-webkit-line-clamp: 3;
	-webkit-box-orient: vertical;
}

.teacher h3, h5, abbr {
	margin-top: 3px;
	margin-bottom: 3px;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<h2>
					首页&nbsp;<small>首页</small>
				</h2>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<ol class="breadcrumb">
					<li><a href="#">Home</a></li>
				</ol>
			</div>
		</div>

		<div class="row">
			<div class="col-md-3 col-sm-6">
				<div class="dashboard" style="background: #27a9e3;">
					<div class="row">
						<div class="col-md-6">
							<span class="glyphicon glyphicon-user"></span>
						</div>
						<div class="col-md-6">
							<div class="count" style="float: right;">
								<div class="number" style="float: right;">1000</div>
								<div class="font"
									style="font-size: 10px; clear: right; text-align: right;">学生总数</div>
							</div>
						</div>
					</div>
				</div>
				<div class="dashboard-bottom" style="background: #208dbe;">
					<div class="row">
						<div class="col-md-6">
							<span>新增学生</span>
						</div>
						<div class="col-md-6">
							<span style="float: right">200</span>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-3 col-sm-6">
				<div class="dashboard" style="background: #28b779;">
					<div class="row">
						<div class="col-md-6">
							<span class="glyphicon glyphicon-education"></span>
						</div>
						<div class="col-md-6">
							<div class="count" style="float: right;">
								<div class="number" style="float: right;">1000</div>
								<div class="font"
									style="font-size: 10px; clear: right; text-align: right;">讲师总数</div>
							</div>
						</div>
					</div>
				</div>

				<div class="dashboard-bottom" style="background: #10a062;">
					<div class="row">
						<div class="col-md-6">
							<span>新增讲师</span>
						</div>
						<div class="col-md-6">
							<span style="float: right">200</span>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-3 col-sm-6">
				<div class="dashboard" style="background: #852b99;">
					<div class="row">
						<div class="col-md-6">
							<span class="glyphicon glyphicon-blackboard"></span>
						</div>
						<div class="col-md-6">
							<div class="count" style="float: right;">
								<div class="number" style="float: right;">1000</div>
								<div class="font"
									style="font-size: 10px; clear: right; text-align: right;">课堂总数</div>
							</div>
						</div>
					</div>
				</div>
				<div class="dashboard-bottom" style="background: #6e1881;">
					<div class="row">
						<div class="col-md-6">
							<span>新增课堂</span>
						</div>
						<div class="col-md-6">
							<span style="float: right">200</span>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-3 col-sm-6">
				<div class="dashboard" style="background: #ffb848;">
					<div class="row">
						<div class="col-md-6">
							<span class="glyphicon glyphicon-shopping-cart"></span>
						</div>
						<div class="col-md-6">
							<div class="count" style="float: right;">
								<div class="number" style="float: right;">1000</div>
								<div class="font"
									style="font-size: 10px; clear: right; text-align: right;">总订单数</div>
							</div>
						</div>
					</div>
				</div>
				<div class="dashboard-bottom" style="background: #cb871b;">
					<div class="row">
						<div class="col-md-6">
							<span>新增订单</span>
						</div>
						<div class="col-md-6">
							<span style="float: right">200</span>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="row" style="margin-top: 20px">
			<div class="col-md-12">
				<div class="panel panel-default"
					style="border-left: 2px solid #000000; border-radius: 0px;">
					<div class="panel-body" style="background: #fafafa;">
						<div class="row">
							<div class="col-md-3">
								<div class="title">
									<span class="glyphicon glyphicon-duplicate">&nbsp;订单统计表</span>
								</div>
								<div class="list" style="padding-top: 20px">
									<div class="count">
										<div class="number" style="float: left;">1000</div>
										<div class="font"
											style="font-size: 10px; clear: left; padding-left: 5px">
											<span style="float: left">总单数</span><span
												style="float: right">45%</span><span
												class="glyphicon glyphicon-arrow-up" style="color: red"></span>
										</div>
									</div>
									<div style="clear: left">
										<div class="progress">
											<div class="progress-bar" role="progressbar"
												aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
												style="width: 40%;">
												<span class="sr-only">60% Complete</span>
											</div>
										</div>
									</div>

									<div class="count">
										<div class="number" style="float: left;">1000</div>
										<div class="font"
											style="font-size: 10px; clear: left; padding-left: 5px">
											<span style="float: left">成交量</span><span
												style="float: right">60%</span><span
												class="glyphicon glyphicon-arrow-down" style="color: green"></span>
										</div>
									</div>
									<div style="clear: left">
										<div class="progress">
											<div class="progress-bar" role="progressbar"
												aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
												style="width: 30%;">
												<span class="sr-only">60% Complete</span>
											</div>
										</div>
									</div>

									<div class="count">
										<div class="number" style="float: left;">1000</div>
										<div class="font"
											style="font-size: 10px; clear: left; padding-left: 5px">
											<span style="float: left">未成交量</span><span
												style="float: right">45%</span><span
												class="glyphicon glyphicon-arrow-up" style="color: red"></span>
										</div>
									</div>
									<div style="clear: left">
										<div class="progress">
											<div class="progress-bar" role="progressbar"
												aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
												style="width: 90%;">
												<span class="sr-only">60% Complete</span>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-9">
								<div class="title">
									<span class="glyphicon glyphicon-stats">&nbsp;订单统计表</span>
								</div>
								<div class="chart">
									<canvas id="myChart" height="290px"
										style="display: block; width: 1373px; height: 290px;"
										width="1373"></canvas>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-md-9">
				<div class="panel panel-default">
					<div class="panel-heading"
						style="background: #68a3fb; color: #ffffff">
						<span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>&emsp;<strong>课堂观看统计表</strong>
					</div>
					<div class="panel-body" class="ibox-content sk-loading">
						<div>
							<button type="button" class="btn btn-default">Java</button>
						</div>
						<table class="table table-striped table-hover"
							style="color: #828282">
							<thead>
								<tr>
									<td>#</td>
									<td>课堂名称</td>
									<td>讲师名称</td>
									<td>教育机构</td>
									<td>联系电话</td>
									<td>章节数</td>
									<td>完成度</td>
									<td>在学人数</td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><span class="label label-danger">1</span></td>
									<td>Java从入门到精通（精讲）</td>
									<td>马士兵</td>
									<td>腾旭课堂</td>
									<td>1323123122</td>
									<td>34</td>
									<td><span class="pie">1/5</span></td>
									<td>23232</td>
								</tr>
								<tr>
									<td><span class="label label-warning">2</span></td>
									<td>Java从入门到精通（精讲）</td>
									<td>马士兵</td>
									<td>腾旭课堂</td>
									<td>1323123122</td>
									<td>34</td>
									<td><span class="pie">1/5</span></td>
									<td>23232</td>
								</tr>
								<tr>
									<td><span class="label label-primary">3</span></td>
									<td>Java从入门到精通（精讲）</td>
									<td>马士兵</td>
									<td>腾旭课堂</td>
									<td>1323123122</td>
									<td>34</td>
									<td><span class="pie">1/5</span></td>
									<td>23232</td>
								</tr>
								<tr>
									<td><span class="label label-info">4</span></td>
									<td>Java从入门到精通（精讲）</td>
									<td>马士兵</td>
									<td>腾旭课堂</td>
									<td>1323123122</td>
									<td>34</td>
									<td><span class="pie">1/5</span></td>
									<td>23232</td>
								</tr>
								<tr>
									<td><span class="label label-info">5</span></td>
									<td>Java从入门到精通（精讲）</td>
									<td>马士兵</td>
									<td>腾旭课堂</td>
									<td>1323123122</td>
									<td>34</td>
									<td><span class="pie">1/5</span></td>
									<td>23232</td>
								</tr>
								<tr>
									<td><span class="label label-info">6</span></td>
									<td>Java从入门到精通（精讲）</td>
									<td>马士兵</td>
									<td>腾旭课堂</td>
									<td>1323123122</td>
									<td>34</td>
									<td><span class="pie">1/5</span></td>
									<td>23232</td>
								</tr>
								<tr>
									<td><span class="label label-info">7</span></td>
									<td>Java从入门到精通（精讲）</td>
									<td>马士兵</td>
									<td>腾旭课堂</td>
									<td>1323123122</td>
									<td>34</td>
									<td><span class="pie">1/5</span></td>
									<td>23232</td>
								</tr>
								<tr>
									<td><span class="label label-info">8</span></td>
									<td>Java从入门到精通（精讲）</td>
									<td>马士兵</td>
									<td>腾旭课堂</td>
									<td>1323123122</td>
									<td>34</td>
									<td><span class="pie">1/5</span></td>
									<td>23232</td>
								</tr>
								<tr>
									<td><span class="label label-info">9</span></td>
									<td>Java从入门到精通（精讲）</td>
									<td>马士兵</td>
									<td>腾旭课堂</td>
									<td>1323123122</td>
									<td>34</td>
									<td><span class="pie">1/5</span></td>
									<td>23232</td>
								</tr>
								<tr>
									<td><span class="label label-info">10</span></td>
									<td>Java从入门到精通（精讲）</td>
									<td>马士兵</td>
									<td>腾旭课堂</td>
									<td>1323123122</td>
									<td>34</td>
									<td><span class="pie">1/5</span></td>
									<td>23232</td>
								</tr>
								<tr>
									<td><span class="label label-info">11</span></td>
									<td>Java从入门到精通（精讲）</td>
									<td>马士兵</td>
									<td>腾旭课堂</td>
									<td>1323123122</td>
									<td>34</td>
									<td><span class="pie">1/5</span></td>
									<td>23232</td>
								</tr>
								<tr>
									<td><span class="label label-info">12</span></td>
									<td>Java从入门到精通（精讲）</td>
									<td>马士兵</td>
									<td>腾旭课堂</td>
									<td>1323123122</td>
									<td>34</td>
									<td><span class="pie">1/5</span></td>
									<td>23232</td>
								</tr>
								<tr>
									<td><span class="label label-info">13</span></td>
									<td>Java从入门到精通（精讲）</td>
									<td>马士兵</td>
									<td>腾旭课堂</td>
									<td>1323123122</td>
									<td>34</td>
									<td><span class="pie">1/5</span></td>
									<td>23232</td>
								</tr>
								<tr>
									<td><span class="label label-info">14</span></td>
									<td>Java从入门到精通（精讲）</td>
									<td>马士兵</td>
									<td>腾旭课堂</td>
									<td>1323123122</td>
									<td>34</td>
									<td><span class="pie">1/5</span></td>
									<td>23232</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>

				<div class="panel panel-default" style="border: none">
					<div class="panel-heading"
						style="background: #ffffff; color: #828282; border: none">
						<span class="glyphicon glyphicon-education"></span> 优秀讲师表
					</div>
					<div class="panel-body">
						<div class="row" style="color: #828282;">
							<div class="col-md-3 teacher">
								<div class="row">
									<div class="col-md-4">
										<img src="${pageContext.request.contextPath}/image/1.jpg" style="width: 100px"
											class="img-rounded" />
									</div>
									<div class="col-md-5">
										<h3>JOVO</h3>
										<h5>
											<span class="glyphicon glyphicon-education"></span> 腾旭课堂
										</h5>
										<h5>
											<span class="glyphicon glyphicon-user"></span> 23232
										</h5>
										<h5>
											<span class="glyphicon glyphicon-blackboard"></span> 23232
										</h5>
										<abbr title=""><span
											class="glyphicon glyphicon-phone-alt"></span> 17874823433</abbr>
									</div>
								</div>
							</div>
							<div class="col-md-3 teacher">
								<div class="row">
									<div class="col-md-4">
										<img src="${pageContext.request.contextPath}/image/1.jpg" style="width: 100px"
											class="img-rounded" />
									</div>
									<div class="col-md-5">
										<h3>JOVO</h3>
										<h5>
											<span class="glyphicon glyphicon-education"></span> 腾旭课堂
										</h5>
										<h5>
											<span class="glyphicon glyphicon-user"></span> 23232
										</h5>
										<h5>
											<span class="glyphicon glyphicon-blackboard"></span> 23232
										</h5>
										<abbr title=""><span
											class="glyphicon glyphicon-phone-alt"></span> 17874823433</abbr>
									</div>
								</div>
							</div>
							<div class="col-md-3 teacher">
								<div class="row">
									<div class="col-md-4">
										<img src="${pageContext.request.contextPath}/image/1.jpg" style="width: 100px"
											class="img-rounded" />
									</div>
									<div class="col-md-5">
										<h3>JOVO</h3>
										<h5>
											<span class="glyphicon glyphicon-education"></span> 腾旭课堂
										</h5>
										<h5>
											<span class="glyphicon glyphicon-user"></span> 23232
										</h5>
										<h5>
											<span class="glyphicon glyphicon-blackboard"></span> 23232
										</h5>
										<abbr title=""><span
											class="glyphicon glyphicon-phone-alt"></span> 17874823433</abbr>
									</div>
								</div>
							</div>
							<div class="col-md-3 teacher">
								<div class="row">
									<div class="col-md-4">
										<img src="${pageContext.request.contextPath}/image/1.jpg" style="width: 100px"
											class="img-rounded" />
									</div>
									<div class="col-md-5">
										<h3>JOVO</h3>
										<h5>
											<span class="glyphicon glyphicon-education"></span> 腾旭课堂
										</h5>
										<h5>
											<span class="glyphicon glyphicon-user"></span> 23232
										</h5>
										<h5>
											<span class="glyphicon glyphicon-blackboard"></span> 23232
										</h5>
										<abbr title=""><span
											class="glyphicon glyphicon-phone-alt"></span> 17874823433</abbr>
									</div>
								</div>
							</div>
						</div>

						<div class="row" style="color: #828282;">
							<div class="col-md-3 teacher">
								<div class="row">
									<div class="col-md-4">
										<img src="${pageContext.request.contextPath}/image/1.jpg" style="width: 100px"
											class="img-rounded" />
									</div>
									<div class="col-md-5">
										<h3>JOVO</h3>
										<h5>
											<span class="glyphicon glyphicon-education"></span> 腾旭课堂
										</h5>
										<h5>
											<span class="glyphicon glyphicon-user"></span> 23232
										</h5>
										<h5>
											<span class="glyphicon glyphicon-blackboard"></span> 23232
										</h5>
										<abbr title=""><span
											class="glyphicon glyphicon-phone-alt"></span> 17874823433</abbr>
									</div>
								</div>
							</div>
							<div class="col-md-3 teacher">
								<div class="row">
									<div class="col-md-4">
										<img src="${pageContext.request.contextPath}/image/1.jpg" style="width: 100px"
											class="img-rounded" />
									</div>
									<div class="col-md-5">
										<h3>JOVO</h3>
										<h5>
											<span class="glyphicon glyphicon-education"></span> 腾旭课堂
										</h5>
										<h5>
											<span class="glyphicon glyphicon-user"></span> 23232
										</h5>
										<h5>
											<span class="glyphicon glyphicon-blackboard"></span> 23232
										</h5>
										<abbr title=""><span
											class="glyphicon glyphicon-phone-alt"></span> 17874823433</abbr>
									</div>
								</div>
							</div>
							<div class="col-md-3 teacher">
								<div class="row">
									<div class="col-md-4">
										<img src="${pageContext.request.contextPath}/image/1.jpg" style="width: 100px"
											class="img-rounded" />
									</div>
									<div class="col-md-5">
										<h3>JOVO</h3>
										<h5>
											<span class="glyphicon glyphicon-education"></span> 腾旭课堂
										</h5>
										<h5>
											<span class="glyphicon glyphicon-user"></span> 23232
										</h5>
										<h5>
											<span class="glyphicon glyphicon-blackboard"></span> 23232
										</h5>
										<abbr title=""><span
											class="glyphicon glyphicon-phone-alt"></span> 17874823433</abbr>
									</div>
								</div>
							</div>
							<div class="col-md-3 teacher">
								<div class="row">
									<div class="col-md-4">
										<img src="${pageContext.request.contextPath}/image/1.jpg" style="width: 100px"
											class="img-rounded" />
									</div>
									<div class="col-md-5">
										<h3>JOVO</h3>
										<h5>
											<span class="glyphicon glyphicon-education"></span> 腾旭课堂
										</h5>
										<h5>
											<span class="glyphicon glyphicon-user"></span> 23232
										</h5>
										<h5>
											<span class="glyphicon glyphicon-blackboard"></span> 23232
										</h5>
										<abbr title=""><span
											class="glyphicon glyphicon-phone-alt"></span> 17874823433</abbr>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-3" style="color: #828282">
				<div class="panel panel-default" style="border-radius: 0px;">
					<div class="panel-heading"
						style="background: #ff9595; color: #ffffff">
						<span class="glyphicon glyphicon-calendar">&nbsp;<strong>课堂类型访问统计表</strong></span>
					</div>
					<div class="panel-body">
						<div class="row" style="padding-top: 20px">
							<div class="col-md-7">
								<canvas id="myChart1" width="250" height="200"
									sytle="margin: 18px auto 0px;width: 200px; height: 200px;"></canvas>
							</div>
							<div class="col-md-5">
								<ul class="list-group">
									<li class="list-group-item"><span
										class="label label-danger">333</span><span>&emsp;Python</span></li>
									<li class="list-group-item"><span
										class="label label-warning">333</span><span>&emsp;Java</span></li>
									<li class="list-group-item"><span
										class="label label-primary">333</span><span>&emsp;PHP</span></li>
									<li class="list-group-item"><span class="label label-info">333</span><span>&emsp;C++</span></li>
									<li class="list-group-item"><span class="label label-info">333</span><span>&emsp;C#</span></li>
									<li class="list-group-item"><span class="label label-info">333</span><span>&emsp;C#</span></li>
								</ul>
							</div>
						</div>

					</div>
				</div>

				<div class="panel panel-default"
					style="border-radius: 0px; border-left: 0; border-right: 0;">
					<div class="panel-heading"
						style="background: #ffffff; color: #828282">
						<strong>公告时间表</strong>
					</div>
					<div class="panel-body">
						<div class="timeline-item">
							<div class="row">
								<div class="col-xs-4 date">
									<span class="glyphicon glyphicon-comment"
										style="color: #8AD7C6"></span> <font
										style="vertical-align: inherit;"> <font
										style="vertical-align: inherit;">2017/1/12</font>
									</font><br> <small class="text-navy"> <font
										style="vertical-align: inherit;"> <font
											style="vertical-align: inherit;">进行中</font>
									</font>
									</small>
								</div>
								<div class="col-xs-8 content no-top-border"
									style="border-top: none">
									<p class="m-b-xs">
										<strong> <font style="vertical-align: inherit;">
												<font style="vertical-align: inherit;"><span
													class="glyphicon glyphicon-pushpin"></span> 发送文件给迈克</font>
										</font>
										</strong>
									</p>
									<p id="p2">dsads dasd d vdd asdsadadafa adsad afa asfdsa
										safa ddddddd dasd dasda dasd adasaddddasdsad ddddddddddd
										sasafa efv dsads dasd d vdd asdsadadafa adsad afa asfdsa safa
										ddddddd dasd dasda dasd adasaddddasdsad ddddddddddd sasafa efv
										esafew efe dsads dasd d vdd asdsadadafa adsad afa asfdsa safa
										ddddddd dasd dasda dasd adasaddddasdsad ddddddddddd sasafa efv
										esafew efe dsads dasd d vdd asdsadadafa adsad afa asfdsa safa
										ddddddd dasd dasda dasd adasaddddasdsad ddddddddddd sasafa efv
										esafew efe dsads dasd d vdd asdsadadafa adsad afa asfdsa safa
										ddddddd dasd dasda dasd adasaddddasdsad ddddddddddd sasafa efv
										esafew efe dsads dasd d vdd asdsadadafa adsad afa asfdsa safa
										ddddddd dasd dasda dasd adasaddddasdsad ddddddddddd sasafa efv
										esafew efe dsads dasd d vdd asdsadadafa adsad afa asfdsa safa
										ddddddd dasd dasda dasd adasaddddasdsad ddddddddddd sasafa efv
										esafew efe dsads dasd d vdd asdsadadafa adsad afa asfdsa safa
										ddddddd dasd dasda dasd adasaddddasdsad ddddddddddd sasafa efv
										esafew efeds asdsadadafa adsad afa asfdsa safa ddddddd dasd
										dasda dasd adasaddddasdsad ddddddddddd sasafa efv esafew efe</p>
								</div>
							</div>
							<div class="row">
								<div class="col-xs-4 date">
									<span class="glyphicon glyphicon-comment"
										style="color: #8AD7C6"></span> <font
										style="vertical-align: inherit;"> <font
										style="vertical-align: inherit;">2017/1/12</font>
									</font><br> <small class="text-navy"> <font
										style="vertical-align: inherit;"> <font
											style="vertical-align: inherit;">进行中</font>
									</font>
									</small>
								</div>
								<div class="col-xs-8 content">
									<p class="m-b-xs">
										<strong> <font style="vertical-align: inherit;">
												<font style="vertical-align: inherit;"><span
													class="glyphicon glyphicon-pushpin"></span> 发送文件给迈克</font>
										</font>
										</strong>
									</p>
									<p id="p2">dsads dasd d vdd asdsadadafa adsad afa asfdsa
										safa ddddddd dasd dasda dasd adasaddddasdsad ddddddddddd
										sasafa efv dsads dasd d vdd asdsadadafa adsad afa asfdsa safa
										ddddddd dasd dasda dasd adasaddddasdsad ddddddddddd sasafa efv
										esafew efe dsads dasd d vdd asdsadadafa adsad afa asfdsa safa
										ddddddd dasd dasda dasd adasaddddasdsad ddddddddddd sasafa efv
										esafew efe dsads dasd d vdd asdsadadafa adsad afa asfdsa safa
										ddddddd dasd dasda dasd adasaddddasdsad ddddddddddd sasafa efv
										esafew efe dsads dasd d vdd asdsadadafa adsad afa asfdsa safa
										ddddddd dasd dasda dasd adasaddddasdsad ddddddddddd sasafa efv
										esafew efe dsads dasd d vdd asdsadadafa adsad afa asfdsa safa
										ddddddd dasd dasda dasd adasaddddasdsad ddddddddddd sasafa efv
										esafew efe dsads dasd d vdd asdsadadafa adsad afa asfdsa safa
										ddddddd dasd dasda dasd adasaddddasdsad ddddddddddd sasafa efv
										esafew efe dsads dasd d vdd asdsadadafa adsad afa asfdsa safa
										ddddddd dasd dasda dasd adasaddddasdsad ddddddddddd sasafa efv
										esafew efeds asdsadadafa adsad afa asfdsa safa ddddddd dasd
										dasda dasd adasaddddasdsad ddddddddddd sasafa efv esafew efe</p>
								</div>
							</div>
							<div class="row">
								<div class="col-xs-4 date">
									<span class="glyphicon glyphicon-comment"></span> <font
										style="vertical-align: inherit;"> <font
										style="vertical-align: inherit;">2017/1/12</font>
									</font><br> <small class="text-navy"> <font
										style="vertical-align: inherit;"> <font
											style="vertical-align: inherit;">已失效</font>
									</font>
									</small>
								</div>
								<div class="col-xs-8 content">
									<p class="m-b-xs">
										<strong> <font style="vertical-align: inherit;">
												<font style="vertical-align: inherit;"><span
													class="glyphicon glyphicon-pushpin"></span> 发送文件给迈克</font>
										</font>
										</strong>
									</p>
									<p id="p2">dsads dasd d vdd asdsadadafa adsad afa asfdsa
										safa ddddddd dasd dasda dasd adasaddddasdsad ddddddddddd
										sasafa efv dsads dasd d vdd asdsadadafa adsad afa asfdsa safa
										ddddddd dasd dasda dasd adasaddddasdsad ddddddddddd sasafa efv
										esafew efe dsads dasd d vdd asdsadadafa adsad afa asfdsa safa
										ddddddd dasd dasda dasd adasaddddasdsad ddddddddddd sasafa efv
										esafew efe dsads dasd d vdd asdsadadafa adsad afa asfdsa safa
										ddddddd dasd dasda dasd adasaddddasdsad ddddddddddd sasafa efv
										esafew efe dsads dasd d vdd asdsadadafa adsad afa asfdsa safa
										ddddddd dasd dasda dasd adasaddddasdsad ddddddddddd sasafa efv
										esafew efe dsads dasd d vdd asdsadadafa adsad afa asfdsa safa
										ddddddd dasd dasda dasd adasaddddasdsad ddddddddddd sasafa efv
										esafew efe dsads dasd d vdd asdsadadafa adsad afa asfdsa safa
										ddddddd dasd dasda dasd adasaddddasdsad ddddddddddd sasafa efv
										esafew efe dsads dasd d vdd asdsadadafa adsad afa asfdsa safa
										ddddddd dasd dasda dasd adasaddddasdsad ddddddddddd sasafa efv
										esafew efeds asdsadadafa adsad afa asfdsa safa ddddddd dasd
										dasda dasd adasaddddasdsad ddddddddddd sasafa efv esafew efe</p>
								</div>
							</div>
							<div class="row">
								<div class="col-xs-4 date">
									<span class="glyphicon glyphicon-comment"
										style="color: #27a9e3"></span> <font
										style="vertical-align: inherit;"> <font
										style="vertical-align: inherit;">2017/1/12</font>
									</font><br> <small class="text-navy"> <font
										style="vertical-align: inherit;"> <font
											style="vertical-align: inherit;">未开始</font>
									</font>
									</small>
								</div>
								<div class="col-xs-8 content">
									<p class="m-b-xs">
										<strong> <font style="vertical-align: inherit;">
												<font style="vertical-align: inherit;"><span
													class="glyphicon glyphicon-pushpin"></span> 发送文件给迈克</font>
										</font>
										</strong>
									</p>
									<p id="p2">dsads dasd d vdd asdsadadafa adsad afa asfdsa
										safa ddddddd dasd dasda dasd adasaddddasdsad ddddddddddd
										sasafa efv dsads dasd d vdd asdsadadafa adsad afa asfdsa safa
										ddddddd dasd dasda dasd adasaddddasdsad ddddddddddd sasafa efv
										esafew efe dsads dasd d vdd asdsadadafa adsad afa asfdsa safa
										ddddddd dasd dasda dasd adasaddddasdsad ddddddddddd sasafa efv
										esafew efe dsads dasd d vdd asdsadadafa adsad afa asfdsa safa
										ddddddd dasd dasda dasd adasaddddasdsad ddddddddddd sasafa efv
										esafew efe dsads dasd d vdd asdsadadafa adsad afa asfdsa safa
										ddddddd dasd dasda dasd adasaddddasdsad ddddddddddd sasafa efv
										esafew efe dsads dasd d vdd asdsadadafa adsad afa asfdsa safa
										ddddddd dasd dasda dasd adasaddddasdsad ddddddddddd sasafa efv
										esafew efe dsads dasd d vdd asdsadadafa adsad afa asfdsa safa
										ddddddd dasd dasda dasd adasaddddasdsad ddddddddddd sasafa efv
										esafew efe dsads dasd d vdd asdsadadafa adsad afa asfdsa safa
										ddddddd dasd dasda dasd adasaddddasdsad ddddddddddd sasafa efv
										esafew efeds asdsadadafa adsad afa asfdsa safa ddddddd dasd
										dasda dasd adasaddddasdsad ddddddddddd sasafa efv esafew efe</p>
								</div>
							</div>
							<div class="row">
								<div class="col-xs-4 date">
									<span class="glyphicon glyphicon-comment"
										style="color: #27a9e3"></span> <font
										style="vertical-align: inherit;"> <font
										style="vertical-align: inherit;">2017/1/12</font>
									</font><br> <small class="text-navy"> <font
										style="vertical-align: inherit;"> <font
											style="vertical-align: inherit;">未开始</font>
									</font>
									</small>
								</div>
								<div class="col-xs-8 content">
									<p class="m-b-xs">
										<strong> <font style="vertical-align: inherit;">
												<font style="vertical-align: inherit;"><span
													class="glyphicon glyphicon-pushpin"></span> 发送文件给迈克</font>
										</font>
										</strong>
									</p>
									<p id="p2">dsads dasd d vdd asdsadadafa adsad afa asfdsa
										safa ddddddd dasd dasda dasd adasaddddasdsad ddddddddddd
										sasafa efv dsads dasd d vdd asdsadadafa adsad afa asfdsa safa
										ddddddd dasd dasda dasd adasaddddasdsad ddddddddddd sasafa efv
										esafew efe dsads dasd d vdd asdsadadafa adsad afa asfdsa safa
										ddddddd dasd dasda dasd adasaddddasdsad ddddddddddd sasafa efv
										esafew efe dsads dasd d vdd asdsadadafa adsad afa asfdsa safa
										ddddddd dasd dasda dasd adasaddddasdsad ddddddddddd sasafa efv
										esafew efe dsads dasd d vdd asdsadadafa adsad afa asfdsa safa
										ddddddd dasd dasda dasd adasaddddasdsad ddddddddddd sasafa efv
										esafew efe dsads dasd d vdd asdsadadafa adsad afa asfdsa safa
										ddddddd dasd dasda dasd adasaddddasdsad ddddddddddd sasafa efv
										esafew efe dsads dasd d vdd asdsadadafa adsad afa asfdsa safa
										ddddddd dasd dasda dasd adasaddddasdsad ddddddddddd sasafa efv
										esafew efe dsads dasd d vdd asdsadadafa adsad afa asfdsa safa
										ddddddd dasd dasda dasd adasaddddasdsad ddddddddddd sasafa efv
										esafew efeds asdsadadafa adsad afa asfdsa safa ddddddd dasd
										dasda dasd adasaddddasdsad ddddddddddd sasafa efv esafew efe</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$("span.pie").peity("pie")

						var lineData = {
							labels : [ "一月", "二月", "三月", "四月", "五月", "六月",
									"七月", "八月", "九月", "十月", "十一月", "十二月" ],
							datasets : [
									{
										label : "成交量",
										backgroundColor : "rgba(26,179,148,0.5)",
										borderColor : "rgba(26,179,148,0.7)",
										pointBackgroundColor : "rgba(26,179,148,1)",
										pointBorderColor : "#fff",
										data : [ 28, 48, 40, 19, 86, 0, 90,
												120, 300, 400, 500, 600 ]
									},
									{
										label : "未成交量",
										backgroundColor : "rgba(220,220,220,0.5)",
										borderColor : "rgba(220,220,220,1)",
										pointBackgroundColor : "rgba(220,220,220,1)",
										pointBorderColor : "#fff",
										data : [ 65, 59, 80, 81, 56, 55, 40 ]
									} ]
						};

						var doughnutData = {
							labels : [ "Java", "C#", "C++", "PHP", "Python",
									"C" ],
							datasets : [ {
								data : [ 300, 50, 100, 200, 250, 160 ],
								backgroundColor : [ "#a3e1d4", "#dedede",
										"#9CC3DA", "#27a9e3", "#28b779",
										"#9CC3DA" ]
							} ]
						};

						var lineOptions = {
							responsive : true
						};

						var doughnutOptions = {
							responsive : false,
							legend : {
								display : false
							}
						};

						var ctx = document.getElementById("myChart")
								.getContext("2d");
						new Chart(ctx, {
							type : 'line',
							data : lineData,
							options : lineOptions
						});

						var ctx1 = document.getElementById("myChart1")
								.getContext("2d");
						new Chart(ctx1, {
							type : 'doughnut',
							data : doughnutData,
							options : doughnutOptions
						});
						$('#toggleSpinners').on('click', function() {

						});
					});
</script>
</html>