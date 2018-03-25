<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

<script>
	$(function() {
		$(".scroll1").slimScroll({
			color : 'rgb(0, 0, 0)',
			size : '7px',
			height : '410px',
		});
	});
</script>

<style type="text/css">
.image img {
	vertical-align: middle;
	width: 80px;
}

.image {
	color: #a29292;
	text-align: center;
	background: #f5f5f5;
	padding: 25px 0;
	margin: 10px;
}

.order {
	margin-top: 20px;
}

.mycourse {
	text-align: middle;
}

.mycourse tr td img {
	width: 60px;
}

.progress {
	width: 110px;
}
</style>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<h2>
					学生档案&nbsp;<small>学生档案</small>
				</h2>
			</div>
		</div>

		<div class="row">
			<div class="col-md-12">
				<ol class="breadcrumb">
					<li><a href="#">Home</a></li>
					<li class="active">StudentProfile</li>
				</ol>
			</div>
		</div>

		<div class="row">
			<div class="col-md-8">
				<div class="panel panel-default">
					<div class="panel-heading">
						<span class="glyphicon glyphicon-blackboard"></span> 我的学习
					</div>
					<div class="panel-body">
						<table class="table">
							<thead>
								<tr>
									<td>课堂图片</td>
									<td>课堂名称</td>
									<td>讲师名称</td>
									<td>教育机构</td>
									<td>课堂类型</td>
									<td>价格</td>
									<td>学习进度</td>
									<td>开始时间</td>
								</tr>
							</thead>
							<tbody class="mycourse">

								<c:forEach items="${mycourseAll }" var="my">
									<tr>
										<td><img
											src="${pageContext.request.contextPath}/image/1.jpg"
											alt="..." class="img-rounded"></td>
										<td>${my.course.cname }</td>
										<td>${my.course.teacherDetail.tname }</td>
										<td>${my.course.cinfo }</td>
										<td>${my.course.courseType.typename }</td>
										<td><span class="label label-primary">免费</span></td>
										<td><div class="progress">
												<div class="progress-bar progress-bar-warning"
													role="progressbar" aria-valuenow="60" aria-valuemin="0"
													aria-valuemax="100" style="width: ${my.progress*100 }%">
													<span class="sr-only">60% Complete (warning)</span>
												</div>
											</div></td>
										<td>${my.begin }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="row">
					<div class="col-md-12">
						<div class="panel panel-default">
							<div class="panel-body" style="padding: 0">
								<img alt="image" style="width: 100%; height: 400px"
									class="img-responsive"
									src="${pageContext.request.contextPath}/image/1.jpg">
							</div>
							<div class="panel-footer">
								<div class="content">
									<p>
									<h3>${student.studentDetail.snick }</h3>
									</p>
									<p>
									<h5 style="color: #b7b7b7">
										<span class="glyphicon glyphicon-user"
											style="background: #ff2f00; padding: 12px 20px; border-left: 6px solid #000000;">
											${student.snum }</span> <span class="glyphicon glyphicon-yen"
											style="float: right; background: #000000; padding: 12px 20px; border-left: 6px solid #ff0000;">
											${student.studentDetail.sbalance }</span>
									</h5>
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="panel panel-default" style="border: none">
							<div class="panel-heading" style="background: #ffffff;">订购的课程</div>
							<div class="panel-body scroll1">
								<div class="row">
									<c:forEach items="${orderAll }" var="order">
										<div class="col-md-6">
											<div class="image">
												<img src="${pageContext.request.contextPath}/image/1.jpg"
													alt="..." class="img-circle">
												<h5>${order.course.teacherDetail.tname }</h5>
												<h4>${order.course.cname }</h4>
											</div>
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
</body>
</html>