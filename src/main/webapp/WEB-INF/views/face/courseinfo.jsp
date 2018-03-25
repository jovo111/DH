<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ page import="com.JOVO.model.CourseInfo,java.util.*"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>teacher</title>
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

.btn-default {
	color: #fff;
	background-color: #ff8000;
	border-color: #ff8000;
	border-radius: 0px;
	border: 3px solid #ff8000;
	font-size: 20px;
	padding: 12px 40px;
}

.btn-default:hover {
	color: #ff8000;
	border: 3px solid #ff8000;
	background-color: #fff;
}

.money span {
	color: #ee6c6c;
	font-size: 28px;
	padding: 12px 14px;
}

.attr span {
	font-size: 15px;
	padding: 0px 15px;
	border-right: 1px solid #ddd;
	color: #999;
}

.attr span:hover {
	color: #5bc0de;
}

.link {
	color: #696969;
	height: 45px;
	width: 80px;
}

.link:hover {
	background: #000;
	color: #fff;
}

.panel-default {
	border: none;
	border-radius: 0px;
	box-shadow: 0 5px 15px rgba(0, 0, 0, .05);
}

.discuss>.panel-body {
	border-bottom: 1px solid #ddd
}

.media-left>a>img {
	width: 40px;
}

.media-body {
	vertical-align: middle;
	color: #ff8000;
}

.media {
	margin-bottom: 10px
}

.content {
	color: #666;
	padding-bottom: 10px;
	margin-bottom: 10px;
	border-bottom: 1px solid #ddd
}

.content:hover {
	color: #49af4f;
	padding-bottom: 10px;
	border-bottom: 1px solid #ddd
}

.pagination li a {
	border: none;
	margin-left: 5px
}

.pagination li a:hover, .pagination>li>span:hover, .pagination>li>a:focus,
	.pagination>li>span:focus {
	color: #fff;
	background-color: #5cb85c;
	border-color: #ddd;
}

.list-group-item {
	border: none;
	background: #fff;
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

.list-group-item:hover {
	background: #e2fadd;
	color: #5cb85c;
}

.studentlist img {
	width: 50px;
}

.studentlist {
	float: left;
	margin-left: 10px;
}

.account input {
	height: 45px;
	border-left: 0px;
}

.modal-body {
	padding: 34px;
}

.login-form .form-group {
	margin-bottom: 30px
}

.sf-lr-wrap a {
	display: inline-block;
	width: 32px;
	height: 32px;
	vertical-align: middle;
	position: relative;
}

/* entire container, keeps perspective */
.flip-container {
	perspective: 1000;
}
/* flip the pane when hovered */
.flip-container:hover .flipper, .flip-container.hover .flipper {
	transform: rotateY(180deg);
}

.flip-container, .front, .back {
	width: 32px;
	height: 32px;
	position: relative;
	top: 0px;
	left: 147px;
}

/* flip speed goes here */
.flipper {
	transition: 0.6s;
	transform-style: preserve-3d;
	position: relative;
}
/* hide back of pane during swap */
.front, .back {
	backface-visibility: hidden;
	position: absolute;
	top: 0;
	left: 0;
}

/* front pane, placed above back */
.front {
	z-index: 2;
}

/* back, initially hidden pane */
.back {
	transform: rotateY(180deg);
}

.modal-footer {
	text-align: center;
}

.modal-content {
	border: none;
	border-radius: 0 0 6px 6px;
	outline: 0;
	-webkit-box-shadow: 0 3px 9px rgba(0, 0, 0, .5);
	box-shadow: 0 3px 9px rgba(0, 0, 0, .5);
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
	<nav class="navbar navbar-default navbar-fixed-top"
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
					<li><shiro:guest>
							<a href="javascript:void(0);" onclick="login()">登录/注册</a>
						</shiro:guest> <shiro:hasRole name="student">
							<a href="javascript:void(0);"><p class="welcome">Hello, <shiro:principal property="stunick"/></p></a>
						</shiro:hasRole></li>
					<li style="margin: -9px"><a href="#"><img
							src="${pageContext.request.contextPath}/image/6.jpg" alt="..."
							class="img-circle" style='width: 38px;'></a></li>
				</ul>
			</div>
		</div>
	</div>
	<!-- /.container-fluid --> </nav>

	<div>
		<div class="container" style="box-shadow: 0px 4px 20px #bbb">
			<div class="row">
				<ol class="breadcrumb"
					style="background: #fff; margin: 10px 0px; font-size: 15px">
					<li><a href="#"><span class="glyphicon glyphicon-home"></span>
							首页</a></li>
					<li><a href="#">Java</a></li>
					<li class="active">课程详情</li>
				</ol>
			</div>
			<div class="row">
				<div class="col-md-6">
					<img src="${pageContext.request.contextPath}/image/1.jpg "
						style="width: 100%; height: 310px">
				</div>
				<div class="col-md-5">
					<div style="height: 100px;">
						<font style="font-size: 25px; line-height: 48px;">${ cinfolist.getCname()}
						</font>
					</div>
					<div class="attr" style="width: 100%; height: 30px;">
						<span class="glyphicon glyphicon-user" title="观看人数">
							${cinfolist.getJoinnum()} </span> <span
							class="glyphicon glyphicon-education"> ${ cinfolist.getTeacherdetail().getTsource()}
						</span> <span class="glyphicon glyphicon-bookmark"> 1</span>
					</div>
					<div class="money"
						style="background: #f4f4f4; margin: 20px 0px; height: 58px;">
						<c:if test="${cinfolist.getCprice()!=0 }">
							<span class="glyphicon glyphicon-yen"><font
								style="font-size: 34px; padding: 0px 12px; font-family: 'Arial', 'Hiragino Sans GB', \5fae\8f6f\96c5\9ed1, 'Helvetica', 'sans-serif'">${ cinfolist.getCprice()}
							</font></span>
						</c:if>
					</div>
					<div>
						<c:if test="${cinfolist.getCprice()!=0 }">
							<c:if test="${count==0 }">
								<button type="button" class="btn btn-default"
									style="outline: none;">加入学习</button>
								<button type="button" class="btn btn-link"
									style="text-decoration: none; outline: none;">
									<span class="glyphicon glyphicon-briefcase"></span> 加入购物车
								</button>
							</c:if>
							<c:if test="${count==1 }">
								<button type="button" class="btn btn-default"
									style="outline: none;">加入学习</button>
							</c:if>
							<c:if test="${count==2 }">
								<button type="button" class="btn btn-default"
									style="outline: none;">立即学习</button>
							</c:if>
						</c:if>
						<c:if test="${cinfolist.getCprice()==0 }">
							<button type="button" class="btn btn-default"
								style="outline: none;">免费</button>
						</c:if>
					</div>
				</div>
			</div>
			<div class="row" style="margin-top: 15px;">
				<div
					style="width: 100%; height: 45px; background: #ddd; padding-left: 15px">
					<button type="button" class="btn btn-link link"
						style="text-decoration: none; outline: none;" href="#courseinfo"
						data-toggle="tab">课堂介绍</button>
					<button type="button" class="btn btn-link link"
						style="text-decoration: none; outline: none;" href="#tasklist"
						data-toggle="tab">讨论区</button>
					<button type="button" class="btn btn-link link"
						style="text-decoration: none; outline: none;" href="#discusslist"
						data-toggle="tab">目录</button>
				</div>
			</div>
		</div>
	</div>

	<div id="myTabContent" class="tab-content">
		<div class="tab-pane fade in active" id="courseinfo">
			<div class="container">
				<div class="row">
					<div class="col-md-9" style="padding: 20px 20px 0px 0px">
						<div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4>课程概述</h4>
								</div>
								<div class="panel-body">${ cinfolist.getCinfo()}</div>
							</div>
						</div>
					</div>
					<div class="col-md-3" style="padding: 20px 0px 0px 10px">
						<div class="panel panel-default">
							<div class="panel-body" style="border-bottom: 1px solid #ddd">
								<div class="text-center">
									<img src="${pageContext.request.contextPath}/image/1.jpg"
										style="width: 105px" alt="..." class="img-circle">
									<h5>${ cinfolist.getTeacherdetail().getTname()}</h5>
								</div>
							</div>
							<div class="panel-body">
								<div style="font-size: 13px">${ cinfolist.getTeacherdetail().getTinfo()}
								</div>
							</div>
						</div>

						<div class="panel panel-default">
							<div class="panel-heading">
								<h5>${ cinfolist.getJoinnum()}人在学习该门课程</h5>
							</div>
							<div class="panel-body" style="border-bottom: 1px solid #ddd">
								<div class="text-center">
									<c:forEach items="${studnets}" var="stu">
										<div class="studentlist">
											<img src="${pageContext.request.contextPath}/image/1.jpg"
												alt="..." class="img-rounded">
											<h6>${stu.studentdetail.snick}</h6>
										</div>
									</c:forEach>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="tab-pane fade" id="tasklist">
			<div class="container">
				<div class="row">
					<div class="col-md-8" style="padding: 20px 20px 0px 0px">
						<div>
							<div class="panel panel-default discuss">
								<div class="panel-heading">
									<h4>讨论区</h4>
								</div>
								<div class="panel-body">
									欢迎进入课程讨论区，你可以与本课程的老师和同学在这里交流。如果你有课程相关的问题，请发到老师答疑区；经验、思考、创意、作品、转帖请发到综合讨论区。欢迎分享，鼓励原创，杜绝广告，请大家共同维护一个包容、积极、相互支持的交流氛围，谢谢。
								</div>
								<div class="panel-body">
									<c:forEach items="${discussinfos}" var="dis">
										<div class="content">
											<div class="media">
												<div class="media-left">
													<a href="#"> <img
														src="${pageContext.request.contextPath}/image/1.jpg"
														alt="..." class="img-circle">
													</a>
												</div>
												<div class="media-body">
													<h5 class="media-heading">${dis.studentdetail.snick}</h5>
												</div>
												<div class="media-body">
													<h5 class="media-heading">${dis.discussinfo.distime}</h5>
												</div>
											</div>
											${dis.discussinfo.discuss}
										</div>
									</c:forEach>
									<div class="bottom">
										<nav aria-label="Page navigation" style="float:right">
										<ul class="pagination">
											<li><a href="#" aria-label="Previous"> <span
													aria-hidden="true">&laquo;</span>
											</a></li>
											<li><a href="#">1</a></li>
											<li><a href="#">2</a></li>
											<li><a href="#">3</a></li>
											<li><a href="#">4</a></li>
											<li><a href="#">5</a></li>
											<li><a href="#" aria-label="Next"> <span
													aria-hidden="true">&raquo;</span>
											</a></li>
										</ul>
										</nav>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-4" style="padding: 20px 0px 0px 10px">
						<div class="panel panel-default">
							<div class="panel-heading">发起讨论</div>
							<div class="panel-body">
								<form action="${pageContext.request.contextPath }/adddiscuss"
									method="post">
									<input type="hidden" name="cid" value="${ cinfolist.getCid()}"></input>
									<div class="form-group">
										<textarea class="form-control" rows="10" cols="20" name="discuss"></textarea>
									</div>
									<shiro:hasRole name="student">
										<button type="submit" class="btn btn-success"
											style="float: right" id="submit">Submit</button>
									</shiro:hasRole>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="tab-pane fade" id="discusslist">
			<div class="container">
				<div class="row">
					<div class="col-md-9" style="padding: 20px 20px 0px 0px">
						<div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4>目录</h4>
								</div>
								<div class="panel-body" style="padding: 20px 0px 0px 0px;">
									<ul class="list-group">
										<c:forEach items="${tasklist}" var="ts">
											<li class="list-group-item"><a href="${pageContext.request.contextPath }/courseView?cid=${ cinfolist.getCid()}&taskid=${ts.task.taskid}"><font>课时</font>&emsp;&emsp;${ts.task.task}<span
													class="glyphicon glyphicon-play-circle"> 12:00</span></a></li>
										</c:forEach>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-3" style="padding: 20px 0px 0px 10px">
						<div class="panel panel-default">
							<div class="panel-body" style="border-bottom: 1px solid #ddd">
								<div class="text-center">
									<img src="${pageContext.request.contextPath}/image/1.jpg"
										style="width: 105px" alt="..." class="img-circle">
									<h5>${ cinfolist.getTeacherdetail().getTname()}</h5>
								</div>
							</div>
							<div class="panel-body">
								<div style="font-size: 13px">${ cinfolist.getTeacherdetail().getTinfo()}
								</div>
							</div>
						</div>

						<div class="panel panel-default">
							<div class="panel-heading">
								<h5>${ cinfolist.getJoinnum()}人在学习该门课程</h5>
							</div>
							<div class="panel-body" style="border-bottom: 1px solid #ddd">
								<div class="text-center">
									<c:forEach items="${studnets}" var="stu">
										<div class="studentlist">
											<img src="${pageContext.request.contextPath}/image/1.jpg"
												alt="..." class="img-rounded">
											<h6>${stu.studentdetail.snick}</h6>

										</div>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
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
	</nav>
	
	<div class="modal fade bs-example-modal-sm" id="myModal" tabindex="-1"
		role="dialog" aria-labelledby="gridSystemModalLabel">
		<div class="modal-dialog" role="document"
			style="width: 400px; border: 3px solid #ddd; border-radius: 8px;">
			<div class="modal-header" style="padding: 0px">
				<ul class="nav nav-tabs nav-justified" style="background: #ddd;">
					<li class="active"><a href="#login" data-toggle="tab"
						style="border-radius: 4px 0px 0 0;"> 登录 </a></li>
					<li><a href="#register" data-toggle="tab"
						style="border-radius: 0px 4px 0 0;"> 注册 </a>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true"
								style="position: absolute; top: 10px; right: 10px;">&times;</span>
						</button></li>
				</ul>
			</div>
			<div id="myTabContent" class="tab-content" style="background: #fff">
				<div class="tab-pane fade in active modal-content" id="login">
					<div class="modal-body">
						<form class="login-form" id="login" method="Post" action="${pageContext.request.contextPath}/login">
							<div class="form-group">
								<label class="sr-only" for="exampleInputAmount">Amount
									(in dollars)</label>
								<div class="input-group account">
									<div class="input-group-addon">
										<i class="glyphicon glyphicon-user"></i>
									</div>
									<input type="text" class="form-control" name="snum"
										placeholder="请输入手机号">
								</div>
							</div>
							<div class="form-group">
								<label class="sr-only" for="exampleInputAmount">Amount
									(in dollars)</label>
								<div class="input-group account">
									<div class="input-group-addon">
										<i class="glyphicon glyphicon-lock"></i>
									</div>
									<input type="text" class="form-control" name="spwd"
										placeholder="请输入密码">
								</div>
							</div>
							<a href="#" class="forget"
								style="text-decoration: none; float: right; padding-bottom: 10px;">忘记密码？</a>
							<button type="submit" class="btn btn-success"
								style="width: 100%; height: 45px; font-size: 18px;">登 录</button>
						</form>
					</div>
					<div class="modal-footer" style="border: none">
						<div class="mt20 sf-lr-wrap tac"
							style="border-top: 1px solid #ddd;">
							<h6 class="hLh20 mb15">
								<span class="c-666 fsize14"
									style="position: relative; top: -17px; font-size: 14px; background: #fff; padding: 0px 12px;">
									第三方快捷登录 </span>
							</h6>
							<div class="flip-container"
								ontouchstart="this.classList.toggle('hover');"
								style="float: left;">
								<div class="flipper">
									<div class="front">
										<a class="qq-sf" href="javascript:thirdPartyLogin('QQ')"
											title="QQ登录" style="background: url(image/qq.png);"> </a>
									</div>
									<div class="back">
										<a class="wx-sf" href="javascript:thirdPartyLogin('WEIXIN')"
											title="QQ登录" style="background: url(image/qq-hover.png);">
										</a>
									</div>
								</div>
							</div>

							<div class="flip-container"
								ontouchstart="this.classList.toggle('hover');"
								style="float: left; margin-left: 10px;">
								<div class="flipper">
									<div class="front">
										<a class="qq-sf" href="javascript:thirdPartyLogin('QQ')"
											title="QQ登录" style="background: url(image/wx.png);"> </a>
									</div>
									<div class="back">
										<a class="wx-sf" href="javascript:thirdPartyLogin('WEIXIN')"
											title="QQ登录" style="background: url(image/wx-hover.png);">
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="tab-pane fade modal-content" id="register">
					<div class="modal-body">
						<form class="register-form" id="register">
							<div class="form-group">
								<div class="input-group account">
									<div class="input-group-addon">
										<i class="glyphicon glyphicon-user"></i>
									</div>
									<input type="text" class="form-control" name="snum"
										placeholder="请输入手机号">
								</div>
							</div>
							<div class="form-group">
								<div class="input-group account">
									<div class="input-group-addon">
										<i class="glyphicon glyphicon-lock"></i>
									</div>
									<input type="text" class="form-control" name="spwd"
										placeholder="请输入密码">
								</div>
							</div>
							<div class="form-group">
								<div class="input-group account">
									<div class="input-group-addon">
										<i class="glyphicon glyphicon-lock"></i>
									</div>
									<input type="text" class="form-control" name="repwd"
										placeholder="请再次输入密码">
								</div>
							</div>
							<div class="form-group">
								<div class="input-group">
									<input type="text" class="form-control" placeholder="请输入验证码"
										aria-describedby="basic-addon2" name="code"
										style="height: 45px;"> <span class="input-group-addon"
										id="basic-addon2"
										style="width: 130px; background: -webkit-linear-gradient(-45deg, #ff6a00 0%, #b542f0 100%); color: #fff;"
										onclick="show(this,'shouji')">发送验证码</span>
								</div>
							</div>

							<button type="submit" class="btn btn-success"
								style="width: 100%; height: 45px; font-size: 18px;">登 录</button>
						</form>
					</div>
					<div class="modal-footer" style="border: none">
						<div class="mt20 sf-lr-wrap tac"
							style="border-top: 1px solid #ddd;">
							<h6 class="hLh20 mb15">
								<span class="c-666 fsize14"
									style="position: relative; top: -17px; font-size: 14px; background: #fff; padding: 0px 12px;">
									第三方快捷登录 </span>
							</h6>
							<div class="flip-container"
								ontouchstart="this.classList.toggle('hover');"
								style="float: left;">
								<div class="flipper">
									<div class="front">
										<a class="qq-sf" href="javascript:thirdPartyLogin('QQ')"
											title="QQ登录" style="background: url(image/qq.png);"> </a>
									</div>
									<div class="back">
										<a class="wx-sf" href="javascript:thirdPartyLogin('WEIXIN')"
											title="QQ登录" style="background: url(image/qq-hover.png);">
										</a>
									</div>
								</div>
							</div>

							<div class="flip-container"
								ontouchstart="this.classList.toggle('hover');"
								style="float: left; margin-left: 10px;">
								<div class="flipper">
									<div class="front">
										<a class="qq-sf" href="javascript:thirdPartyLogin('QQ')"
											title="QQ登录" style="background: url(image/wx.png);"> </a>
									</div>
									<div class="back">
										<a class="wx-sf" href="javascript:thirdPartyLogin('WEIXIN')"
											title="QQ登录" style="background: url(image/wx-hover.png);">
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script>
	function login() {
		$('#myModal').modal('show');
	}
	</script>
</body>
</html>