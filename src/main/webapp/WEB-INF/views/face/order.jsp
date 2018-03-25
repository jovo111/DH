<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
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
	background: #f8f8f8;
	position: relative;
	left: 254px;
	bottom: 262px;
	box-shadow: 6px 2px 20px #bbb;
}

.image>div>img {
	width: 105px;
}

.image>div {
	float: left;
}

.table>tbody>tr>td {
	vertical-align: middle;
}

.table>tbody>tr {
	height: 130px;
}

.table>tbody>tr>td>img {
	width: 100px;
}

.icon a:hover {
	color: #e67e22;
}

.icon>a {
	color: #000;
	font-size: 20px
}

.icon-over {
	width: 60px;
	height: 60px;
	border-radius: 50%;
	font-size: 20px;
	line-height: 60px;
	text-align: center;
	border: 2px solid #e67e22;
	margin: 0px auto;
	color: #e67e22;
	-moz-transform: rotate(-30deg);
	-webkit-transform: rotate(-30deg);
	-ms-transform: rotate(-30deg);
	-o-transform: rotate(-30deg);
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
							href="#"><font style="font-size: 28px">${orderCount }</font> <span
								class="glyphicon glyphicon-shopping-cart"></span></a></li>
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
							<li><a href="${pageContext.request.contextPath}/Order" class="active"> <span
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
						<ul class="nav nav-tabs type text-center"
							style="background: #ddd;">
							<li role="presentation" style="margin-right: 10px"><a
								href="#paid" data-toggle="tab">已付款</a></li>
							<li class="active" role="presentation"><a href="#unpaid"
								data-toggle="tab">未付款</a></li>
						</ul>

						<div id="myTabContent" class="tab-content">

							<div class="tab-pane fade in active" id="unpaid"
								style="box-shadow: 0px 0px 15px 10px rgba(0, 0, 0, .05); height: 790px">
								<div style="height: 720px">
									<table class="table table-striped table-hover">
										<thead>
											<tr>
												<td><input type="checkbox" class="controlAll"
													id="controlAll"> 全选</td>
												<td></td>
												<td></td>
												<td></td>
												<td class="text-right">

													<button type="button" class="btn btn-danger">删除</button>
												</td>
											</tr>
										</thead>
										<tbody class="one-shop">
											<c:forEach items="${order_order}" var="ors">
												<tr class="one-goods">
													<td><input type="checkbox" class="goods-check"></td>
													<td style="width: 120px;"><img
														src="${pageContext.request.contextPath}/image/face/7.jpg"
														class="img-rounded"></td>
													<td class="text-left">
														<h3>${ors.course.cname}</h3> <span> <font
															style="padding: 0px 10px; border-left: 1px solid #ddd;">${ors.course.teacherDetail.tname}</font>
															<font
															style="border-left: 1px solid #ddd; padding: 0px 10px;">${ors.course.teacherDetail.tsource}</font>
													</span>
													</td>
													<td><span class="glyphicon glyphicon-yen" id="price">${ors.course.cprice}</span>
													</td>
													<td class="text-center icon"><a
														href="order_delete?oid=${ors.oid }&sid=${ors.sid}"><span
															class="glyphicon glyphicon-trash"></span></a>&emsp; <a
														href="#"><span
															class="glyphicon glyphicon-shopping-cart"></span></a></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
								<div style="background: #ddd; width: 100%; height: 46px;">
									<div
										style="display: inline-block; width: 200px; height: 45px; padding: 10px 8px;">
										<input type="checkbox" class="AllCheck">&emsp;合计：<span
											class="glyphicon glyphicon-yen" id="Allprice"
											style="font-size: 20px; color: #da1313">0.00</span>
									</div>
									<button type="button" class="btn btn-danger"
										style="float: right; width: 120px; height: 46px; border-radius: 0px; background: #e67e22; outline: none;">结算</button>

								</div>
							</div>

							<div class="tab-pane fade" id="paid"
								style="box-shadow: 0px 0px 15px 10px rgba(0, 0, 0, .05); height: 790px">
								<div style="height: 720px">
									<table class="table table-striped table-hover">
										<thead>
											<tr>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${order}" var="paid">
												<tr class="one-goods">
													<td><input type="checkbox" class="goods-check"></td>
													<td style="width: 120px;"><img
														src="${pageContext.request.contextPath}/image/face/8.jpg"
														class="img-rounded"></td>
													<td class="text-left">
														<h3>${paid.course.cname}</h3> <span> <font
															style="padding: 0px 10px; border-left: 1px solid #ddd;">${paid.course.teacherDetail.tname}</font>
															<font
															style="border-left: 1px solid #ddd; padding: 0px 10px;">${paid.course.teacherDetail.tsource}</font>
													</span>
													</td>
													<td><span class="glyphicon glyphicon-yen" id="price">${paid.course.cprice}</span>
													</td>
													<td class="text-center">
														<div class="icon-over" style="font-size: 18px;">已付款</div>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
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
		</nav>
	</div>


	<script>
			$(".controlAll")
					.change(
							function() {
								if ($(this).prop("checked") == true) { //如果全选按钮被选中 
									$(".goods-check").prop('checked', true); //所有商品按钮也被选中 
									if ($(".controlAll").length == $(".controlAll:checked").length) { //如果全选被选中 
										$(".AllCheck").prop('checked', true); //合计按钮被选中
										TotalPrice();
									} else {
										$(".AllCheck").prop('checked', false); //else合计按钮不被选中
										TotalPrice();
									}
								} else { //如果全选按钮不被选中
									$(".goods-check").prop('checked', false); //所有商品也不被全选
									$(".AllCheck").prop('checked', false); //合计按钮也不被选中
									TotalPrice();
								}
							});

			$(".goods-check")
					.click(
							function() {
								var goods = $(".goods-check"); //获取所有商品
								var goodsC = $(".goods-check:checked"); //获取所有被选中的商品
								var Shops = $(".controlAll"); //获取全选按钮

								if (goods.length == goodsC.length) { //如果选中的商品等于所有商品
									Shops.prop('checked', true); //全选按钮被选中
									if ($(".controlAll").length == $(".controlAll:checked").length) { //如果全选按钮被选中
										$(".AllCheck").prop('checked', true); //全选按钮被选中
										TotalPrice();
									} else {
										$(".AllCheck").prop('checked', false); //else全选按钮不被选中 
										TotalPrice();
									}
								} else { //如果选中的商品不等于所有商品
									Shops.prop('checked', false); // 全选按钮不被选中
									$(".AllCheck").prop('checked', true); //全选按钮也不被选中
									TotalPrice();
									// 计算
								}
								if (goodsC.length == 0) {
									$(".AllCheck").prop('checked', false);
								}
							});
			$(".AllCheck").click(function() {
				if ($(this).prop("checked") == true) { //如果全选按钮被选中
					$(".goods-check").prop('checked', true); //所有按钮都被选中
					$(".controlAll").prop('checked', true);
					TotalPrice();
				} else {
					$(".goods-check").prop('checked', false); //else所有按钮不全选
					$(".controlAll").prop('checked', false);
					TotalPrice();
				}
			});
			function TotalPrice() {
				var aprice = 0; //总价
				$(".one-shop").each(
						function() { //循环每个
							$(this).find(".goods-check").each(
									function() { //循环div里面的商品

										if ($(this).is(":checked")) { //如果该商品被选中  
											var price = parseFloat($(this)
													.parents(".one-goods")
													.find("#price").text()); //得到商品的单价
											aprice += price; //计算总价

										}
									});
						});
				$("#Allprice").text(aprice.toFixed(2)); //输出全部总价
			}
		</script>
</body>
</html>