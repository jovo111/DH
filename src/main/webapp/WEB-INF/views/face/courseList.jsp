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

<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.js"
	type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/js/jquery.slimscroll.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/searchform.js"></script>
<script>
	
</script>

<style type="text/css">
body {
	margin-top: 65px;
}

.navbar {
	border: none;
	border-radius: 0px;
	margin-bottom: -1px;
}

.container {
	min-width: 1170px !important;
}

.navbar .navbar-nav>li {
	padding: 3px 0px;
}

.navbar .navbar-nav>li>a {
	font-size: 14px;
	color: #cdcccc;
}

.navbar  .navbar-nav>li>a:hover {
	color: #31a030;
}

.carousel-inner>.item>img {
	width: 100%;
	height: 408px;
}

.carousel-control {
	position: absolute;
	top: 150px;
}

.carousel-indicators li {
	width: 8px;
	height: 10px;
	border-radius: 0px;
	background: #ffffff4f
}

.carousel-indicators .active {
	width: 8px;
	height: 23px;
	margin: 0;
	background-color: #fff;
}

.rank {
	margin: 0px 15px;
	display: inline-block;
	width: 100px;
	height: 40px;
	text-align: center;
	background: #575757;
	color: #fff;
	line-height: 30px;
	border-bottom: 4px solid #10ae58;
	padding: 8px 0px;
}

.list-group-item {
	background: #0000006b;
	color: #fffefebf;
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

.text {
	padding-left: 30px;
}

.label {
	margin-left: 12px
}

.list-group-item:hover {
	color: #1dc96b;
}

.course {
	width: 212px;
	height: 258px;
	float: left;
	margin-right: 20px;
	margin-bottom: 20px; 
	background : #fff;
	border: 3px solid #fff;
	background: #fff;
}

.course div {
	border: #fff solid 1px;
	overflow: hidden;
}

.course div img {
	width: 212px;
	height: 142px;
	cursor: pointer;
	transition: all 0.5s;
}

.course img:hover {
	transform: scale(1.2);
}

.course a {
	color: #565656;
	text-decoration: none;
}

.course a span font {
	font-size: 17px;
}

.course a span {
	display: inline-block;
	width: 100px;
	height: 26px;
	color: #5bc0de;
	padding: 2px 14px;
	border-top: 1px solid #ddd;
}

.pagination li a {
	margin-left: 5px
}

.pagination li a:hover, .pagination>li>span:hover, .pagination>li>a:focus,
	.pagination>li>span:focus {
	color: #fff;
	background-color: #5cb85c;
	border-color: #ddd;
}

.welcome {
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
	<nav class="navbar navbar-default navbar-fixed-top"
		style="background: #2f3440">
	<div class="container">
		<div class="row">
			<div class="col-md-2" style="padding: 0px">
				<div style="padding: 1px 0px">
					<a href="${pageContext.request.contextPath }/"><img src="${pageContext.request.contextPath}/image/face/logo2.png"
						style="width: 185px"></a>
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
					<li><shiro:guest>
							<a href="javascript:void(0);" onclick="login()">登录/注册</a>
						</shiro:guest> <shiro:hasRole name="student">
							<a href="javascript:void(0);"><p class="welcome">
									Hello,
									<shiro:principal property="stunick" />
								</p></a>
						</shiro:hasRole></li>
					<li style="margin: -9px"><a href="#"><img
							src="${pageContext.request.contextPath}/image/face/6.jpg"
							alt="..." class="img-circle" style='width: 38px;'></a></li>
				</ul>
			</div>
		</div>
	</div>
	<!-- /.container-fluid --> </nav>
	<div>
		<div class="container" style="padding: 0px">
			<ol class="breadcrumb"
				style="background: #fff; margin: 10px 0px; font-size: 15px">
				<li><a href="${pageContext.request.contextPath }/"><span class="glyphicon glyphicon-home"></span>
						首页</a></li>
				<li class="active">
					<c:if test="${param.param== 'free'}">
						免费课程
					</c:if>
					<c:if test="${param.param == 'pay' }">
						付费课程
					</c:if>
				</li>
			</ol>
		</div>
	</div>
	<div style="background: #f4f4f4">
		<div class="container" style="background: #f2f2f2; padding-top: 20px;">
			<h5 style="color: #525252">
				共有 <font style="font-size: 25px; color: #f45c5d">${course.size() }</font>
				门课堂
			</h5>
			<div class="row" style="padding: 20px 14px;">
				<nav class="navbar navbar-default" style="background: #ffffff">
				<div class="container-fluid">
					<div class="collapse navbar-collapse"
						id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav navbar-left">
							<li><a href="#">全部</a></li>
						</ul>

						<ul class="nav navbar-nav navbar-right">
							<li><a href="#"><span class="glyphicon glyphicon-user"></span>观看人数
									<span class="glyphicon glyphicon-triangle-bottom"></span></a></li>
							<li style="border-left: 1px solid #ddd"><a href="#">免费</a></li>
							<li><a href="#">付费 <span
									class="glyphicon glyphicon-triangle-bottom"></span></a></li>
						</ul>
					</div>
					<!-- /.navbar-collapse -->
				</div>
				<!-- /.container-fluid --> </nav>
			</div>
			<div class="row" style="padding: 20px 14px; margin-right: -33px;">
				<c:forEach items="${ course}" var="c">
					<div class="course">
						<div>
							<a href="#"><img
								src="${pageContext.request.contextPath}/image/face/6.jpg"></a>
						</div>
						<div style="height: 80px; padding: 0px 6px">
							<a href="#" style="font-size: 14px">${c.cname }</a><br> <a
								style="color: #999" href="#"><h6>${c.teacherDetail.tname }</h6></a>
						</div>
						<a href="#"><span class="glyphicon glyphicon-yen"
							style="border-right: 1px solid #ddd; color: #e88282"><font
								class="cprice">${c.cprice }</font></span><span
							class="glyphicon glyphicon-user"><font class="cprice">${c.stucount }</font></span>
						</a>
					</div>
				</c:forEach>


				<nav aria-label="Page navigation" style="float:right">
				<ul class="pagination">
					<li class="active"><a href="#" aria-label="Previous"> <span
							aria-hidden="true">上一页</span>
					</a></li>
					<li><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
					<li><a href="#" aria-label="Next"> <span
							aria-hidden="true">下一页</span>
					</a></li>
				</ul>
				</nav>
			</div>
		</div>
		<nav class="navbar navbar-default navbar-static-bottom"
			style="background: #474443;height:250px">
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
</body>
</html>