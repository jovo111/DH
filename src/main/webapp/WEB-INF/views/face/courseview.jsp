<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en-US">

<head>
<meta charset="UTF-8">
<meta name="Generator" content="EditPlus®">
<meta name="Author" content="">
<meta name="Keywords" content="">
<meta name="Description" content="">
<title>Document</title>

<link href="${pageContext.request.contextPath}/css/bootstraps.min.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/studetail-style.css" media="screen"
	type="text/css" />
<link href="${pageContext.request.contextPath}/css/video-js.css" rel="stylesheet">


<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/jquery.slimscroll.min.js"></script>
<script src="${pageContext.request.contextPath}/js/videojs-ie8.min.js"></script>

<style>
.list-group-item {
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

.vjs-poster {
	background: url(${pageContext.request.contextPath}/image/face/coursebg.png) center center no-repeat !important;
	height: 100% !important;
	width: 100% !important;
	overflow: hidden !important;
	background-size: cover !important;
}

.vjs-big-play-button {
	position: relative !important;
	top: 46% !important;
	left: 46% !important;
}

.btn-group button {
	border: none;
	background: #f5f5f5;
	border-radius: 0px
}

.task font {
	font-size: 12px;
	display: inline-block;
}

.task p {
	overflow: hidden;
	text-overflow: ellipsis;
	display: -webkit-box;
	-webkit-line-clamp: 1;
	-webkit-box-orient: vertical;
	height: 15px;
	width: 200px;
	color: #9e9e9e;
	font-size: 13px;
}

.coursename {
	overflow: hidden;
	text-overflow: ellipsis;
	display: -webkit-box;
	-webkit-line-clamp: 2;
	-webkit-box-orient: vertical;
	height: 55px;
	color: #161616;
	font-size: 21px;
}

.wrap {
	display: -webkit-box;
	-webkit-box-orient: horizontal;
}

.child {
	height: 22px;
	font-size: 17px;
	-webkit-box-align: center;
}

.taskid {
	-webkit-box-flex: 2
}

.taskname {
	-webkit-box-flex: 5;
}

.player {
	-webkit-box-flex: 1;
}

.media-object {
	width: 35px;
	border-radius: 50%
}

.sname {
	overflow: hidden;
	text-overflow: ellipsis;
	display: -webkit-box;
	-webkit-line-clamp: 1;
	-webkit-box-orient: vertical;
	height: 15px;
	width: 110px;
	color: #161616;
	font-size: 14px;
}

.content {
	overflow: hidden;
	text-overflow: ellipsis;
	display: -webkit-box;
	-webkit-line-clamp: 4;
	-webkit-box-orient: vertical;
	max-height: 75px;
	color: #666;
	font-size: 14px;
}

.media {
	border-bottom: 1px solid #ddd
}

.video-dimensions {
	width: 100% !important;
	height: 91vh !important;
}
</style>
</head>

<body style="background: #eee;">
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-9" style="margin-top: 20px;">
				<div class="panel panel-default" style="height: 95vh;">
					<div class="panel-body">
						<video id="video" class="video-js vjs-default-skin" width="100%"
							height="100%" controls preload="auto" poster="" data-setup="{}">
						<source src="${pageContext.request.contextPath }/video/${task.getVideopath()}" type="video/mp4"> <source
							src="http://vjs.zencdn.net/v/oceans.webm" type="video/webm">
						<source src="http://vjs.zencdn.net/v/oceans.ogv" type="video/ogg">
						<!-- Tracks need an ending tag thanks to IE9 -->
						<p class="vjs-no-js">
							To view this video please enable JavaScript, and consider
							upgrading to a web browser that <a
								href="http://videojs.com/html5-video-support/" target="_blank">supports
								HTML5 video</a>
						</p></video>
					</div>
				</div>
			</div>
			<div class="col-lg-3" style="padding-right: 0px; height: 100%">
				<div class="panel panel-default" style="height: 100vh; margin: 0px">
					<div class="panel-heading" style="background: #abadb0">
						<div class="row">
							<div class="col-md-7">
								<p class="coursename">${course.cname }</p>
								<h5>讲师：${course.getTeacherdetail().getTname() }</h5>
							</div>
							<div class="col-md-5">
								<img src="${pageContext.request.contextPath}/image/face/6.jpg" class="img-rounded" style="height: 100px"
									alt="">
							</div>
						</div>
					</div>
					<div class="panel-body" style="padding: 0px; background: #d2d5da">
						<div class="btn-group btn-group-justified" role="group"
							aria-label="...">
							<div class="btn-group" role="group">
								<button type="button" class="btn btn-default" href="#discuss"
									data-toggle="tab">
									<span class="glyphicon glyphicon-comment"></span> 讨论
								</button>
							</div>
							<div class="btn-group" role="group">
								<button type="button" class="btn btn-default" href="#task"
									data-toggle="tab">
									<span class="glyphicon glyphicon-list"></span> 课时
								</button>
							</div>
						</div>
					</div>
					<div class="panel-footer" style="padding: 0px; background: #f5f7fa">
						<div id="myTabContent" class="tab-content">
							<div class="tab-pane fade in active" id="discuss"
								style="padding: 15px;">
								<c:forEach items="${discuss}" var="dis" >
									<div class="media">
										<div class="media-left">
											<a href="#"> <img class="media-object" src="${pageContext.request.contextPath}/image/face/6.jpg"
												alt="...">
											</a>
										</div>
										<div class="media-body">
											<p class="media-heading sname">${dis.studentdetail.snick }</p>
											<font>${dis.discussinfo.distime }</font>
										</div>
										<p class="content">${dis.discussinfo.discuss }</p>
									</div>
								</c:forEach>
							</div>
							<div class="tab-pane fade" id="task">
								<ul class="list-group">
									<c:forEach items="${tasks}" var="task" >
										<li class="list-group-item task" >
											<a href="${pageContext.request.contextPath }/courseView?cid=${ course.cid}&taskid=${task.task.taskid}">
												<div class="wrap">
													<div class="child taskid">
														<font>课时 </font>
													</div>
													<div class="child taskname">
														<p>${task.task.task }</p>
													</div>
													<div class="child player">
														<span class="glyphicon glyphicon-play-circle"></span>
													</div>
												</div>
											</a>
										</li>
									</c:forEach>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="${pageContext.request.contextPath}/js/video.js"></script>

	<script type="text/javascript">
		$(function() {
			$("#myTabContent").slimScroll({
				color : 'rgb(0, 0, 0)',
				size : '7px',
				height : '815px',
			});
		});
	</script>
</body>

</html>