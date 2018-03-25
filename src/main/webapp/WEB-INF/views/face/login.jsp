<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
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

.txt {
	background:
		url(${pageContext.request.contextPath}/image/face/logoutBg.jpg)
		no-repeat;
	height: 55px;
	line-height: 55px;
	padding-left: 80px;
	margin-left: 60px;
	font-family: 'Microsoft YAHEI';
	font-size: 20px;
	font-weight: bold;
	height: 60px;
	margin-top: 60px;
}

.login {
	margin-left: 140px;
	height: 40px;
	width: 100px;
	border-radius: 0px;
	box-shadow: 1px 1px 1px #ddd;
}

.app {
	position: absolute;
	right: 80px;
	top: 50px;
	height: 200px;
}

.app p {
	font-size: 24px;
	color: #333;
	font-family: 'microsoft yahei';
	height: 47px;
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
					<li><a href="#">登录/注册</a></li>
					<li style="margin: -9px"><a href="#"><img
							src="${pageContext.request.contextPath}/image/face/6.jpg"
							alt="..." class="img-circle" style='width: 38px;'></a></li>
				</ul>
			</div>
		</div>
	</div>
	<!-- /.container-fluid --> </nav>

	<div style="background: #eee; height: 800px">
		<div class="container" style="padding: 0px">
			<div class="col-lg-12" style="padding: 0px">
				<div class="panel panel-default"
					style="box-shadow: 0px 1px 2px #bbb; margin: 20px 0px; border-radius: 0px">
					<div class="panel-body" style="height: 300px;">
						<div class="txt">已经成功退出登录</div>
						<button type="button" class="btn btn-default login" onclick="login()">重新登录</button>
						<div class="app">
							<p>黑马课堂App</p>
							<a href="#">敬请期待&gt;&gt;</a><br> <img
								src="${pageContext.request.contextPath}/image/face/logout_bg.png"
								alt="">
						</div>
					</div>
					<div class="panel-footer">
						<span style="font-size: 14px; color: #999;">君子不隐其短，不知则问，不能则学。
							—— 董仲舒</span>
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
					为您提供丰富的优质课堂讲解，以及师生互动的课堂环境，帮助您提高个人<br>的能力和技术的升华。<br>
					<br> @2017~2018黑马课堂版权所有
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