<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
<script src="${pageContext.request.contextPath}/js/sly.min.js"
	type="text/javascript"></script>
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

.content {
	width: 948px;
	height: 1087px;
	background: #fff;
	position: relative;
	left: 254px;
	bottom: 262px;
	box-shadow: 6px 2px 20px #bbb;
}

.degree li {
	border-right: 1px solid #ddd;
	height: 125px;
	padding: 20px 0px;
	color: #6c6c6c;
}

.degree li strong {
	font-size: 32px
}

.plus {
	float: right;
	display: inline-block;
	font-size: 18px;
	padding: 12px 10px;
	transition: All 0.5s ease-in-out;
	-webkit-transition: All 0.5s ease-in-out;
	-moz-transition: All 0.5s ease-in-out;
	-o-transition: All 0.5s ease-in-out;
}

.plus:hover {
	transform: rotate(135deg);
	-webkit-transform: rotate(135deg);
	-moz-transform: rotate(135deg);
	-o-transform: rotate(135deg);
	-ms-transform: rotate(135deg);
}

.progress {
	height: 6px;
}

.task .list-group-item {
	width: 100%;
	background: #fff;
	color: #000;
}

.task .list-group-item div {
	margin-right: 20px;
	border-radius: 50%;
	width: 35px;
	background: #fff;
	height: 35px;
	border: 3px solid #5bc0de;
	font-size: 20px;
	color: #5bc0de;
	line-height: 30px;
	display: inline-block;
}

.task .list-group-item a font {
	font-size: 16px;
	color: #000;
}

.task .list-group-item a {
	color: #000;
	text-decoration: none;
}

.task .list-group-item:hover {
	background: #f0fcff;
}

.task .list-group-item a .video {
	float: right;
	color: #64b6d6;
	font-size: 25px;
	margin: 10px 10px;
}

.task .list-group-item a .shadow {
	position: relative;
	z-index: 1000;
	float: right;
	top: 14px;
	left: 36px;
	height: 18px;
	background: #ffffffa6;
	display: inline-block;
}

.course {
	list-style: none;
	float: left;
	margin-right: 6px;
	width: 310px;
	height: 175px;
	padding: 0px 36px;
	color: #6c6c6c;
	background: #ddd;
}

.course h3 {
	height: 60px;
}

.courselist .active {
	background: #2acfff;
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
							src="${pageContext.request.contextPath}/image/face/6.jpg"
							alt="..." class="img-circle" style='width: 38px;'></a></li>
				</ul>
			</div>
		</div>
	</div>
	</nav>

	<div style="width: 100%; height: 220px; background: #ddd">
		<div class="container" style="padding: 80px 0px; height: 1515px">
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
							<li><a href="${pageContext.request.contextPath}/myCourse" class="active"> <span
									class="glyphicon glyphicon-book"></span> <strong>课程表</strong> <small>学习课程</small>
							</a></li>
							<li><a href="${pageContext.request.contextPath}/Order"> <span
									class="glyphicon glyphicon-shopping-cart"></span> <strong>订单</strong>
									<small>所有订单</small>
							</a></li>
							<li><a href="${pageContext.request.contextPath}/News"> <span
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
						<div class="panel panel-default">
							<div class="panel-heading">
								<span><h4 style="width: 100px; display: inline-block;">课程表</h4></span>
								<span class="glyphicon glyphicon-remove plus"></span>
								<!-- <span class="glyphicon glyphicon-plus plus" style="float:right;display:none;"
							onclick="rotate();"></span> -->
							</div>
							<div class="panel-body">
								<ul class="nav nav-pills nav-justified degree">
									<li role="presentation" class="text-center">
										<h3>已完成</h3> <strong>${isMyCourse }</strong>个
									</li>
									<li role="presentation" class="text-center">
										<h3>未完成</h3> <strong>${notMyCourse }</strong>个
									</li>
									<li role="presentation" class="text-center"
										style="border: none">
										<h3>新加入</h3> <strong>${newMyCourse }</strong>个
									</li>
								</ul>
							</div>
						</div>
						<div class="panel panel-default" style="margin-top: 50px">
							<div class="panel-heading tran"
								style="padding: 0px; height: 176px;">
								<ul class="courselist">

									<c:forEach items="${mycourse }" var="m" varStatus="i">
										<c:if test="${i.first }">
											<li class="course text-center active"
												onclick="aTask(${m.cid })">
										</c:if>
										<c:if test="${!i.first }">
											<li class="course text-center" onclick="aTask(${m.cid })">
										</c:if>
										<h3 class="text-left">${m.course.cname }</h3>
										<div class="progress">
											<div class="progress-bar progress-bar-info"
												role="progressbar" aria-valuenow="20" aria-valuemin="0"
												aria-valuemax="100" style="width: ${m.progress*100 }%"></div>
										</div>
										<span style="color: #0000004d">已学习 <c:out
												value="${Math.floor(m.progress*100)}"></c:out>%</span>
										</li>
									</c:forEach>
								</ul>
							</div>
							<div class="panel-body">
								<div style="padding: 20px 10px; font-size: 20px" id="divn"></div>
								<ul class="list-group task scroll1" id="ulTask">

								</ul>
							</div>
						</div>
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

	<script type="text/javascript">
		/*$(document).ready(function(){
			$(".plus").click(function(){

				$(this).addClass('glyphicon glyphicon-remove plus').siblings().removeClass('glyphicon glyphicon-plus plus');
			});
		});*/

		$(function() {
			$(".scroll1").slimScroll({
				color : 'rgb(0, 0, 0)',
				size : '7px',
				height : '525px',
			});

			var options = {
					horizontal: 1,
					mouseDragging: 1,
					touchDragging: 1,
					itemNav: "centered",
					scrollBy: 1,
					activateOn:"click"
			};
			$('.tran').sly(options);
			
		});
		
		$(function(){
			aTask(${Topcid});
		});
		function aTask(cid){
			$.ajax({
				url : "${pageContext.request.contextPath}/aTask",
				data : "cid="+cid,
				type : "POST",
				success : function(result) {
					build_li(result,cid);
				}
			});
		}
		function build_li(result,cid) {
			$("#ulTask").empty();
			$("#divn").empty();
			var users = result.extend.Task;
			var i=1;
			$.each(users,function(index,item) {
				
				var div=$("<div></div>").addClass("text-center").append(i);
				var font=$("<font></font>").append(item.task);
				var span1=$("<span></span>").addClass("glyphicon glyphicon-facetime-video video");
				var span2=$("<span></span>").addClass("shadow").attr("style","width:16px");
				var a=$("<a></a>").append(div).append(font).append(span1).append(span2).attr("href","${pageContext.request.contextPath}/courseView?cid="+cid+"&taskid="+item.taskid);
				var li=$("<li></li>").addClass("list-group-item").append(a);111
			
				$("#ulTask").append(li);
				i++;
			});
			var taskCount = result.extend.taskCount;
			$("#divn").append("全部课时(共"+taskCount+"节)");
		}

		
	</script>
</body>
</html>