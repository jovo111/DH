<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html lang="zh_CN">
<head>
<meta charset="UTF-8">
<meta name="Generator" content="EditPlus®">
<meta name="Author" content="">
<meta name="Keywords" content="">
<meta name="Description" content="">
<link href="${pageContext.request.contextPath}/css/bootstraps.min.css"
	rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.js"
	type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"
	type="text/javascript"></script>

<title>Document</title>

<style>
.property h4 {
	color: #72848c;
	font-size: 16px;
	font-family: 'Montserrat', sans-serif !important;
}

.val h4 {
	color: #72848c;
	font-size: 16px;
	font-family: 'Montserrat', sans-serif !important;
}

.stuimage img {
	width: 50px;
	border-radius: 50%;
	margin: 10px 0px;
}

.content span {
	display: inline-block;
	width: 120px;
}

.course {
	border: 1px solid #ddd;
}

.page-header {
	margin: 20px 0 10px;
}

.ispass {
	color: #5cbbe7;
	line-height: 25px;
	font-size: 13px;
	float:right
}

.c-bottom {
	padding: 0px 10px;
	height: 100%;
	border-top: 1px solid #ddd;
	background: -webkit-linear-gradient(-45deg, #07a7e3 0%, #32dac3 100%);
}

.caption {
	height: 90px
}

.p1 {
	overflow: hidden;
	text-overflow: ellipsis;
	display: -webkit-box;
	-webkit-line-clamp: 4;
	-webkit-box-orient: vertical;
	height: 75px;
	color: #9e9e9e;
}

.cname {
	overflow: hidden;
	text-overflow: ellipsis;
	display: -webkit-box;
	-webkit-line-clamp: 1;
	-webkit-box-orient: vertical;
	height: 19px;
}

.thumbnail img {
	width: 100%;
	height: 200px;
}

.type{
	font-size: 20px;
    color: #ddd;
}
</style>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<h2>
					教师档案&nbsp;<small>教师档案</small>
				</h2>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<ol class="breadcrumb">
					<li><a href="#">Home</a></li>
					<li class="active">TeacherProfile</li>
				</ol>
			</div>
		</div>


		<div class="row">
			<div class="col-md-2">
				<div class="row">
					<div class="col-md-12 text-center">
						<div class="row">
							<div class="col-md-12">
								<div class="image" style="background: #f7f7fa; padding: 20px;">
									<img src="${pageContext.request.contextPath}/image/6.jpg"
										alt="..." class="img-thumbnail" style="border-radius: 50%">
								</div>
							</div>
						</div>
						<div class="row"
							style="margin: 0px; background: #f7f7fa; padding: 20px;">
							<div class="col-md-6 col-sm-6 property text-center">
								<h4>编号</h4>
								<span style="color: #51b7e6; font-size: 15px">${teacher.getTnum()}</span>
							</div>

							<div class="col-md-6 col-sm-6 val text-center">
								<h4>姓名</h4>
								<span style="color: #51b7e6; font-size: 15px">${teacher.teacherDetail.getTname()}</span>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div style="background: #f7f7fa; padding: 10px 20px">
							<div class="student"
								style="padding-top: 10px; border-top: 1px solid #ddd;">
								<span class="glyphicon glyphicon-user"> 学生</span>
							</div>

							<div class="stuimage"
								style="margin-top: 10px; height: 220px; overflow: hidden;">
								<c:forEach items="${students}" var="s">
									<img src="${pageContext.request.contextPath}/image/6.jpg"
										alt="..." class="img-thumbnail">
								</c:forEach>
							</div>

							<div class="more text-right"
								style="border-bottom: 1px solid #ddd; padding-bottom: 20px;">
								<a href="#">更多</a>
							</div>
						</div>
					</div>
				</div>


				<div class="row">
					<div class="col-md-12">
						<div style="background: #f7f7fa; padding: 10px 20px">
							<div class="student">
								<span class="glyphicon glyphicon-education">
									${teacher.teacherDetail.getTsource()}</span><br> <br> <span
									class="glyphicon glyphicon-info-sign"> 个人介绍</span>
							</div>
							<div class="info"
								style="padding: 10px 0px; border-bottom: 1px solid #ddd;">
								<p class="p1">${teacher.teacherDetail.getTinfo()}</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-10">
				<div class="row">
					<div class="col-md-12">
						<div class="page-header">
							<h3>课堂</h3>
						</div>
					</div>
				</div>
				<div class="row">

					<c:forEach items="${courses}" var="c">
						<div class="col-sm-3 col-md-2 col-xs-6">
							<div class="thumbnail">
								<img src="${pageContext.request.contextPath}/image/6.jpg"
									alt="...">
								<div class="caption">
									<h4><p class="cname">${c.getCname() }</p></h4>
									<span class="type"> ${c.courseType.getTypename() }</span>
									<span class="glyphicon glyphicon-info-sign ispass"
										style="border: none"> 待审核</span>
								</div>
								<div class="c-bottom">
									<h5 class="text-left" style="color: #fff;">
										<span class="glyphicon glyphicon-user" style=""> ${c.getStucount() } </span> <span
											class="glyphicon glyphicon-yen" style="float: right">
											${c.getCprice() } </span>
									</h5>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</body>
</html>