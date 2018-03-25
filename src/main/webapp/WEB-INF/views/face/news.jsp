<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta name="Generator" content="EditPlus®">
<meta name="Author" content="">
<meta name="Keywords" content="">
<meta name="Description" content="">
<title>Document</title>

<link href="${pageContext.request.contextPath}/css/bootstraps.min.css"
	rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/studetail-style.css"
	media="screen" type="text/css" />


<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.js"
	type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/js/jquery.slimscroll.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/searchform.js"></script>
<style type="text/css">
body {
	margin-top: 63px;
}

.top {
	border: none;
	border-radius: 0px;
	margin-bottom: -1px;
}

.container {
	min-width: 1170px !important;
}

.top .navbar-nav>li {
	padding: 3px 0px;
}

.top .navbar-nav>li>a {
	font-size: 14px;
	color: #cdcccc;
}

.top  .navbar-nav>li>a:hover {
	color: #31a030;
}

.list-group-item {
	width: 170px;
	border: none;
	background: #fff0;
	color: #000;
}

.list-group-item a font {
	color: #a2a2a2;
}

.list-group-item a {
	color: #000;
	text-decoration: none;
}

.list-group-item a span {
	float: right;
	color: #a2a2a2;
	display: inline-block;
}

.list-group-item>span {
	color: #d5ded5;
	width: 70px;
	display: inline-block;
}

.list-group-item>span>font {
	color: #000;
}

.list-group {
	margin: 0px;
}

.list-group-item:first-child {
	border-radius: 0px;
}

.list-group-item:last-child {
	border-radius: 0px;
}

.type>li {
	float: right;
}

.type li a {
	border-radius: 0px;
	padding: 15px 30px;
	color: #e67e22;
}

.type li a:hover {
	background: #000;
	color: #fff;
}

.content {
	width: 948px;
	height: 845px;
	position: relative;
	left: 254px;
	bottom: 262px;
	box-shadow: 6px 2px 20px #bbb;
}

.new>tr {
	max-height: 90px;
}

.new>tr>td {
	padding: 15px 20px !important;
}

.t-read {
	font-weight: normal;
}

.t-unread {
	font-weight: bold;
}

.p1 {
	overflow: hidden;
	text-overflow: ellipsis;
	display: -webkit-box;
	-webkit-line-clamp: 3;
	-webkit-box-orient: vertical;
	max-height: 55px;;
	width: 570px;
	color: #444;
}

.date {
	font-size: 12px;
	color: #989898;
}

.remove {
	float: right;
	position: relative;
	top: 4px;
	right: 0px;
}

.welcome{
	overflow: hidden;
	text-overflow: ellipsis;
	display: -webkit-box;
	-webkit-line-clamp: 1;
	-webkit-box-orient: vertical;
	height: 15px;
    width: 85px;
}
</style>
</head>
<body>
	<nav class="navbar navbar-default navbar-fixed-top top"
		style="background: #2f3440">
	<div class="container">
		<div class="row">
			<div class="col-md-2" style="padding: 0px">
				<div style="padding: 1px 0px">
					<a href="${pageContext.request.contextPath }/"><img src="${pageContext.request.contextPath}/image/face/logo2.png"
						style="width: 185px">
					</a>
				</div>
			</div>
			<div class="col-md-4 col-md-offset-2" style="padding: 0px">
				<form id="searchform" class="navbar-form navbar-left" action="${pageContext.request.contextPath }/courseList" method="post">
					<div class="input-group">
						<input type="text" class="form-control" placeholder="请输入要查找的课程"
							style="width: 280px; height: 44px; border-radius: 0px" id="param" name="param"> <span
							class="input-group-btn">
							<button id="search" type="button" class="btn btn-success btn-search"
								style="width: 70px; height: 44px; border-radius: 0px; padding: 0px;">
								<span class="glyphicon glyphicon-search" style="font-size: 28px"></span>
							</button>
						</span>
					</div>
				</form>
			</div>
			<div class="col-md-4" style="padding: 0px">
				<ul class="nav navbar-nav"
					style="margin: 3px; height: 57px; float: right">
					<li><a href="#">我的学习</a></li>
					<li><a href="#">购物车</a></li>
					<li><a href="#">帮助</a></li>
					<li>
						<shiro:guest>
							<a href="javascript:void(0);" onclick="login()">登录/注册</a>
						</shiro:guest>
						
						<shiro:hasRole name="student">
							<a href="javascript:void(0);"><p class="welcome">Hello, <shiro:principal property="stunick"/></p></a>
						</shiro:hasRole>
					</li>
					<li style="margin: -9px"><a href="#"><img
							src="${pageContext.request.contextPath}/image/face/6.jpg" alt="..." class="img-circle"
							style='width: 38px;'></a></li>
				</ul>
			</div>
		</div>
	</div>
	</nav>

	<div style="width: 100%; height: 220px; background: #ddd">
		<div class="container" style="padding: 80px 0px; height: 1255px">
			<div class="row"
				style="background: url(${pageContext.request.contextPath}/image/face/bg2.png) center center no-repeat;box-shadow: 7px 8px 20px #bbb;;height:250px;padding:35px 30px;height: 205px;">
				<div class="text-center" style="float: left; padding:">
					<img src="${pageContext.request.contextPath}/image/face/6.jpg"
						alt="..." class="img-thumbnail"
						style="border-radius: 50%; width: 120px">
				</div>
				<div style="float: left; padding: 30px 30px; color: #fff">
					<h3>Hello，${student.studentDetail.snick }</h3>
				</div>
				<div style="float: right;">
					<ul class="list-group">
						<li class="list-group-item"
							style="font-size: 28px; border-bottom: 1px solid #ddd"><a
							href="#"><font style="font-size: 28px">${orderCount }</font>
								<span class="glyphicon glyphicon-shopping-cart"></span></a></li>
						<li class="list-group-item" style="border-bottom: 1px solid #ddd"><span><font>${notOrder }</font>
								待支付</span><span class="text-right"><font>${isOrder }</font> 已付款</span></li>
						<li class="list-group-item"><span
							class="glyphicon glyphicon-credit-card" style="color: #000">
								<font style="color: #ddd; font-size: 16px">${student.studentDetail.sbalance }</font>
						</span><span class="glyphicon glyphicon-book text-right"
							style="color: #000"> <font
								style="color: #ddd; font-size: 16px">${mycourseCount }</font></span></li>
					</ul>
				</div>
			</div>

			<div class="row" style="margin-top: 45px; height: 800px">

				<div style="width: 100%; height: 800px;">
					<div style="width: 250px;">
						<ul class="mcd-menu">
							<li><a href="${pageContext.request.contextPath}/myCourse"> <span
									class="glyphicon glyphicon-book"></span> <strong>课程表</strong> <small>学习课程</small>
							</a></li>
							<li><a href="${pageContext.request.contextPath}/Order"> <span
									class="glyphicon glyphicon-shopping-cart"></span> <strong>订单</strong>
									<small>所有订单</small>
							</a></li>
							<li><a href="${pageContext.request.contextPath}/News"  class="active"> <span
									class="glyphicon glyphicon-comment"></span> <strong>消息</strong>
									<small>所有消息</small>
							</a></li>

							<li><a href="${pageContext.request.contextPath}/studentDetail"> <span class="glyphicon glyphicon-user"></span>
									<strong>资料</strong> <small>个人资料</small>
							</a></li>
						</ul>
					</div>
					<div class="content"
						style="margin-left: -5px; border-left: 4px solid #e67e22; border-bottom: 4px solid #ffc898;">
						<table class="table table-striped">
							<thead style="">
								<tr>
									<td colspan="2"><div class="page-header text-right"
											style="border: none; padding: 0 20px 0 0">
											<h4 style="color: #07a7e3">消息列表</h4>
										</div></td>
									<td></td>
								</tr>
							</thead>
							<tbody class="new">
								<tr>
									<td class="t-unread"><p class="p1">s方式登记方式时代峻峰抗裂砂浆的客服陆金所的考虑房价SDK雷锋精神快乐的积分克鲁赛德史蒂夫史蒂夫的沙发斯蒂芬斯蒂芬斯蒂芬胜多负少的防守打法斯蒂芬斯蒂芬斯蒂芬胜多负少的范德萨发生的范德萨范德萨范德萨斯蒂芬斯蒂芬胜多负少的水电费胜多负少的是否大是大非胜多负少的水电费
											sdflksd</p></td>
									<td class="date">2017-02-02</td>
									<td><span class="glyphicon glyphicon-remove remove"
										style="float: right;"></span></td>
								</tr>
								<tr>
									<td class="t-unread"><p class="p1">s方式登记方式时代峻峰抗裂砂浆的客服陆金所的考虑房价SDK雷锋精神快乐的积分克鲁赛德史蒂夫史蒂夫的沙发斯蒂芬斯蒂芬斯蒂芬胜多负少的防守打法斯蒂芬斯蒂芬斯蒂芬胜多负少的范德萨发生的范德萨范德萨范德萨斯蒂芬斯蒂芬胜多负少的水电费胜多负少的是否大是大非胜多负少的水电费
											sdflksd</p></td>
									<td class="date">2017-02-02</td>
									<td><span class="glyphicon glyphicon-remove remove"
										style="float: right;"></span></td>
								</tr>
								<tr>
									<td class="t-unread"><p class="p1">s方式登记方式时代峻峰抗裂砂浆的客服陆金所的考虑房价SDK雷锋精神快乐的积分克鲁赛德
											sdflksd</p></td>
									<td class="date">2017-02-02</td>
									<td><span class="glyphicon glyphicon-remove remove"
										style="float: right;"></span></td>
								</tr>
								<tr>
									<td class="t-unread"><p class="p1">s方式登记方式时代峻峰抗裂砂浆的客服陆金所的考虑房价SDK雷锋精神快乐的积分克鲁赛德
											sdflksd</p></td>
									<td class="date">2017-02-02</td>
									<td><span class="glyphicon glyphicon-remove remove"
										style="float: right;"></span></td>
								</tr>
								<tr>
									<td class="t-unread"><p class="p1">s方式登记方式时代峻峰抗裂砂浆的客服陆金所的考虑房价SDK雷锋精神快乐的积分克鲁赛德
											sdflksd</p></td>
									<td class="date">2017-02-02</td>
									<td><span class="glyphicon glyphicon-remove remove"
										style="float: right;"></span></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<nav class="navbar navbar-default navbar-static-bottom"
			style="background: #474443;height:260px;">
		<div class="container" style="height: 90px;">
			<div class="media-bottom"
				style="background-color: #474443; color: #FFF">
				<div class="container">
					<br>
					<p>
						<img src="${pageContext.request.contextPath}/image/face/logo2.png">
					</p>
					<br>
					<p class="media-left">
						黑马课堂是自主开发的实用技能学习平台，由各界名师、领域知名人士支持<br>
						为您提供丰富的优质课堂讲解，以及师生互动的课堂环境，帮助您提高个人<br>的能力和技术的升华。<br> <br>
						@2017~2018黑马课堂版权所有
					</p>
					<div class="media-right" style="padding-left: 180px;"></div>
				</div>

			</div>
		</div>
	</div>
	</nav>
	</div>

	<script>
		
	</script>
</body>
</html>