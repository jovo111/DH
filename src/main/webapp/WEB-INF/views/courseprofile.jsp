<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="Generator" content="EditPlus®">
<meta name="Author" content="">
<meta name="Keywords" content="">
<meta name="Description" content="">
<link href="${pageContext.request.contextPath}/css/bootstraps.min.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/jquery.slimscroll.min.js"></script>
<script src="${pageContext.request.contextPath}/js/Chart.js"></script>

<style>
.list-group-item {
	border: none;
	background: #f3f3f4;
	color: #717070;
	padding: 6px 15px;
}

.timeline-item .date {
	font-size: 30px;
	text-align: right;
	width: 105px;
	position: relative;
}

.timeline-item .content {
	font-size: 20px;
	color: #5e6163;
	border-left: 8px solid #e7eaec;
	border-bottom: 1px solid #e7eaec;
	padding-top: 10px;
	min-height: 60px;
}

.timeline-item .content:hover {
	border-left: 8px solid #c8cacc;
	background: #5ad2bc;
}

.timeline-item .date span {
	position: absolute;
	top: 0;
	right: 0;
	padding: 5px;
	width: 80px;
	text-align: center;
	border-bottom: 1px solid #e7eaec;
}

.font h4 {
	color: #4488dc;
}

.font h5 {
	color: #a2a2a2;
}

#p1 {
	overflow: hidden;
	text-overflow: ellipsis;
	display: -webkit-box;
	-webkit-line-clamp: 3;
	-webkit-box-orient: vertical;
	height: 36px;
	color: #9e9e9e;
}

.title {
	background: #f3f3f4;
}

.text {
	border-bottom: 2px solid #8ad7c6;
}
</style>

<script type="text/javascript">
    $(document).ready(function() {

      var lineData = {
        labels: ["一月", "二月", "三月", "四月", "五月", "六月", "七月","八月", "九月", "十月", "十一月", "十二月"],
        datasets: [
        {
          label: "增加人数",
          backgroundColor: "rgba(26,179,148,0.5)",
          borderColor: "rgba(26,179,148,0.7)",
          pointBackgroundColor: "rgba(26,179,148,1)",
          pointBorderColor: "#fff",
          data: [28, 48, 40, 19, 86, 0, 90,120,300,400,500,600]
        }
        ]};



        var lineOptions = {
          responsive: true
        };

        var ctx = document.getElementById("myChart").getContext("2d");
        new Chart(ctx, {type: 'line', data: lineData, options:lineOptions});
      });

    $(function(){
      $(".scroll1").slimScroll({
        color: 'rgb(0, 0, 0)',
        size: '7px',
        height: '580px',
      });
      $(".scroll2").slimScroll({
        color: 'rgb(0, 0, 0)',
        size: '7px',
        height: '680px',
      });
    }); 
  </script>

<title>Document</title>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<h2>
					课堂档案表&nbsp;<small>课堂档案表</small>
				</h2>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<ol class="breadcrumb">
					<li><a href="#">Home</a></li>
					<li class="active">CourseProfile</li>
				</ol>
			</div>
		</div>


		<div class="row" style="background: #f3f3f4">
			<div class="col-md-2">
				<div style="padding: 16px 55px">
					<img src="${pageContext.request.contextPath}/image/1.jpg"
						style="border-radius: 50%; width: 160px; max-width: none"
						class="img-thumbnail">
				</div>
			</div>
			<div class="col-md-3 col-md-offset-1">
				<ul class="list-group">
					<li class="list-group-item"><h3><c:out value="${course.getCname() }"></c:out></h3></li>
					<li class="list-group-item">${course.getTid() }</li>
					<li class="list-group-item"><p id="p1" style="height: 60px;">${course.getCinfo() }</p></li>
				</ul>
			</div>

			<div class="col-md-3 col-md-offset-2" style="padding: 30px 0">
				<table class="table small">
					<tbody>
						<tr>
							<td><strong><font style="vertical-align: inherit;"><font
										style="vertical-align: inherit;">${sCount } </font></font></strong><font
								style="vertical-align: inherit;"><font
									style="vertical-align: inherit;">学生 </font></font></td>
							<td><strong><font style="vertical-align: inherit;"><font
										style="vertical-align: inherit;">${tCount }</font></font></strong><font
								style="vertical-align: inherit;"><font
									style="vertical-align: inherit;">章节 </font></font></td>
						</tr>
						<tr>
							<td><strong><font style="vertical-align: inherit;"><font
										style="vertical-align: inherit;">${dCount } </font></font></strong><font
								style="vertical-align: inherit;"><font
									style="vertical-align: inherit;">评论 </font></font></td>
							<td><strong><font style="vertical-align: inherit;"><font
										style="vertical-align: inherit;">${oCount } </font></font></strong><font
								style="vertical-align: inherit;"><font
									style="vertical-align: inherit;">订单 </font></font></td>
						</tr>
						<tr>
							<td><strong><font style="vertical-align: inherit;"><font
										style="vertical-align: inherit;">${course.getCprice() } </font></font></strong><font
								style="vertical-align: inherit;"><font
									style="vertical-align: inherit;">价格 </font></font></td>
							<td><strong><font style="vertical-align: inherit;"><font
										style="vertical-align: inherit;">12 </font></font></strong><font
								style="vertical-align: inherit;"><font
									style="vertical-align: inherit;">资料 </font></font></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>

		<div class="row" style="margin-top: 20px">
			<div class="col-md-4">
				<div class="panel panel-default">
					<div class="panel-body scroll2">
					
						<c:forEach items="${discuss }" var="d" >
							<div class="discuss">
								<div class="row title">
									<div class="col-md-2">
										<img src="${pageContext.request.contextPath}/image/1.jpg" style="width: 55px; max-width: none"
											class="img-thumbnail" />
									</div>
									<div class="col-md-10 font">
										<h4>${d.student.studentDetail.snick }</h4>
										<h5>${d.distime }</h5>
									</div>
								</div>
								<div class="row text">
									<div class="col-md-12">
										<p id="p1" style="-webkit-line-clamp: 2;">
											${d.discuss }
										</p>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="panel panel-default  scroll2">
					<div class="panel-heading">
						<div class="chart">
							<canvas id="myChart" height="300px"
								style="display: block; width: 1373px; height: 290px;"
								width="1373"></canvas>
						</div>

					</div>
					<div class="panel-body">
						<table class="table">
							<tbody>
								<c:forEach items="${order }" var="o" >
									<tr>
										<td><img src="${pageContext.request.contextPath}/image/1.jpg" style="width: 50px" /></td>
										<td>${o.student.snum}</td>
										<td>${o.student.studentDetail.snick}</td>
										<td>
											<c:choose>
												<c:when test="${o.isbuy == 1 }">
													<span class="label label-success">已购买</span>
												</c:when>
												<c:otherwise>
										            <span class="label label-warning">未购买</span>
										        </c:otherwise>
											</c:choose>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="panel panel-default"
					style="border-radius: 0px; border-left: 0; border-right: 0;">
					<div class="panel-heading"
						style="background: #ffffff; color: #828282">
						<strong>章节列表</strong>
					</div>
					<div class="panel-body">
						<div class="timeline-item scroll1">
							
							<c:forEach items="${task }" var="t" >
								<div class="row">
									<div class="col-xs-2 date">
										<span class="glyphicon glyphicon-play-circle"
											style="color: #8AD7C6"></span>
									</div>
									<div class="col-xs-8 content no-top-border"
										style="border-top: none">
										<p class="m-b-xs">
											<strong> <font style="vertical-align: inherit;">
													<font style="vertical-align: inherit;"><span
														class="glyphicon glyphicon-pushpin"></span> ${t.task }</font>
											</font>
											</strong> <font style="float: right; color: #afa7a7; font-size: 15px"><i>
													一小时</i></font>
										</p>
									</div>
								</div>
							</c:forEach>
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>