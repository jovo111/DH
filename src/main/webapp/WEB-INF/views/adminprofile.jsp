<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.Date,java.text.SimpleDateFormat"%>
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
<link href="${pageContext.request.contextPath}/css/fullcalendar.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/css/fullcalendar.print.min.css"
	rel="stylesheet" media="print">

<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.js"
	type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/js/jquery.slimscroll.min.js"></script>
<script src="${pageContext.request.contextPath}/js/moment.min.js"></script>
<script src="${pageContext.request.contextPath}/js/fullcalendar.min.js"></script>
<script src="${pageContext.request.contextPath}/js/locale-all.js"></script>

<script>
	$(document).ready(function() {

		$('#calendar').fullCalendar({
			locale : "zh_cn",
			eventColor : '#378006',
			events: function(start,end,timezone, callback) {
		        $.ajax({
		            url: '${pageContext.request.contextPath}/admin/bulletins',
		            type: 'POST',
		            data: "",
		            success: function(result) {
		            	var info=result.extend.bulletins;
		            	console.log(result);
		                var events = [];
		                $.each(info,function(index, item) {
		                      events.push({
		                      id:item.bulletinid,
		                      aid:item.admin.aid,
		                      title: item.admin.aname+" "+item.title,
		                      content:item.content,
		                      start: item.releaseBegin,
		                      end:item.releaseEnd== null ? item.releaseBegin : item.releaseEnd
		                     });
		                });
		                callback(events);
		            }
		        });
		    }
		});

		$(".scroll1").slimScroll({
			color : 'rgb(0, 0, 0)',
			size : '7px',
			height : '750px',
		});
		$(".scroll2").slimScroll({
			color : 'rgb(0, 0, 0)',
			size : '7px',
			height : '550px',
		});
		$(".scroll3").slimScroll({
			color : 'rgb(0, 0, 0)',
			size : '7px',
			height : '220px',
		});
	});
</script>

<style type="text/css">
#calendar {
	background: #00000040;
}

.detail {
	text-align: center;
	color: #ffffff;
}

.detail img {
	border-radius: 50%;
}

.list-group-item {
	border: none;
}

.content {
	color: #b5b5b5;
	border-bottom: 1px solid #bb838d
}

.content h4 {
	color: #777777;
}

#p1 {
	overflow: hidden;
	text-overflow: ellipsis;
	display: -webkit-box;
	-webkit-line-clamp: 2;
	-webkit-box-orient: vertical;
	height: 36px;
	color: #9e9e9e;
}

.media-object {
	width: 80px;
}

.title {
	color: #1a90b3;
}

.image img {
	min-width: 60px;
	width: 90px;
}
</style>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<h2>
					管理员档案&nbsp;<small>管理员档案</small>
				</h2>
			</div>
		</div>

		<div class="row">
			<div class="col-md-12">
				<ol class="breadcrumb">
					<li><a href="#">Home</a></li>
					<li class="active">TaskInfo</li>
				</ol>
			</div>
		</div>


		<div class="row">
			<div class="col-md-4">
				<div class="panel panel-default">
					<div class="panel-body" style="background: #1ab394">
						<div class="detail">
							<h2>${admin.aname }</h2>
							<h5>普通管理员</h5>
							<img src="${pageContext.request.contextPath}/image/1.jpg"
								alt="..." class="img-thumbnail">
							<p>
								<font style="border-right: 3px solid #ffffff">${bulletins.size()}
									公告 </font>&nbsp;<font>20 编辑</font>
							</p>
						</div>
					</div>
					<div class="panel-footer scroll2" style="padding: 0">
						<ul class="list-group">
							<c:forEach items="${bulletins}" var="bull">
								<li class="list-group-item">
									<div class="content">
										<p>
										<h4>
											<c:out value="${bull.title}" />
										</h4>
										<%
											request.setAttribute("date", new Date());
										%>
										<c:choose>
											<c:when test="${bull.releaseBegin}">
												<span class="label label-success" style="float: right">未开始</span>
											</c:when>
											<c:when test="${bull.releaseEnd}">
												<span class="label label-default" style="float: right">已失效</span>
											</c:when>
											<c:otherwise>
												<span class="label label-primary" style="float: right">进行中</span>
											</c:otherwise>
										</c:choose>
										</p>


										<p id="p1">
											<c:out value="${bull.title}" />
										</p>
									</div>
								</li>

							</c:forEach>

						</ul>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="row" style="margin-bottom: 20px">
					<div class="col-md-6 text-right">
						<div class="education"
							style="border-radius: 15px; background: #1ab394; color: #ffffff; padding: 1px 15px">
							<h2>
								<span class="glyphicon glyphicon-education" style="float: left"></span>400
							</h2>
						</div>
					</div>
					<div class="col-md-6 text-right">
						<div class="education"
							style="border-radius: 15px; background: #1ab394; color: #ffffff; padding: 1px 15px">
							<h2>
								<span class="glyphicon glyphicon-blackboard" style="float: left"></span>400
							</h2>
						</div>
					</div>
				</div>
				<h4 style="border-bottom: 2px solid #b8b8b8;">待审核课堂</h4>
				<div class="course  scroll1" style="border: 1px solid #ddd;">
					<c:forEach items="${auditCoures}" var="tau">
						<div class="row">
							<div class="col-md-12">
								<div class="media">
									<div class="media-left">
										<a href="#"> <img class="media-object"
											src="${pageContext.request.contextPath}${tau.cphoto}"
											alt="...">
										</a>
									</div>
									<div class="media-body">
										<p>
										<h4>${tau.cname}</h4>
										</p>
										<p class="title">
											<font><span class="glyphicon glyphicon-user"></span>
												${tau.teacherDetail.tname}</font> <font><span
												class="glyphicon glyphicon-education"></span>
												${tau.teacherDetail.tsource}</font> <font><span
												class="glyphicon glyphicon-yen"></span> ${tau.cprice }</font>
											<font><span class="glyphicon glyphicon-bookmark"></span>
												23</font>
										</p>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>

				</div>
			</div>
			<div class="col-md-4">
				<div class="panel panel-default">
					<div class="panel-body">
						公告日历<a href="${pageContext.request.contextPath}/admin/bulletin"><span class="glyphicon glyphicon-plus" style="float: right"></span></a>
					</div>
					<div class="panel-footer">
						<div id="calendar"></div>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">待审核的讲师</div>
					<div class="panel-body image scroll3">
						<c:forEach items="${auditTeachers}" var="audi">
							<img
								src="${pageContext.request.contextPath}${audi.teacherDetail.tphoto}"
								alt="..." class="img-rounded">
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
