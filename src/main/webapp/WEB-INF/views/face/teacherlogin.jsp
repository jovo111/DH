<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta name="Generator" content="EditPlus®">
<meta name="Author" content="">
<meta name="Keywords" content="">
<meta name="Description" content="">
<title>Document</title>

<link href="${pageContext.request.contextPath}/css/bootstraps.min.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery.step.css" media="screen"
	type="text/css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrapValidator.min.css" />

<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/jquery.step.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrapValidator.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.form.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/bootstrapValidator.min.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrapValidator.min.js"></script>
<style type="text/css">
body {
	margin-top: 65px;
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

.account input {
	height: 50px;
	border-left: 0px;
}

.panel-body {
	padding: 20px 60px;
}
</style>
<script type="text/javascript">
    $(document).ready(function() {
    	formValidator();
    }); 
</script>
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
				
			</div>
			<div class="col-md-4" style="padding: 0px">
				<ul class="nav navbar-nav"
					style="margin: 3px; height: 57px; float: right">
					<li><a href="#">登录/注册</a></li>
					<li style="margin: -9px"><a href="#"><img
							src="${pageContext.request.contextPath}/image/face/6.jpg" alt="..." class="img-circle"
							style='width: 38px;'></a></li>
				</ul>
			</div>
		</div>
	</div>
	<!-- /.container-fluid --> </nav>

	<div style="background: #eee; height: 800px">
		<div class="container"
			style="padding: 0px; background: #fff; height: 800px">
			<div class="col-lg-6 col-lg-offset-3" style="padding: 0px">
				<div class="page-header">
					<h3>教师登录</h3>
				</div>
				<div class="panel panel-default"
					style="box-shadow: 0px 1px 2px #bbb; margin: 20px 0px; border-radius: 0px">
					<div class="panel-body">
						<form id="loginform" class="login-form" action="${pageContext.request.contextPath }/teacherLogin" method="post" style="display: block">
							<div class="form-group" style="margin-top: 20px">
								<div class="input-group account">
									<div class="input-group-addon">
										<i class="glyphicon glyphicon-user"></i>
									</div>
									<input type="text" class="form-control"
										placeholder="请输入手机号" name="phone">
								</div>
							</div>
							<div class="form-group" style="margin-top: 20px">
								<div class="input-group account">
									<div class="input-group-addon">
										<i class="glyphicon glyphicon-lock"></i>
									</div>
									<input type="text" class="form-control"
										placeholder="请输入密码"  name="password">
								</div>
							</div>
							<div class="form-group" style="height: 15px">
								<a href="${pageContext.request.contextPath }/auditTeacher" class="forget"
									style="float: left; padding-bottom: 10px;">申请入驻</a> <a
									href="javascript:void(0)" class="forget"
									style="text-decoration: none; float: right; padding-bottom: 10px;"
									id='forget'>忘记密码？</a>
							</div>

							<button type="submit" class="btn btn-success"
								style="width: 100%; height: 45px; font-size: 18px; margin-top: 20px; margin-bottom: 25px;" onclick="login()">登
								录</button>
						</form>
						<form id="forgetform" class="forget-form" action="${pageContext.request.contextPath }/teacherForget" method="post" style="display: none">
							<div class="form-group"
								style="margin-top: 20px; vertical-align: right">
								<div class="input-group account">
									<div class="input-group-addon">
										<i class="glyphicon glyphicon-phone"></i>
									</div>
									<input type="text" name="tnum" class="form-control"
										placeholder="请输入手机号" id="shouji">
								 </div>
							</div>
							<div class="form-group">
								<div class="input-group">
									<input type="text" name="code" id="code" class="form-control" placeholder="请输入验证码"
										style="height: 50px" /> <span class="input-group-btn">
										<button class="btn btn-default" onclick="show(this,'shouji')" type="button"
											style="background: -webkit-linear-gradient(-45deg, #ff6a00 0%, #b542f0 100%); color: #fff; height: 50px; width: 150px;">发送验证码</button>
									</span>
								</div>
							</div>
							<div class="form-group" style="margin-top: 20px">
								<div class="input-group account">
									<div class="input-group-addon">
										<i class="glyphicon glyphicon-lock"></i>
									</div>
									<input type="password" name="tpwd" class="form-control"
										placeholder="请输入密码">
								</div>
							</div>
							<div class="form-group" style="margin-top: 20px">
								<div class="input-group account">
									<div class="input-group-addon">
										<i class="glyphicon glyphicon-lock"></i>
									</div>
									<input type="password" name="confirmPassword" class="form-control"
										placeholder="请再次输入密码">
								</div>
							</div>
							<button type="button" class="btn btn-warning"
								style="font-size: 19px; margin-top: 20px; margin-bottom: 25px;"
								id="back">
								<span class="glyphicon glyphicon-circle-arrow-left"></span> 返回
							</button>

							<button type="submit" id="subbs" class="btn btn-success"
								style="font-size: 19px; margin-top: 20px; margin-bottom: 25px; float: right" onclick="forget()">
								提交 <span class="glyphicon glyphicon-circle-arrow-right"></span>
							</button>
						</form>
					</div>
				</div>
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
	<script>
		$(function() {
			$("#forget,#back").on('click', function() {
				$("#loginform").toggle();
				$("#forgetform").toggle();
			});
		});

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
		
		function login(){
			$('#loginform').ajaxSubmit();
		}
		
		function forget(){
			$('#forgetform').ajaxSubmit();
		}
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
				var codes;
					$.ajax({
						url : "${pageContext.request.contextPath}/qtteacher/code",
						data : "phone=" + $("#" + type).val(),
						 async:false,
						type : "POST",
						success : function(data) {
							  codes = data.extend.code;  
						}
					}); 

			} else {
				alert("请输入手机号码！");
			}  
			return codes;
		}
		function show(o, type) {  
			if ($("#" + type).val() != "") {
				 
				 var thcode=send(o, type); 
				alert("当前的code值"+thcode); 
				sessionStorage.setItem('thyzm', thcode); 
				if (thcode == "1" || thcode == "") {
					alert("该手机号码未注册，请注册手机号码!!!"); 
					$('#subbs').attr('disabled',"true");
				} else {   
					$('#subbs').attr('disabled',"false");
					//$('#subbs').removeAttr("disabled"); 
					time(o);
				}
			} else {
				alert("请输入手机号码！");
			}

		}
		$('#subbs').click(function(event) { 
			$('#forgetform').bootstrapValidator('validate');
			if ($('#forgetform').data('bootstrapValidator').isValid()) {
				var thyzm = sessionStorage.getItem('thyzm');  
				 
				if (thyzm == $('#code').val()) { 
					 
					$("#forgetform").submit(); 
				} else {
					alert('验证码有误，请输入正确的验证码');
				}
				//通过校验 

			}

		});
		function formValidator(){
			  $('#loginform').bootstrapValidator({
		            message: 'This value is not valid',
		            feedbackIcons: {
		            valid: 'glyphicon glyphicon-ok',
		            invalid: 'glyphicon glyphicon-remove',
		            validating: 'glyphicon glyphicon-refresh'
		                    },
		            fields: {
		                //账户
		                phone: {
		                    message: '电话号码验证失败',
		                    validators: {
		                        notEmpty: {
		                            message: '电话号码不能为空'
		                        },regexp: {
		                            regexp: /^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$/,
		                            message: '请输入正确的电话号码'
		                        },
		                        stringLength: {
		                            min: 11,
		                            max: 11,
		                            message: '电话号码长度必须在11位'
		                        }
		                    }
		                },   
		                password: {
		                	message: '密码验证失败',
		                    validators: {
		                        notEmpty: {
		                            message: '密码不能为空'
		                        },regexp: {
		                            regexp: /^[A-Za-z0-9]+$/,
		                            message: '密码只能有字母、数字、下划线组成'
		                        },
		                        stringLength: {
		                            min: 6,
		                            max: 6,
		                            message: '密码长度必须在6位'
		                        }
		                    }
		                }
		            }
		        });
			  $('#forgetform').bootstrapValidator({
					message : 'This value is not valid',
					feedbackIcons : {
						valid : 'glyphicon glyphicon-ok',
						invalid : 'glyphicon glyphicon-remove',
						validating : 'glyphicon glyphicon-refresh'
					},
					fields : {
						tnum : { 
							validators : {
								notEmpty : {
									message : '手机号码不能为空!!!'
								},
								regexp : {/* 只需加此键值对，包含正则表达式，和提示 */
									regexp : /^(13[0-9]|14[5|7]|15[0-9]|18[0-9])\d{8}$/,
									message : '手机号码格式不对，只能为数字，请输入正确的手机号码！'
								},
								stringLength : {/*长度提示*/
									min : 11,
									max : 11,
									message : '手机号码长度必须在11位'
								}
							}
						},
						tpwd : {
							validators : {
								notEmpty : {
									message : '密码不能为空!!!'
								},
								stringLength : {/*长度提示*/
									min : 6,
									max : 12,
									message : '密码长度必须在6到12之间'
								}
							}
						},
						code : {
							validators : {
								notEmpty : {
									message : '验证码不能为空!!!'
								}
							}
						},
						confirmPassword : {
							validators : {
								notEmpty : {
									message : '确认密码不能为空!!!'
								},
								identical : { //比较是否相同
									field : 'tpwd', //需要进行比较的input name值
									message : '两次密码不一致'
								},
								stringLength : {/*长度提示*/
									min : 6,
									max : 12,
									message : '密码长度必须在6到12之间'
								}
							}
						}
					}
				});
		}
	</script>
</body>
</html>