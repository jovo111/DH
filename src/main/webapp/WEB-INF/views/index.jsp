<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>


<html>
<head>

<meta charset="utf-8" />

<title>Metronic | Admin Dashboard Template</title>

<meta content="width=device-width, initial-scale=1.0" name="viewport" />

<meta content="" name="description" />

<meta content="" name="author" />


<link href="${pageContext.request.contextPath}/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />

<!-- 响应式布局 -->
<link
	href="${pageContext.request.contextPath}/css/bootstrap-responsive.min.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/style-responsive.css"
	rel="stylesheet" type="text/css" />
<!-- 下拉菜单后面的图标 -->
<link href="${pageContext.request.contextPath}/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />

<link href="${pageContext.request.contextPath}/css/style-metro.css"
	rel="stylesheet" type="text/css" />

<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet" type="text/css" />



<!-- 背景色 -->
<link href="${pageContext.request.contextPath}/css/default.css"
	rel="stylesheet" type="text/css" id="style_color" />



<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/image/favicon.ico" />
<!-- iframe高度随侧边框的高度而变化 -->
<script type="text/javascript">
	function reinitIframe() {
		try {
			var b = document.getElementById("i_left").offsetHeight + 60;
			// alert(b.offsetHeight);
			var iframe = document.getElementById("iframepage");
			var bHeight = iframe.contentWindow.document.body.scrollHeight;
			var dHeight = iframe.contentWindow.document.documentElement.scrollHeight;

			var height = Math.max(bHeight, dHeight);
			if (height >= b)
				iframe.height = height;
			else
				iframe.height = b;
		} catch (ex) {
		}
	}
	var timer1 = window.setInterval("reinitIframe()", 200); //定时调用开始
</script>
</head>

<body class="page-header-fixed">

	<!-- BEGIN HEADER -->

	<div class="header navbar navbar-inverse navbar-fixed-top">

		<!-- BEGIN TOP NAVIGATION BAR -->

		<div class="navbar-inner">

			<div class="container-fluid">

				<!-- BEGIN LOGO -->

				<a class="brand"
					href="${pageConetxt.request.contexPath}/admin/login"> <img
					src="${pageContext.request.contextPath}/image/logo-big.png"
					alt="logo" />

				</a>

				<!-- END LOGO -->

				<a href="javascript:;" class="btn-navbar collapsed"
					data-toggle="collapse" data-target=".nav-collapse"> <img
					src="${pageContext.request.contextPath}/image/menu-toggler.png"
					alt="" />

				</a>

				<!-- END RESPONSIVE MENU TOGGLER -->

				<!-- BEGIN TOP NAVIGATION MENU -->

				<ul class="nav pull-right">
					<li class="dropdown user"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown"> <img alt=""
							src="${pageContext.request.contextPath}/image/avatar1_small.jpg" />
							<span class="username">你好：<shiro:hasRole name="admin">
									<shiro:principal property="aname" />
								</shiro:hasRole>
						</span> <i class="icon-angle-down"></i>

					</a>

						<ul class="dropdown-menu">

							<li><a href="index.html"><i class="icon-user"></i>个人详情</a></li>

							<li><a href="inbox.html"><i class="icon-envelope"></i>
									收件箱</a></li>

							<li><a href="#"><i class="icon-tasks"></i>查看任务</a></li>

							<li class="divider"></li>


							<li><a
								href="${pageContext.request.contextPath}/admin/logout"><i
									class="icon-key"></i>退出</a></li>

						</ul></li>

					<!-- END USER LOGIN DROPDOWN -->

				</ul>

				<!-- END TOP NAVIGATION MENU -->

			</div>

		</div>

		<!-- END TOP NAVIGATION BAR -->

	</div>


	<!-- BEGIN CONTAINER -->

	<div class="page-container">

		<!-- BEGIN SIDEBAR -->

		<div class="page-sidebar nav-collapse collapse" id="i_left">

			<!-- BEGIN SIDEBAR MENU -->

			<ul class="page-sidebar-menu">

				<li>
					<div class="sidebar-toggler hidden-phone"></div>

				</li>

				<li>
					<!-- BEGIN RESPONSIVE QUICK SEARCH FORM -->

					<form class="sidebar-search">

						<div class="input-box"></div>

					</form> <!-- END RESPONSIVE QUICK SEARCH FORM -->

				</li>

				<li class="start active "><a
					href="${pageContext.request.contextPath }/admin/main"
					target="iframepage"> <i class="icon-home"></i> <span
						class="title">主页</span> <span class="selected"></span>

				</a></li>

				<li class=""><a href="javascript:;"> <i class="icon-user"></i>

						<span class="title">个人信息</span> <span class="arrow "></span>

				</a>

					<ul class="sub-menu">


						<li><a
							href="${ pageContext.request.contextPath}/admin/adminProfile?aid=<shiro:principal property="aid" />"
							target="iframepage"> 查看信息</a></li>

					</ul></li>

				<li class=""><a href="javascript:;"> <i
						class="icon-file-text"></i> <span class="title">管理员信息管理</span> <span
						class="arrow "></span>

				</a>

					<ul class="sub-menu">
						<li><a href="${pageContext.request.contextPath}/admin/admin"
							target="iframepage"> 查看信息</a></li>

					</ul></li>

				<li class=""><a href="javascript:;"> <i
						class="icon-bookmark-empty"></i> <span class="title">学生信息管理</span>

						<span class="arrow "></span>

				</a>

					<ul class="sub-menu">
						<li><a
							href="${ pageContext.request.contextPath}/admin/student"
							target="iframepage"> 查看信息</a></li>

					</ul></li>

				<li class=""><a href="javascript:;"> <i class="icon-table"></i>

						<span class="title">教师信息管理</span> <span class="arrow "></span>

				</a>

					<ul class="sub-menu">

						<li><a
							href="${ pageContext.request.contextPath}/admin/teacher"
							target="iframepage"> 查看信息</a></li>

					</ul></li>


				<li class=""><a href="javascript:;"> <i class="icon-gift"></i>

						<span class="title">课堂信息管理</span> <span class="arrow "></span>

				</a>

					<ul class="sub-menu">

						<li><a href="${pageContext.request.contextPath}/admin/course"
							target="iframepage"> 查看信息</a></li>


					</ul></li>

				<li><a class="active" href="javascript:;"> <i
						class="icon-sitemap"></i> <span class="title">课堂类型管理</span> <span
						class="arrow "></span>

				</a>

					<ul class="sub-menu">

						<li><a
							href="${pageContext.request.contextPath}/admin/courseType"
							target="iframepage"> 查看信息</a></li>


					</ul></li>

				<li class=""><a href="javascript:;"> <i class="icon-gift"></i>

						<span class="title">订单信息管理</span> <span class="arrow "></span>

				</a>

					<ul class="sub-menu">

						<li><a href="${pageContext.request.contextPath}/admin/order"
							target="iframepage"> 查看信息</a></li>


					</ul></li>

				<li class=""><a href="javascript:;"> <i class="icon-user"></i>

						<span class="title">课堂课时管理</span> <span class="arrow "></span>

				</a>

					<ul class="sub-menu">
						<c:forEach items="${courseType}" var="item">
							<li><a
								href="${pageContext.request.contextPath}/admin/task?typeid=${item.typeid}"
								target="iframepage"> ${item.typename} </a></li>
						</c:forEach>



					</ul></li>

				<li class=""><a href="javascript:;"> <i class="icon-th"></i>

						<span class="title">公告信息管理</span> <span class="arrow "></span>

				</a>

					<ul class="sub-menu">




						<li><a
							href="${pageContext.request.contextPath }/admin/bulletin"
							target="iframepage"> 查看信息</a></li>

					</ul></li>

			</ul>

		</div>
		<!-- 右边内容 -->

		<div class="page-content">

			<!-- BEGIN SAMPLE PORTLET CONFIGURATION MODAL FORM-->
			<iframe id="iframepage" name="iframepage"
				src="${pageContext.request.contextPath }/admin/main" width="100%"
				height="200px" frameborder="0" scrolling="no" style="border: 0px;"></iframe>

			</iframe>
			<!-- END PAGE CONTAINER-->

		</div>

		<!-- END PAGE -->

	</div>

	<!-- END CONTAINER -->

	<!-- BEGIN FOOTER -->

	<div class="footer">

		<div class="footer-inner">Copyright &copy;2017 Drophorse. All
			Rights Reserved.</div>

		<div class="footer-tools">

			<span class="go-top"> <i class="icon-angle-up"></i>

			</span>

		</div>

	</div>
	<!-- 点击事件（下拉菜单，侧边框收缩） -->
	<script
		src="${pageContext.request.contextPath}/js/jquery-1.10.1.min.js"
		type="text/javascript"></script>

	<!-- 登录用户下拉菜单事件 -->
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"
		type="text/javascript"></script>


	<script src="${pageContext.request.contextPath}/js/app.js"
		type="text/javascript"></script>

	<script src="${pageContext.request.contextPath}/js/index.js"
		type="text/javascript"></script>

	<!-- END PAGE LEVEL SCRIPTS -->

	<script>
		$(function() {

			App.init(); //初始化布局和核心插件 
			$.ajaxSetup({
			    complete:function(XMLHttpRequest,textStatus){
			          if(textStatus=="parsererror"){
			               $.messager.alert('提示信息', "登陆超时！请重新登陆！", 'info',function(){
			                   window.location.href = 'login';
			               });
			          } else if(textStatus=="error"){
			              $.messager.alert('提示信息', "请求超时！请稍后再试！", 'info');
			          }
			    }
			})
		});
		
	</script>

	<!-- END JAVASCRIPTS -->

</body>

<!-- END BODY -->

</html>