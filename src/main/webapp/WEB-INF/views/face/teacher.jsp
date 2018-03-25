<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
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
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/searchform.js"></script>
<script>
	
</script>

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

.navbar  .navbar-nav>li>a:visited {
	color: #cdcccc;
}

.info {
	overflow: hidden;
	text-overflow: ellipsis;
	display: -webkit-box;
	-webkit-line-clamp: 2;
	-webkit-box-orient: vertical;
	height: 40px;
	width: 500px;
	color: #ddd;
}

.link {
	padding: 10px 0px;
	margin: 0px 25px;
	font-size: 18px;
}

.course {
	width: 210px;
	height: 258px;
	float: left;
	margin: 20px 20px 20px 0px;
	background: #fff;
	border: 1px solid #ddd;
	box-shadow: 0px 1px 5px #bbb
}

.course div {
	border: #fff solid 1px;
	overflow: hidden;
}

.course div img {
	width: 206px;
	height: 142px;
	padding: 2px;
	cursor: pointer;
	transition: all 0.5s;
}

.course img:hover {
	transform: scale(1.2);
}

.course a {
	color: #565656;
	text-decoration: none;
}

.course a span font {
	font-size: 17px;
}

.course a span {
	display: inline-block;
	width: 100px;
	height: 26px;
	color: #5bc0de;
	padding: 2px 14px;
	border-top: 1px solid #ddd;
}

.pagination li a {
	margin-left: 5px
}

.pagination li a:hover, .pagination>li>span:hover, .pagination>li>a:focus,
	.pagination>li>span:focus {
	color: #fff;
	background-color: #5cb85c;
	border-color: #ddd;
}

.coursename{
	font-size:22px
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
							<a href="javascript:void(0);"><p class="welcome">Hello, <shiro:principal
									property="stunick" /></p></a>
						</shiro:hasRole></li>
					<li style="margin: -9px"><a href="#"><img
							src="${pageContext.request.contextPath}/image/6.jpg" alt="..."
							class="img-circle" style='width: 38px;'></a></li>
				</ul>
			</div>
		</div>
	</div>
	<!-- /.container-fluid --> </nav>
	<div
		style="background: url(${pageContext.request.contextPath}/image/face/bg1.png) center center no-repeat; width:100%;height:220px">
		<div class="container" style="padding: 50px 0px">
			<div class="text-cneter" style="float: left">
				<img src="${pageContext.request.contextPath}/image/6.jpg" alt="..."
					class="img-thumbnail" style="border-radius: 50%; width: 120px">
			</div>
			<div style="float: left; padding: 0px 30px; color: #fff">
				<h3>${teacher.tname}</h3>
				<h5>${teacher.tsource }</h5>
				<p class="info">${teacher.tinfo }</p>
			</div>
		</div>
	</div>
	<div style="background: #f6f6f6">
		<div class="container"
			style="background: #fff; box-shadow: 0px 1px 15px #bbb">
			<div class="row" style="border-bottom: 1px solid #ddd">
				<button type="button" class="btn btn-link link"
					style="text-decoration: none; outline: none; color: #797979; border-bottom: 4px solid #5cb85c"
					href="#tasklist" data-toggle="tab">在教的课程</button>
			</div>
			<div class="row" style="height: 600px; padding: 0px 20px;margin-right: -35px;" id="fenye">

			</div>
			<div class="row" style="float: right; padding: 0px 20px"
				id="page_nav_area">
				<nav aria-label="Page navigation">
				<ul class="pagination">
					<li><a href="#" aria-label="Previous"> <span
							aria-hidden="true">&laquo;</span>
					</a></li>
					<li><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#" aria-label="Next"> <span
							aria-hidden="true">&raquo;</span>
					</a></li>
				</ul>
				</nav>
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

	<script type="text/javascript" defer="defer">
		$(function() {
			to_Page(1, "${param.tid}");
		});

		function to_Page(pn, tid) {
			$.ajax({
				url : "${pageContext.request.contextPath}/tfenye",
				data : "pn=" + pn + " + &tid=${param.tid}",
				type : "POST",
				success : function(result) {
					console.log(result);
					build_table(result);
					build_page_nav(result);

				}
			});
		}
		function build_table(result) {
			$("#fenye").empty();
			var users = result.extend.pageInfo.list;
			$.each(users, function(index, item) {
				
				
				var img = $("<img>").attr("src",
						"${pageContext.request.contextPath}/image/6.jpg");
				var a = $("<a>").attr("href", "${pageContext.request.contextPath}/courseInfo?cid="+item.cid).append(img);
				var odiv = $("<div>").append(a);

				var ta = $("<a>").addClass("coursename").attr("href", "#")
						.append(item.cname).append("<br>");
				var sa = $("<a>").css("color", "#999").attr("href", "#")
						.append(
								$("<h6>").append(
										item.teacherDetail.tname));
				var tdiv = $("<div>").css({
					"padding" : "0px 6px",
					"height" : "80px"
				}).append(ta, sa);

				var font = $("<font>").addClass("cprice").append(item.cprice);
				var span = $("<span>").addClass("glyphicon glyphicon-yen").css(
						{
							"border-right" : "1px solid #ddd",
							"color" : "#e88282"
						}).append(" ",font);
				var font1 = $("<font>").addClass("cprice")
						.append(item.stucount);
				var span1 = $("<span>").addClass("glyphicon glyphicon-user")
						.append(" ",font1);

				var fa = $("<a>").attr("href", "#").append(span, span1);
				var url=$("<a></a>").attr("href",
						"${pageContext.request.contextPath}/courseInfo?cid="+item.cid).append(odiv, tdiv,
								fa);
				var course = $("<div>").addClass("course").append(url).appendTo("#fenye");

			});
		}

		function build_page_nav(result) {

			$("#page_nav_area").addClass("row").css("padding", "20px 14px")
					.empty();
			var nav = $("<nav>").css("float", "right").attr("aria-label",
					"Page navigation");
			var ul = $("<ul></ul>").addClass("pagination");
			//<li class="previous"><a href="#"><span aria-hidden="true">&larr;</span> Older</a></li>
			var orderPageLi = $("<li></li>").addClass("active").append(
					$("<a></a>").append(
							$("<span></span>").attr("aria-hidden", "true"))
							.append("上一页").attr("href", "#")).attr(
					"aria-label", "Previous");

			var newerPageLi = $("<li></li>").append(
					$("<a></a>").append(
							$("<span></span>").attr("aria-hidden", "true")
									.append("下一页")).attr("href", "#"))
					.addClass("next");

			if (result.extend.pageInfo.hasPreviousPage == false) {
				orderPageLi.addClass("disabled");
			} else {
				orderPageLi.click(function() {
					to_Page(result.extend.pageInfo.pageNum - 1, "");
				});
			}

			if (result.extend.pageInfo.hasNextPage == false) {
				newerPageLi.addClass("disabled");
			} else {
				newerPageLi.click(function() {
					to_Page(result.extend.pageInfo.pageNum + 1, "");
				});
			}

			ul.append(orderPageLi);

			$.each(result.extend.pageInfo.navigatepageNums, function(index,
					item) {
				var num = $("<li></li>").append($("<a></a>").append(item));
				ul.append(num);
				if (result.extend.pageInfo.pageNum == item) {
					num.addClass("active");
				}
				num.click(function() {
					to_Page(item, "");
				});
			});

			ul.append(newerPageLi);

			ul.appendTo("#page_nav_area");
			nav.append(ul);
			$("#page_nav_area").append(nav);
		}
	</script>
</body>
</html>