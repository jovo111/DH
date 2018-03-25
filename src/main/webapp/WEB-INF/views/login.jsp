<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="zh_CN">
<head>
<meta charset="utf-8" />

<title>Drophorse | Login Options - Login Form</title>

<meta content="width=device-width, initial-scale=1.0" name="viewport" />

<meta content="" name="description" />

<meta content="" name="author" />

<!-- BEGIN GLOBAL MANDATORY STYLES -->

<link href="${pageContext.request.contextPath}/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />

<link
	href="${pageContext.request.contextPath}/css/bootstrap-responsive.min.css"
	rel="stylesheet" type="text/css" />

<link
	href="${pageContext.request.contextPath}/css/font-awesome.css"
	rel="stylesheet" type="text/css" />

<link href="${pageContext.request.contextPath}/css/style-metro.css"
	rel="stylesheet" type="text/css" />

<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet" type="text/css" />

<link href="${pageContext.request.contextPath}/css/style-responsive.css"
	rel="stylesheet" type="text/css" />

<link href="${pageContext.request.contextPath}/css/default.css"
	rel="stylesheet" type="text/css" id="style_color" />

<link href="${pageContext.request.contextPath}/css/uniform.default.css"
	rel="stylesheet" type="text/css" />

<!-- END GLOBAL MANDATORY STYLES -->

<!-- BEGIN PAGE LEVEL STYLES -->

<link href="${pageContext.request.contextPath}/css/login-soft.css"
	rel="stylesheet" type="text/css" />

<!-- END PAGE LEVEL STYLES -->

<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/image/favicon.ico" />
	
<link href="${pageContext.request.contextPath}/css/sweetalert2.min.css"
	rel="stylesheet">

</head>

<!-- END HEAD -->

<!-- BEGIN BODY -->

<body class="login">


	<!-- BEGIN LOGO -->

	<div class="logo">

		<img src="${pageContext.request.contextPath}/image/logo-big.png"
			alt="" />

	</div>

	<!-- END LOGO -->

	<!-- BEGIN LOGIN -->

	<div class="content">

		<!-- BEGIN LOGIN FORM -->

		<form class="form-vertical login-form" method="Post" action="${pageContext.request.contextPath}/admin/login">

			<h3 class="form-title">登录</h3>

			<div class="alert alert-error hide">

				<button class="close" data-dismiss="alert"></button>

				<span>请输入你的用户名和密码</span>

			</div>

			<div class="control-group">

				<!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->

				<label class="control-label visible-ie8 visible-ie9">用户名</label>

				<div class="controls">

					<div class="input-icon left">

						<i class="icon-user"></i> <input class="m-wrap placeholder-no-fix"
							type="text" placeholder="Username" name="username" id="username"/>

					</div>

				</div>

			</div>

			<div class="control-group">

				<label class="control-label visible-ie8 visible-ie9">密码</label>

				<div class="controls">

					<div class="input-icon left">

						<i class="icon-lock"></i> <input class="m-wrap placeholder-no-fix"
							type="password" placeholder="Password" name="password" id="password"/>

					</div>

				</div>

			</div>

			<div class="form-actions">

				<label class="checkbox"> <input type="checkbox"
					name="remember" value="1" /> 记住我

				</label>

				<button type="submit" class="btn blue pull-right">

					Login <i class="m-icon-swapright m-icon-white"></i>

				</button>

			</div>

			<div class="forget-password">

				<h4>忘记密码?</h4>

				<p>

					不用担心，请点击 <a href="javascript:;" class="" id="forget-password">这里</a>

					重置密码。

				</p>

			</div>

			<div class="create-account">

				<p>

					还没有账户?&nbsp; <a href="#">请到超级管理员处新建一个用户</a>

				</p>

			</div>

		</form>

		<!-- END LOGIN FORM -->

		<!-- BEGIN FORGOT PASSWORD FORM -->

		<form class="form-vertical forget-form" method="Post"
			onsubmit="forgetPwd()">
			<h3 class="">忘记密码?</h3>
			<p>输入下面的手机号码重新设置密码。</p>
			<div class="control-group">
				<div class="controls">
					<div class="input-icon left">
						<i class="icon-envelope"></i> <input
							class="m-wrap placeholder-no-fix" type="text" placeholder="Phone"
							name="phone" id="forget" style="width: 152px" /><button class="btn red" type="button" class="btn"
							onclick="send(this,'forget')" style="width: 98px">获取验证码</button>
					</div>
				</div>
			</div>
			
			<div class="control-group">
				<div class="controls">
					<div class="input-icon left">
						<i class="icon-user"></i> <input class="m-wrap placeholder-no-fix"
							type="text" name="code" id="forget_code" placeholder="Code" />

					</div>
				</div>
			</div>

			<div class="control-group">
				<label class="control-label visible-ie8 visible-ie9">Password</label>

				<div class="controls">

					<div class="input-icon left">

						<i class="icon-lock"></i> <input class="m-wrap placeholder-no-fix"
							type="password" placeholder="Password" name="password"
							id="forget_pwd" />

					</div>

				</div>

			</div>

			<div class="control-group">

				<label class="control-label visible-ie8 visible-ie9">Re-type
					Your Password</label>

				<div class="controls">

					<div class="input-icon left">

						<i class="icon-ok"></i> <input class="m-wrap placeholder-no-fix"
							type="password" placeholder="Re-type Your Password"
							name="rpassword" id="forget_rpwd" />

					</div>

				</div>

			</div>



			<div class="form-actions">

				<button type="button" id="back-btn" class="btn">

					<i class="m-icon-swapleft"></i> Black

				</button>

				<button type="submit"
					class="btn blue pull-right">

					Submit <i class="m-icon-swapright m-icon-white"></i>

				</button>
			</div>
		</form>

		<!-- END FORGOT PASSWORD FORM -->

	</div>

	<!-- END LOGIN -->

	<!-- BEGIN COPYRIGHT -->

	<div class="copyright">2017 &copy; DropHorse - Administrator
		System.</div>

	<script
		src="${pageContext.request.contextPath}/js/jquery-1.10.1.min.js"
		type="text/javascript"></script>

	<script
		src="${pageContext.request.contextPath}/js/jquery-migrate-1.2.1.min.js"
		type="text/javascript"></script>

	<!-- IMPORTANT! Load jquery-ui-1.10.1.custom.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip -->

	<script
		src="${pageContext.request.contextPath}/js/jquery-ui-1.10.1.custom.min.js"
		type="text/javascript"></script>

	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"
		type="text/javascript"></script>

	<script
		src="${pageContext.request.contextPath}/js/jquery.slimscroll.min.js"
		type="text/javascript"></script>

	<script
		src="${pageContext.request.contextPath}/js/jquery.blockui.min.js"
		type="text/javascript"></script>


	<script
		src="${pageContext.request.contextPath}/js/jquery.uniform.min.js"
		type="text/javascript"></script>



	<script
		src="${pageContext.request.contextPath}/js/jquery.validate.min.js"
		type="text/javascript"></script>

	<script src="${pageContext.request.contextPath}/js/messages_zh.min.js"
		type="text/javascript"></script>

	<script
		src="${pageContext.request.contextPath}/js/jquery.backstretch.min.js"
		type="text/javascript"></script>


	<script src="${pageContext.request.contextPath}/js/app.js"
		type="text/javascript"></script>

	<script src="${pageContext.request.contextPath}/js/login-soft.js"
		type="text/javascript"></script>
	
	<script src="${pageContext.request.contextPath}/js/sweetalert2.min.js"></script>
	<!-- END PAGE LEVEL SCRIPTS -->

	<script>
		$(function() {

			App.init();

			Login.init();

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
				time(o);
				$.ajax({
					url : "${pageContext.request.contextPath}/admin/code",
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
		
		function forgetPwd() {
			if (code == $("#forget_code").val() && $("#forget_code").val() != "") {
				$.ajax({
					url : "${pageContext.request.contextPath}/admin/forgetpwd",
					data : {
						phone : $("#forget").val(),
						password : $("#forget_pwd").val()
					},
					type : "POST",
					async: false,
					success : function(result) {
						if (result.extend.status == "-1") {
							swal({
								title:"修改失败!",
								text: "不存在该账号",
								type:'error',
								background: 'rgba(0,0,0,0.096)'
							});
						} else {
							swal({
								title:"修改成功!",
								type:'success',
								background: 'rgba(0,0,0,0.096)'
							});
						}
					}
				});
			} else {
				alert("验证码有误请重新输入！！！");

			}
		}

		function create() {
			if (code == $("#register_code").val()
					&& $("#register_code").val() != "") {
				$.ajax({
					url : "${pageContext.request.contextPath}/admin/reigster",
					data : {
						phone : $("#register").val(),
						username : $("#username").val(),
						password : $("#register_pwd").val()
					},
					type : "POST",
					async: false,
					success : function(result) {
						if (result.extend.status == "-1") {
							swal({
								title:"注册失败!",
								text: "该账号已存在",
								type:'error',
								background: 'rgba(0,0,0,0.096)'
							}).then(function(isConfirm) {
								if (isConfirm == true) {
									window.location.href = "${pageContext.request.contextPath}/admin/login";
								}
							})
						} else {
							swal({
								title:"注册成功!",
								type:'success',
								background: 'rgba(0,0,0,0.096)'
							}).then(function(isConfirm) {
								if (isConfirm == true) {
									window.location.href = "${pageContext.request.contextPath}/admin/login";
								}
							});
						}
					}
				});

			} else {
				alert("验证码有误请重新输入！！！");

			}
		}
	</script>
</body>
</html>