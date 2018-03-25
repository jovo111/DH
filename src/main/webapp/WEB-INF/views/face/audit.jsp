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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/jquery.step.css"
	media="screen" type="text/css" />


<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.js"
	type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/jquery.step.js"></script>


<style type="text/css">
body {
	margin-top: 63px;
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

.div1 {
	background: url(${pageContext.request.contextPath}/image/face/bg3.png)
		center top no-repeat;
	height: 470px;
}

.btn-default {
	color: #ff8000;
	background-color: #00000047;
	border-color: #ff8000;
	border-radius: 0px;
	border: 2px solid #ff8000;
	font-size: 20px;
	padding: 12px 40px;
}

.btn-default:hover {
	color: #fff;
	border: 2px solid #ff8000;
	background-color: #ff8000;
}

.btn-default:visited {
	color: #ff8000;
	background-color: #00000047;
	border-color: #ff8000;
}

.div2 {
	background: url(${pageContext.request.contextPath}/image/face/bg5.png)
		center top no-repeat;
	height: 800px;
}

.div3 {
	background: #fff;
	height: 550px;
}

.content {
	margin: 0 auto;
	text-align: center;
}

.content ul {
	width: 1145px;
}

.content ul li {
	list-style: none;
	float: left;
	width: 270px;
	height: 220px;
	margin: 0 95px 44px 0;
}

.head {
	color: #000;
	width: 660px;
	margin: 0 auto;
	text-align: center;
	padding: 86px 0 65px;
}

.head .title {
	font-size: 30px;
	font-weight: bold;
}

.h-mark {
	font-size: 18px;
	margin-top: 28px;
}

.bottom .title {
	color: #000;
	font-size: 18px;
	margin: 30px 0 7px;
}

.w-head {
	color: #444;
	width: 650px;
	margin: 0 auto;
	text-align: center;
	padding-top: 97px;
}

.w-title {
	font-size: 30px;
	font-weight: bold;
}

.w-mark {
	font-size: 18px;
	margin-top: 26px;
}

.img {
	margin-top: 58px;
	text-align: center;
}
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
			<div class="col-md-4 col-md-offset-2" style="padding: 0px"></div>
			<div class="col-md-4" style="padding: 0px">
				<ul class="nav navbar-nav"
					style="margin: 3px; height: 57px; float: right">
					<li></li>
					<li></li>
					<li></li>
					<li><a href="${pageContext.request.contextPath}/toLogin">教师登录</a></li>
					<li style="margin: -9px"><a href="#"><img
							src="${pageContext.request.contextPath}/image/face/6.jpg"
							alt="..." class="img-circle" style='width: 38px;'></a></li>
				</ul>
			</div>
		</div>
	</div>
	<!-- /.container-fluid --> </nav>

	<div class="div1">
		<div class="container" style="padding: 0px">
			<div class="text-center" style="padding: 150px 0px">
				<div class="font">
					<font style="font-size: 50px; color: #fff;">启迪万众、获得财富、成就梦想</font>
				</div>
				<div style="margin-top: 80px">
					<button type="button" class="btn btn-default"
						style="outline: none;" onclick="javascript:window.location.href='${pageContext.request.contextPath}/auditTeacher';">我要帮助更多的人</button>
				</div>
			</div>
		</div>
	</div>

	<div class="div2">
		<div class="container" style="padding: 0px">
			<div class="welcome">
				<div class="head">
					<p class="title">欢迎来自各个领域的专业人士与机构前来入驻</p>
					<p class="h-mark">作为领先的在线教育平台，云课堂帮助你实现价值</p>
				</div>
				<div class="content">
					<ul>
						<li>
							<div class="image">
								<img
									src="${pageContext.request.contextPath}/image/face/great1.png">
							</div>
							<div class="bottom">
								<div class="title">便捷的教学工具</div>
								<div class="description">
									多样的内容承载形式，视频、直播、讨论等<br>随时随地与用户实时互动
								</div>
							</div>
						</li>
						<li>
							<div class="image">
								<img
									src="${pageContext.request.contextPath}/image/face/great2.png">
							</div>
							<div class="bottom">
								<div class="title">自由的权限管理</div>
								<div class="description">
									多角色权限分配，员工各司其职<br>细化教学管理
								</div>
							</div>
						</li>
						<li>
							<div class="image">
								<img
									src="${pageContext.request.contextPath}/image/face/great3.png">
							</div>
							<div class="bottom">
								<div class="title">丰富的营销工具</div>
								<div class="description">
									优惠券、促销活动，丰富的内容推广活动<br>针对优质内容，我们提供专项推广方案
								</div>
							</div>
						</li>
						<li>
							<div class="image">
								<img
									src="${pageContext.request.contextPath}/image/face/great4.png">
							</div>
							<div class="bottom">
								<div class="title">严格的版权保护</div>
								<div class="description">
									知识产权有保障<br>云课堂对于课程内容树立版权意识
								</div>
							</div>
						</li>
						<li>
							<div class="image">
								<img
									src="${pageContext.request.contextPath}/image/face/great5.png">
							</div>
							<div class="bottom">
								<div class="title">完善的技术保障</div>
								<div class="description">
									7*24h技术支持<br>维护系统安全
								</div>
							</div>
						</li>
						<li>
							<div class="image">
								<img
									src="${pageContext.request.contextPath}/image/face/great6.png">
							</div>
							<div class="bottom">
								<div class="title"></div>
								<div class="description">更多服务正在为你开发中…</div>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<div class="div3">
		<div class="container" style="padding: 0px">
			<div class="wrap">
				<div class="w-head">
					<p class="w-title">入驻流程</p>
					<p class="w-mark">数万家专业人士与企业入驻云课堂，云课堂已支持众多个人、企业、机构实现价值</p>
				</div>
				<div class="img">
					<img src="${pageContext.request.contextPath}/image/face/bg4.png">
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
	<script>
	</script>
</body>
</html>