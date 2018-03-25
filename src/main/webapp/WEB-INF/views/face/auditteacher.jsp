<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Type" content="multipart/form-data; charset=utf-8" />
<title>Insert title here</title>

<link href="${pageContext.request.contextPath}/css/bootstraps.min.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrapValidator.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/jquery.step.css"
	media="screen" type="text/css" />

<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.js"
	type="text/javascript"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.step.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrapValidator.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.form.min.js"></script>
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

label {
	font-size: 15px;
}

.form-group div input {
	height: 45px
}

.form-group>label {
	padding-top: 13px !important;
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
			<div class="col-md-4 col-md-offset-2" style="padding: 0px"></div>
			<div class="col-md-4" style="padding: 0px">
				<ul class="nav navbar-nav"
					style="margin: 3px; height: 57px; float: right">
					<li><a href="#">登录/注册</a></li>
					<li style="margin: -9px"><a href="#"><img
							src="${pageContext.request.contextPath}/image/face/6.jpg"
							alt="..." class="img-circle" style='width: 38px;'></a></li>
				</ul>
			</div>
		</div>
	</div>
	<!-- /.container-fluid --> </nav>

	<div>
		<div class="container" style="padding: 0px">
			<div class="page-header">
				<h2>
					教师入驻 <small>传递思想，实现价值</small>
				</h2>
			</div>
		</div>
	</div>

	<div>
		<div class="container" style="padding-top: 20px;">
			<div class="row">
				<div class="step-body" id="myStep">
					<div class="step-header" style="width: 100%; display: block;">
						<ul>
							<li class="step-active" style="width: 33.3333%;"><p>认证手机</p></li>
							<li class="step" style="width: 33.3333%;"><p>填写个人资料</p></li>
							<li class="step" style="width: 33.3333%;"><p>完成</p></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>

	<form action="${pageContext.request.contextPath }/audit/add"
		method="post" enctype="multipart/form-data" id="tj">
		<div id="myTabContent" class="tab-content">

			<div class="tab-pane fade in active" id="one">

				<div class="container">

					<div class="row">
						<section>
						<div class="col-lg-8 col-lg-offset-2">
							<div class="page-header">
								<h2>手机认证</h2>
							</div>

							<div id="defaultForm1" class="form-horizontal">
								<div class="form-group">
									<label class="col-lg-3 control-label">手机号码</label>
									<div class="col-lg-5">
										<input type="text" class="form-control" name="tnum"
											placeholder="Phone" id="shouji" />
									</div>
								</div>

								<div class="form-group">
									<label class="col-lg-3 control-label">验证码</label>
									<div class="col-lg-3">
										<input type="text" class="form-control" name="code"
											placeholder="Code" id="code" />
									</div>
									<div class="col-lg-4">
										<button type="button" class="btn btn-danger"
											style="width: 100px; height: 45px;"
											onclick="show(this,'shouji')">发送验证码</button>
									</div>
								</div>

								<div class="form-group">
									<label class="col-lg-3 control-label">密码</label>
									<div class="col-lg-5">
										<input type="password" class="form-control" name="tpwd"
											placeholder="Password" />
									</div>
								</div>

								<div class="form-group">
									<label class="col-lg-3 control-label">确认密码</label>
									<div class="col-lg-5">
										<input type="password" class="form-control"
											name="confirmPassword" placeholder="ConfirmPassword" />
									</div>
								</div>
							</div>
							<div class="row text-right">
								<div class="col-lg-10"
									style="border-top: 1px solid #ddd; padding: 25px;">
									<button type="button" class="btn btn-warning" id="nextBtn"
										href="" data-toggle="tab">
										<span
											style="display: inline-block; position: relative; top: -5px; left: -3px;">下一步</span>
										<span class="glyphicon glyphicon-circle-arrow-right"
											style="font-size: 22px"></span>
									</button>
								</div>
							</div>
						</div>
						</section>
					</div>
				</div>
			</div>
			<div class="tab-pane fade" id="two">
				<div class="container">
					<div class="row">
						<section>
						<div class="col-lg-8 col-lg-offset-2">
							<div class="page-header">
								<h2>填写个人资料</h2>
							</div>

							<div id="defaultForm" class="form-horizontal">
								<div class="form-group">
									<label class="col-lg-3 control-label">真实姓名</label>
									<div class="col-lg-5">
										<input type="text" class="form-control" name="tname"
											placeholder="Name" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-lg-3 control-label">电话号码</label>
									<div class="col-lg-5">
										<input type="text" class="form-control" name="tphone"
											placeholder="Telephone" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-lg-3 control-label">所属教育机构</label>
									<div class="col-lg-5">
										<input type="text" class="form-control" name="tsource"
											placeholder="Source" />
									</div>
								</div>

								<div class="form-group">
									<label class="col-lg-3 control-label">个人头像</label>
									<div class="col-lg-5">
										<div id="preview">
											<img id="imghead" border="0"
												src="${pageContext.request.contextPath}/image/face/6.jpg"
												width="150" height="150" onclick="$('#previewImg').click();" />
										</div> 
										<input type="file" onchange="previewImage(this)"
											style="display: none;" id="previewImg" name="photo"/>
									</div>
								</div>

								<div class="form-group">
									<label class="col-lg-3 control-label">个人介绍</label>
									<div class="col-lg-5">
										<textarea name="tinfo" class="form-control" rows="5"
											style="width: 100%; resize: none;"></textarea>
									</div>
								</div>
							</div>
							<div class="row text-right">
								<div class="col-lg-10"
									style="border-top: 1px solid #ddd; padding: 25px;">
									<button type="button" class="btn btn-info" id="preBtn"
										href="#one" data-toggle="tab">
										<span class="glyphicon glyphicon-circle-arrow-left"
											style="font-size: 22px"></span> <span
											style="display: inline-block; position: relative; top: -5px; left: -3px;">
											上一步</span>
									</button>
									 <button type="submit" href="#three" id="goBtn" class="btn btn-warning"  data-toggle="tab" onclick="tj()">
										<span
											style="display: inline-block; position: relative; top: -5px; left: -3px;">下一步</span>
										<span class="glyphicon glyphicon-circle-arrow-right"
											style="font-size: 22px"></span>
									</button>
									 
								</div>
							</div>
						</div>
						</section>
					</div>
				</div>
			</div>

			<div class="tab-pane fade" id="three">
				<div class="container">
					<div class="row">
						<section>
						<div class="col-lg-8 col-lg-offset-2 text-center">
							<div style="padding: 70px 0px">
								<img
									src="${pageContext.request.contextPath}/image/face/success.png"
									>
							</div>

							<div class="row text-right">
								<div class="col-lg-10"
									style="border-top: 1px solid #ddd; padding: 25px;">
									<button type="button" class="btn btn-success" data-toggle="tab" onclick="javascript：window.location.href='${pageContext.request.contextPath}/toLogin'">
										<span
											style="display: inline-block; position: relative; top: -5px; left: -3px;">完成</span>
										<span class="glyphicon glyphicon-ok-circle"
											style="font-size: 22px"></span>
									</button>
								</div>
							</div>
						</div>
						</section>
					</div>
				</div>
			</div>
		</div>
	</form>
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
	<script type="text/javascript">
		$(function() {

			$('#defaultForm').bootstrapValidator({
				message : 'This value is not valid',
				feedbackIcons : {
					valid : 'glyphicon glyphicon-ok',
					invalid : 'glyphicon glyphicon-remove',
					validating : 'glyphicon glyphicon-refresh'
				},
				fields : {
					tname : {
						 message: '姓名验证失败',
		                    validators: {
		                        notEmpty: {
		                            message: '姓名不能为空'
		                        },regexp: {
		                            regexp: /^[\u4e00-\u9fa5]{0,}$/,
		                            message: '姓名必须是中文'
		                        },
		                        stringLength: {
		                            min: 2,
		                            max: 4,
		                            message: '姓名长度必须在2到4位之间'
		                        }
		                    }
					},
					tsource : {
						validators : {
							notEmpty : {
								message : '所属机构不能为空!!!'
							}
						}
					}, tphone: {
	                    message: '电话号码验证失败',
	                    validators: {
	                         regexp: {
	                            regexp: /^\d{3}-\d{8}|\d{4}-\d{7,8}$/,
	                            message: '电话号码不正确，请检查区号是否正确，如：0663-2512665'
	                        },
	                        stringLength: {
	                            min: 12,
	                            max: 13,
	                            message: '电话号码长度必须在12到13位之间'
	                        }
	                    }
	                },
					tinfo : {
						validators : {
							notEmpty : {
								message : '个人介绍不能为空!!!'
							}
						}
					}
				}
			});

			$('#defaultForm1').bootstrapValidator({
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
								field : 'auditpwd', //需要进行比较的input name值
								message : '两次密码不一致'
							},
							stringLength : {/*长度提示*/
								min : 6,
								max : 30,
								message : '密码长度必须在6到30之间'
							}
						}
					}
				}
			});
			var step = $("#myStep").step();

			$("#preBtn").click(function(event) {
				var yes = step.preStep();//上一步
			}); 
			$('#nextBtn').click(function(event) {

				$('#defaultForm1').bootstrapValidator('validate');
				if ($('#defaultForm1').data('bootstrapValidator').isValid()) {
					var yzm = sessionStorage.getItem('yzm'); 
					if (yzm == $('#code').val()) {
						$('#nextBtn').attr("href", "#two");
						var yes = step.nextStep();
					} else {
						alert('验证码有误，请输入正确的验证码');
					}
					//通过校验 

				}

			});

			$('#goBtn').click(function(event) {

				$('#defaultForm').bootstrapValidator('validate');
				if ($('#defaultForm').data('bootstrapValidator').isValid()) {

					$('#goBtn').attr("href", "#three");
					//通过校验 
					var yes = step.goStep(3);
				}

			});

		}); 
		function tj() {
			alert("tj");
			$('#tj').ajaxSubmit(function(data){    
		        if(data.code=="100"){  
		            alert("提交成功！");     
		        }else{
		        	alert("失败");
		        }
		    });  

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
						url : "${pageContext.request.contextPath}/audit/code",
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
				 var code=send(o, type); 
				alert("当前的code值"+code); 
				sessionStorage.setItem('yzm', code);
				
				if (code == "1" || code == "") {
					alert("该手机号码已被注册，请更换手机号码!!!"); 
					$('#nextBtn').attr('disabled',"true");
				} else {  
					$('#nextBtn').removeAttr("disabled"); 
					time(o);
				}
			} else {
				alert("请输入手机号码！");
			}

		}

		function previewImage(file) {
			var MAXWIDTH = 200;
			var MAXHEIGHT = 150;
			var div = document.getElementById('preview');
			if (file.files && file.files[0]) {
				div.innerHTML = '<img id=imghead onclick=$("#previewImg").click()>';
				var img = document.getElementById('imghead');
				img.onload = function() {
					var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT,
							img.offsetWidth, img.offsetHeight);
					img.width = rect.width;
					img.height = rect.height;
					//              img.style.marginLeft = rect.left+'px';
					img.style.marginTop = rect.top + 'px';
				}
				var reader = new FileReader();
				reader.onload = function(evt) {
					img.src = evt.target.result;

				}
				reader.readAsDataURL(file.files[0]);
			} else //兼容IE
			{
				var sFilter = 'filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src="';
				file.select();
				var src = document.selection.createRange().text;
				div.innerHTML = '<img id=imghead>';
				var img = document.getElementById('imghead');
				img.filters.item('DXImageTransform.Microsoft.AlphaImageLoader').src = src;
				var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT,
						img.offsetWidth, img.offsetHeight);
				status = ('rect:' + rect.top + ',' + rect.left + ','
						+ rect.width + ',' + rect.height);
				div.innerHTML = "<div id=divhead style='width:"+rect.width+"px;height:"+rect.height+"px;margin-top:"+rect.top+"px;"+sFilter+src+"\"'></div>";
			}
		}

		function clacImgZoomParam(maxWidth, maxHeight, width, height) {
			var param = {
				top : 0,
				left : 0,
				width : width,
				height : height
			};
			if (width > maxWidth || height > maxHeight) {
				rateWidth = width / maxWidth;
				rateHeight = height / maxHeight;

				if (rateWidth > rateHeight) {
					param.width = maxWidth;
					param.height = Math.round(height / rateWidth);
				} else {
					param.width = Math.round(width / rateHeight);
					param.height = maxHeight;
				}
			}
			param.left = Math.round((maxWidth - param.width) / 2);
			param.top = Math.round((maxHeight - param.height) / 2);
			return param;
		}
	</script>
</body>
</html>