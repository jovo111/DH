<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="Generator" content="EditPlus®">
<meta name="Author" content="">
<meta name="Keywords" content="">
<meta name="Description" content="">
<title>Document</title>

<link href="${pageContext.request.contextPath}/css/bootstraps.min.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/index-style.css"
	rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrapValidator.min.css" />

<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.js"
	type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/js/jquery.slimscroll.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrapValidator.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.form.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/searchform.js"></script>


<style type="text/css">
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

.dropdown-menu li a {
	padding: 10px 0px;
	font-size: 13px
}

.dropdown-menu li {
	padding: 0px 10px;
	font-size: 13px
}

.type{
			display: inline-block;
			padding:5px 10px;
			color: #666;
		}

		.type:hover{
			color:#33a126;
		}

		.vertical{
			color: #ddd;
		}

		.b-type{
			display: inline-block;
			float: left;
			padding:0px 10px;
			font-size: 20px;
			color: #000;
		}
</style>
</head>
<body>
	<nav class="navbar navbar-default navbar-static-top"
		style="background: #ffffff">
	<div class="container" style="height: 90px;">
		<div class="row">
			<div
				style="float: left; min-width: 390px !important; padding-left: 15px;">
				<a href="${pageContext.request.contextPath }/" class="navbar-brand"><img
					src="${pageContext.request.contextPath }/image/face/logo.png"
					style="height: 70px;"></a>
			</div>
			<div
				style="float: left; padding-top: 20px; min-width: 486px !important;">
				<form id="searchform" class="navbar-form navbar-left"
					action="${pageContext.request.contextPath }/courseList"
					method="post">
					<div class="input-group">
						<input type="text" class="form-control" placeholder="请输入要查找的课程"
							style="width: 280px; height: 44px; border-radius: 0px" id="param"
							name="param"> <span class="input-group-btn">
							<button id="search" type="button"
								class="btn btn-success btn-search"
								style="width: 70px; height: 44px; border-radius: 0px; padding: 0px;">
								<span class="glyphicon glyphicon-search" style="font-size: 28px"></span>
							</button>
						</span>
					</div>
				</form>
			</div>
			<div
				style="float: left; padding-top: 22px; min-width: 294px !important">
				<ul class="nav navbar-nav">
					<li class="dropdown"><shiro:guest>
							<a href="javascript:void(0);" onclick="login()">登录/注册</a>
						</shiro:guest> <shiro:hasRole name="student">
							<a class="dropdown-toggle show">Hello, <shiro:principal
									property="stunick" />
							</a>

							<ul class="dropdown-menu" style="border-radius: 0px;">
								<li><a
									href="${pageContext.request.contextPath }/studentDetail"
									style="border-bottom: 1px solid #ddd">个人信息</a></li>
								<li><a href="${pageContext.request.contextPath }/Order">我的订单</a></li>
								<li><a href="${pageContext.request.contextPath }/myCourse">我的课堂</a></li>
								<li><a href="${pageContext.request.contextPath }/News">消息</a></li>
								<li><a
									href="${pageContext.request.contextPath }/studentLogout">退出</a></li>
							</ul>
						</shiro:hasRole></li>
					<li><a href="${pageContext.request.contextPath }/audit">我要开课</a></li>
					<li><a href="#">帮助</a></li>
				</ul>
			</div>
		</div>
	</div>
	</nav>
	<nav class="navbar navbar-default" style="background: #ffffff;">
	<div class="container" style="height: 50px">
		<div class="row">
			<div class="col-md-3"
				style="width: 292.5px !important; padding-right: 0px">
				<div
					style="background: #31a030; width: 100%; height: 50px; font-size: 23px; color: #ffffff; padding-left: 5px">
					<span class="glyphicon glyphicon-list" aria-hidden="true"
						style="padding: 10px 10px"></span> 全部类目
				</div>
				<div style="position: absolute; z-index: 1000;">
					<a class="left" href="#myCarousel" data-slide="prev"><img
						src="${pageContext.request.contextPath }/image/face/s-prev-btn.png"
						style="position: absolute; top: 160px; left: 275px;"></a>
					<div
						style="background: #ffffff00; width: 262.5px; height: 400px; margin: -1px 0px">
						<ul class="list-group coursetype">
							<li class="list-group-item courseType"
								style="border-bottom: 1px solid #ffffff" data-id="1" data-name="办公效率"><span>办公效率</span>
								<a href="">PPT</a> <a href="">PPT</a></li>
							<li class="list-group-item courseType" data-id="2" data-name="职业发展"><span>职业发展</span> <a
								href="">个人成长</a> <a href="">演讲口才</a></li>
							<li class="list-group-item courseType" data-id="3" data-name="编程开发"><span>编程开发</span> <a
								href="">人工智能</a> <a href="">演讲口才</a></li>
							<li class="list-group-item courseType" data-id="4" data-name="产品和设计">产品和设计</li>
							<li class="list-group-item courseType" data-id="5" data-name="生活方式">生活方式</li>
							<li class="list-group-item courseType" data-id="6" data-name="亲子教育">亲子教育</li>
							<li class="list-group-item courseType"
								style="padding-bottom: 19px; border-bottom: 1px solid #000000" data-id="7" data-name="职业发展">语言学习</li>
						</ul>
					</div>
				</div>

			</div>
			<div class="col-md-9"
				style="padding-left: 0px; margin-left: -15px; background: #ffffff">
				<div style="height: 50px; width: 100%"></div>
				<div class="typepancel"
					style="position: absolute; z-index: 1000; width: 100%; display: none">
					<div
						style="background: #ffffff; height: 400px; margin: -1px 0px; border: 1px solid #ddd;padding:30px; border-left: none;">
						<div class="ad" style="float:right;padding: 35px 0px;">
							<p style="font-size:20px">黑马课堂App</p>
							<a href="#">敬请期待&gt;&gt;</a><br> <img
								src="${pageContext.request.contextPath}/image/face/logout_bg.png"
								alt="">
						</div>
						
						<div id="types"></div>
					</div>
				</div>
				<div
					style="position: absolute; z-index: 999; right: 0px; width: 235px;">
					<a class="right" href="#myCarousel" data-slide="next"><img
						src="${pageContext.request.contextPath }/image/face/s-next-btn.png"
						style="position: absolute; top: 160px; right: 248px;"></a>
					<div
						style="background: #ffffff00; padding: 40px 0px; height: 400px; margin: -1px 0px; border-bottom: 1px solid #000000">

						<shiro:hasRole name="student">
							<div class="panel panel-default"
								style="display: block; border-radius: 0px">
								<div class="panel-heading"
									style="background: #fff; border-bottom: 0px">
									<div>
										<img
											src="${pageContext.request.contextPath }/image/face/6.jpg"
											style="height: 45px; width: 45px; border-radius: 0px"
											alt="..." class="img-rounded"> &emsp;<a
											href="${pageContext.request.contextPath }/studentLogout"
											style="float: right; color: #C3C3C3; text-decoration: none; margin: 10px;">退出</a>
									</div>
									<div
										style="margin-top: 5px; color: #646464; padding: 8px 0px; border-bottom: 1px solid #ddd;">
										<span><font style="font-size: 20px">${mycourseCount }</font>
											门功课</span><span style="float: right"><font
											style="font-size: 20px">${myorderCount }</font> 个订单</span>
									</div>
								</div>
								<div class="panel-body" style="padding: 0px;">
									<ul class="list-group studentDetail"
										style="border: none; padding: 0px; margin: 0px; min-height: 135px;">
										<c:forEach items="${mycourse}" var="mycourse" begin="0"
											end="2">
											<li class="list-group-item">${mycourse.course.cname }<c:if
													test="${mycourse.progress<1 }">
													<span class="label label-danger">待完成</span>
												</c:if> <c:if test="${mycourse.progress==1 }">
													<span class="label label-success">已完成</span>
												</c:if>
											</li>
										</c:forEach>
									</ul>
								</div>
								<div class="panel-footer text-center"
									style="font-size: 16px; border: none; background: #fff; height: 55px">
									<a href="${pageContext.request.contextPath }/myCourse"
										style="display: line-block; padding: 15px 40px; background: #f6f6f6"><span
										class="glyphicon glyphicon-calendar"> <font
											style="font-size: 18px">我的课表</font>
									</span></a>
								</div>
							</div>
						</shiro:hasRole>

						<shiro:guest>
							<div class="panel panel-default" style="display: block">
								<div class="panel-heading"
									style="background: #fff; border: none; padding: 35px 20px 25px 54px;">
									<font style="color: #ddd; font-size: 16px;">更进你的学习进度</font>
								</div>
								<div class="panel-body"
									style="width: 170px; height: 140px; background: url(image/login.png#unsprite) no-repeat -144px -370px; margin: 10px auto auto">

								</div>
								<div class="panel-footer text-center"
									style="font-size: 16px; background: #fff; border: none">
									<button class="btn btn-info"
										style="width: 100%; height: 45px; font-size: 15px;"
										onclick="login()">登 录</button>
								</div>
							</div>
						</shiro:guest>
					</div>
				</div>
			</div>
		</div>
	</div>
	</nav>
	<div class="container-fluid" style="padding: 0px;">
		<div id="myCarousel" class="carousel slide">
			<!-- 轮播（Carousel）指标 -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>
			<!-- 轮播（Carousel）项目 -->
			<div class="carousel-inner">
				<div class="item active">
					<img src="${pageContext.request.contextPath }/image/face/1.jpg"
						alt="First slide">
				</div>
				<div class="item">
					<img src="${pageContext.request.contextPath }/image/face/2.jpg"
						alt="Second slide">
				</div>
				<div class="item">
					<img src="${pageContext.request.contextPath }/image/face/3.jpg"
						alt="Third slide">
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div style="padding-top: 20px; margin-right: -20px;">
			<div class="free-course text-center"
				style="padding: 44px 0px; color: #ffffff; background: #9dc21b;">
				<span class="glyphicon glyphicon-book" style="font-size: 50px"></span>
				<h3>免费好课</h3>
				<h5>
					<a href="${pageContext.request.contextPath }/courseList?param=free"
						style="color: #ffffff; text-decoration: none">查看更多</a>
				</h5>
			</div>
			<c:forEach items="${notCourse }" var="course">
				<div class="free-course">
					<div>
						<a
							href="${pageContext.request.contextPath }/courseInfo?cid=${course.cid}"><img
							src="${pageContext.request.contextPath}/image/6.jpg"></a>
					</div>
					<a
						href="${pageContext.request.contextPath }/courseInfo?cid=${course.cid}"
						style="font-size: 16px">${course.cname }</a><br> <a
						style="color: #999" href="#"><h6>${course.teacherDetail.tname }</h6></a>
				</div>
			</c:forEach>
		</div>

		<div style="margin-top: 20px; float: left">
			<div>
				<h2>畅销好课</h2>
				<a href="${pageContext.request.contextPath }/courseList?param=pay"
					style="text-align: right"><h5 class="m-font">
						更多 <span class="label label-default more"> <span
							class="glyphicon glyphicon-chevron-right"></span></span>
					</h5></a></span>
			</div>
			<div class="free-course" style="float: left; margin-right: 20px">
				<div>
					<img src="${pageContext.request.contextPath}/image/6.jpg"
						style="width: 212px; height: 475px">
				</div>
			</div>
			<div style="float: left; margin-right: 20px">
				<div class="sell-course">
					<c:forEach items="${isCourse }" var="isOne" begin="0" end="1">
						<div class="free-course">
							<div>
								<a
									href="${pageContext.request.contextPath }/courseInfo?cid=${isOne.cid}"><img
									src="${pageContext.request.contextPath}/image/6.jpg"></a>
							</div>
							<a
								href="${pageContext.request.contextPath }/courseInfo?cid=${isOne.cid}"
								style="font-size: 16px">${isOne.cname }</a><br> <a
								style="color: #999" href="#"><h6>${isOne.teacherDetail.tname }</h6></a>
							<a
								href="${pageContext.request.contextPath }/courseInfo?cid=${isOne.cid}"
								style="font-size: 16px; color: red"><span
								class="glyphicon glyphicon-yen"> <font class="cprice">${isOne.cprice }</font></span></a>
						</div>
					</c:forEach>
					<div class="free-course" style="margin: 0px">
						<div>
							<a
								href="${pageContext.request.contextPath }/courseInfo?cid=${isCourse.get(2).getCid()}"><img
								src="${pageContext.request.contextPath}/image/6.jpg"></a>
						</div>
						<a
							href="${pageContext.request.contextPath }/courseInfo?cid=${isCourse.get(2).getCid()}"
							style="font-size: 16px">${isCourse.get(2).getCname() }</a><br>
						<a style="color: #999" href="#"><h6>${isCourse.get(2).getTeacherDetail().getTname() }</h6></a>
						<a
							href="${pageContext.request.contextPath }/courseInfo?cid=${isCourse.get(2).getCid()}"
							style="font-size: 16px; color: red"><span
							class="glyphicon glyphicon-yen"> <font class="cprice">${isCourse.get(2).getCprice() }</font></span></a>
					</div>
				</div>
				<div class="sell-course">
					<c:forEach items="${isCourse }" var="isOne" begin="3" end="4">
						<div class="free-course">
							<div>
								<a
									href="${pageContext.request.contextPath }/courseInfo?cid=${isOne.cid}"><img
									src="${pageContext.request.contextPath}/image/6.jpg"></a>
							</div>
							<a
								href="${pageContext.request.contextPath }/courseInfo?cid=${isOne.cid}"
								style="font-size: 16px">${isOne.cname }</a><br> <a
								style="color: #999" href="#"><h6>${isOne.teacherDetail.tname }</h6></a>
							<a
								href="${pageContext.request.contextPath }/courseInfo?cid=${isOne.cid}"
								style="font-size: 16px; color: red"><span
								class="glyphicon glyphicon-yen"> <font class="cprice">${isOne.cprice }</font></span></a>
						</div>
					</c:forEach>
					<div class="free-course" style="margin: 0px">
						<div>
							<a
								href="${pageContext.request.contextPath }/courseInfo?cid=${isCourse.get(5).getCid()}"><img
								src="${pageContext.request.contextPath}/image/6.jpg"></a>
						</div>
						<a
							href="${pageContext.request.contextPath }/courseInfo?cid=${isCourse.get(5).getCid()}"
							style="font-size: 16px">${isCourse.get(5).getCname() }</a><br>
						<a style="color: #999" href="#"><h6>${isCourse.get(5).getTeacherDetail().getTname() }</h6></a>
						<a
							href="${pageContext.request.contextPath }/courseInfo?cid=${isCourse.get(5).getCid()}"
							style="font-size: 16px; color: red"><span
							class="glyphicon glyphicon-yen"> <font class="cprice">${isCourse.get(5).getCprice() }</font></span></a>
					</div>
				</div>
			</div>
			<div class="free-course" style="float: right; margin: 0px">
				<div>
					<img src="${pageContext.request.contextPath}/image/6.jpg"
						style="width: 212px; height: 475px">
				</div>
			</div>
		</div>

		<div style="float: left">
			<div>
				<h2>名师大咖秀</h2>
				<a href="${pageContext.request.contextPath }/audit"
					style="text-align: right"><h5 class="m-font">
						加入 <span class="label label-default more"> <span
							class="glyphicon glyphicon-chevron-right"></span></span>
					</h5></a></span>
			</div>
			<c:forEach items="${teacher }" var="t">
				<a href="${pageContext.request.contextPath }/teacher?tid=${t.tid}"><div
						class="teacher">
						<div>
							<img src="${pageContext.request.contextPath}/image/6.jpg">
						</div>
						<div class="edu">
							<span><h4>${t.teacherDetail.tname}</h4></span><font
								style="padding-left: 15px">${t.teacherDetail.tsource}</font>
						</div>
					</div></a>
			</c:forEach>
		</div>
	</div>
	<div style="background: #f9f7f7">
		<div class="container">
			<c:forEach items="${oneToMany}" var="o">
				<div class="course" style="margin-top: 40px; float: left">
					<div>
						<h2>${o.typename }</h2>
						<a
							href="${pageContext.request.contextPath }/course?typeid=${o.typeid }"
							style="text-align: right"><h5 class="m-font">
								更多 <span class="label label-default more"> <span
									class="glyphicon glyphicon-chevron-right"></span></span>
							</h5></a></span>
					</div>
					<div class="free-course" style="width: 444px; height: 190px">
						<div>
							<a href="#"><img
								src="${pageContext.request.contextPath}/image/1.jpg"
								style="width: 444px; height: 190px"></a>
						</div>
					</div>

					<c:forEach items="${o.courses }" var="c" begin="0" end="1">
						<div class="free-course">
							<div>
								<a
									href="${pageContext.request.contextPath }/courseInfo?cid=${c.cid}"><img
									src="${pageContext.request.contextPath}/image/6.jpg"></a>
							</div>
							<a
								href="${pageContext.request.contextPath }/courseInfo?cid=${c.cid}"
								style="font-size: 16px">${c.cname }</a><br> <a
								style="color: #999"
								href="${pageContext.request.contextPath }/courseInfo?cid=${c.cid}"><h6>${c.teacherDetail.tname }</h6></a>
						</div>
					</c:forEach>

					<div class="free-course"
						style="margin: 0; float: right; height: 400px; background-color: #ab7fd5">
						<ul class="list-group rank"
							style="margin-bottom: 0px; margin: 15px 0px;">
							<li class="list-group-item">Java从入门到精通</li>
							<li class="list-group-item">Java从入门到精通</li>
							<li class="list-group-item">Java从入门到精通</li>
							<li class="list-group-item">Java从入门到精通</li>
							<li class="list-group-item">Java从入门到精通</li>
						</ul>
						<div>
							<a href="#"><img
								src="${pageContext.request.contextPath}/image/6.jpg"
								style="height: 234px;"></a>
						</div>
					</div>
					<div style="margin-top: 220px;">
						<c:forEach items="${o.courses }" var="c" begin="2" end="5">
							<div class="free-course">
								<div>
									<a
										href="${pageContext.request.contextPath }/courseInfo?cid=${c.cid}"><img
										src="${pageContext.request.contextPath}/image/6.jpg"></a>
								</div>
								<a
									href="${pageContext.request.contextPath }/courseInfo?cid=${c.cid}"
									style="font-size: 16px">${c.cname }</a><br> <a
									style="color: #999"
									href="${pageContext.request.contextPath }/courseInfo?cid=${c.cid}"><h6>${c.teacherDetail.tname }</h6></a>
							</div>
						</c:forEach>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<div class="fiex-div">
		<div class="text-center">
			<span class="glyphicon glyphicon-comment"
				style="font-size: 30px; color: #31a030"></span>
		</div>
		<div class="text-center">
			<span class="glyphicon glyphicon-qrcode" style="font-size: 30px;"></span>
		</div>
		<div class="text-center" id="goto">
			<span class="glyphicon glyphicon-circle-arrow-up"
				style="font-size: 30px; color: #666"></span>
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
						<form class="login-form" id="login" method="Post"
							action="${pageContext.request.contextPath}/login">
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
						<form class="register-form" id="register"
							action="${pageContext.request.contextPath }/register"
							method="post">
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
								style="width: 100%; height: 45px; font-size: 18px;">注 册</button>
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
	<script type="text/javascript">
		$(function() {
			var typeli;
			$(".courseType,.typepancel").mouseover(
					function() {
						if ($(this).hasClass("courseType")) {
							typeli = $(this);
							var baseid=$(this).data("id");
							var basename=$(this).data("name");
							call(baseid,basename);
							$(this).attr('style',
									'background-color:#FFF;color:#000000');
						} else {
							typeli.attr('style',
									'background-color:#FFF;color:#000000');
						}

						$(".typepancel").show();
					});

			$(".courseType,.typepancel").mouseout(function() {
				if ($(this).hasClass("courseType")) {
					$(this).attr('style', 'background-color: #00000075');
				} else {
					typeli.attr('style', 'background-color:#00000075');
				}

				$(".typepancel").toggle();
			});
			
			
			function call(baseid,basename){
				$.ajax({
					url : "${pageContext.request.contextPath}/courseTypes",
					
					data : "baseid=" + baseid,
					type : "POST",
					success : function(result) {
						build_types(result,basename);
					}
				});
			}
			
			function build_types(result,basename){
				$("#types").empty();
				var types = result.extend.courseType;
				var btype=$("<a></a>").addClass("b-type").attr({"href":"javascript:void(0);","style":"text-decoration: none;color:#000"}).append(basename);
				var span=$("<span></span>").addClass("vertical").append("|").appendTo(btype);
				
				var btitle=$("#types").append(span).append(btype);
				$.each(types,function(index, item) {
					
					var span=$("<span></span>").addClass("vertical").append("|");
					var a=$("<a></a>").attr("href","${pageContext.request.contextPath}/course?typeid="+item.typeid).addClass("type").append(item.typename);
					var p=$("<p></p>").attr("style","display: inline-block;").append(a).append(span);
					btitle.append(p);
				});
				
				
			}
			
			$("#goto").click(function() {
			      $("html,body").animate({scrollTop:0}, 500);
			}); 

			$(window).bind("scroll", function() {
				var sTop = $(window).scrollTop();
				var sTop = parseInt(sTop);
				if (sTop >= 1) {
					$(".fiex-div").show();
				} else {
					$(".fiex-div").hide();
				}
			})

			$(".show,.dropdown-menu").mouseover(function() {
				$(".dropdown-toggle").dropdown('toggle');

			});
			$(".show,.dropdown-menu").mouseout(function() {
				$(".dropdown").removeClass('open');
			});


			/* $('#login').bootstrapValidator({
				message : 'This value is not valid',
				feedbackIcons : {
					valid : 'glyphicon glyphicon-ok',
					invalid : 'glyphicon glyphicon-remove',
					validating : 'glyphicon glyphicon-refresh'
				},
				fields : {
					snum : {
						validators : {
							notEmpty : {
								message : '账号不能为空!!!'
							},
							regexp : {// 只需加此键值对，包含正则表达式，和提示 
								regexp : /^1\d{10}$/,
								message : '只能是数字'
							}
						}
					},
					spwd : {
						validators : {
							notEmpty : {
								message : '密码不能为空!!!'
							}
						}
					}
				}
			});

			$('#register').bootstrapValidator({
				message : 'This value is not valid',
				feedbackIcons : {
					valid : 'glyphicon glyphicon-ok',
					invalid : 'glyphicon glyphicon-remove',
					validating : 'glyphicon glyphicon-refresh'
				},
				fields : {
					snum : {
						validators : {
							notEmpty : {
								message : '账号不能为空'
							},
							regexp : {// 只需加此键值对，包含正则表达式，和提示 
								regexp : /^1\d{10}$/,
								message : '只能是数字'
							}
						}
					},
					spwd : {
						validators : {
							notEmpty : {
								message : '密码不能为空'
							},
							stringLength : {//长度提示
								min : 6,
								max : 30,
								message : '密码长度必须在6到30之间'
							}
						}
					},
					repwd : {
						validators : {
							notEmpty : {
								message : '密码不能为空'
							},
							identical : { //比较是否相同
								field : 'spwd', //需要进行比较的input name值
								message : '两次密码不一致'
							},
						}
					},
					code : {
						validators : {
							notEmpty : {
								message : '验证码不能为空'
							},
							regexp : {// 只需加此键值对，包含正则表达式，和提示 
								regexp : /^1\d{10}$/,
								message : '只能是数字'
							}
						}
					}
				}
			}); */
		});

		var code = "";
		var wait = 60;

		function time(o) {
			if (wait == 0) {
				o.removeAttribute("disabled");
				o.innerText = "获取验证码";
				wait = 60;
			} else {
				o.setAttribute("disabled", true);
				o.innerText = wait + "秒";
				wait--;
				setTimeout(function() {
					time(o)
				}, 1000)
			}
		}

		function send(o, type) {
			if ($("#" + type).val() != "") {

				$.ajax({
					url : "${pageContext.request.contextPath}/code",
					data : "phone=" + $("#" + type).val(),
					type : "POST",
					success : function(result) {
						code = result.extend.code;
					}
				});

			} else {
				alert("请输入手机号码！");
			}

		}
		function show(o, type) {
			if ($("#" + type).val() != "") {
				send(o, type);
				alert(code);
				if (code == "1" || code == "") {
					alert("该手机号码已被注册，请更换手机号码!!!");
				} else {
					alert(code);
					time(o);
				}
			} else {
				alert("请输入手机号码！");
			}

		}

		function login() {
			$('#myModal').modal('show');
		}

		function courseType(baseid) {
			$.ajax({
				url : "${pageContext.request.contextPath}/courseType",
				data : "baseid=" + baseid,
				type : "POST",
				success : function(result) {

				}
			});
		}

		/* function li */
	</script>
</body>
</html>