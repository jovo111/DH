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
<link href="${pageContext.request.contextPath}/css/summernote.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/css/jquery.plupload.queue.css"
	rel="stylesheet" />

<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.js"
	type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/js/jquery.slimscroll.min.js"></script>
<script src="${pageContext.request.contextPath}/js/summernote.js"></script>
<script src="${pageContext.request.contextPath}/js/summernote-zh-CN.js"></script>
<script src="${pageContext.request.contextPath}/js/plupload.full.min.js"></script>
<script
	src="${pageContext.request.contextPath}/js/jquery.plupload.queue.min.js"></script>
<script src="${pageContext.request.contextPath}/js/plupload-zh_CN.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.form.min.js"></script>

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

.icon-over {
	width: 70px;
	height: 70px;
	border-radius: 50%;
	font-size: 18px;
	line-height: 70px;
	text-align: center;
	border: 3px solid #e67e22;
	margin: 32px 60px;
	color: #e67e22;
}

.ispass {
	float: right;
	line-height: 25px;
	font-size: 13px;
}

.student {
	width: 210px;
	height: 175px;
	float: left;
	margin: 20px 20px 20px 0px;
	padding: 14px 0px;
	background: #fff;
	border: 1px solid #ddd;
	box-shadow: 0px 1px 5px #bbb;
}

.courseform {
	margin: 30px 0px 30px 0px;
}

.form-control {
	height: 50px
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
					<a href="${pageContext.request.contextPath }/"><img
						src="${pageContext.request.contextPath}/image/face/logo2.png"
						style="width: 185px"> </a>
				</div>
			</div>
			<div class="col-md-4 col-md-offset-2" style="padding: 0px"></div>
			<div class="col-md-4" style="padding: 0px">
				<ul class="nav navbar-nav"
					style="margin: 3px; height: 57px; float: right">
					<li><shiro:hasRole name="teacher">
							<a href="javascript:void(0);"><p class="welcome">Hello, <shiro:principal
									property="tname" /></p></a>
						</shiro:hasRole></li>
					<li><a href="${pageContext.request.contextPath }/teacherLogout">[退出]</a></li>
					<li style="margin: -9px"><a href="#"><img
							src="${pageContext.request.contextPath}/image/face/6.jpg"
							alt="..." class="img-circle" style='width: 38px;'></a></li>
				</ul>
			</div>
		</div>
	</div>
	</nav>
	<div
		style="background: url(${pageContext.request.contextPath}/image/face/bg1.png) center center no-repeat; width: 100%; height: 220px">
		<div class="container" style="padding: 50px 0px">
			<div class="text-cneter" style="float: left">
				<img src="${pageContext.request.contextPath}/image/face/6.jpg"
					alt="..." class="img-thumbnail"
					style="border-radius: 50%; width: 120px">
			</div>
			<div style="float: left; padding: 0px 30px; color: #fff">
				<h3>${teacher.getTname() }</h3>
				<h5>${teacher.getTsource() }</h5>
				<p class="info">${teacher.getTinfo() }</p>
			</div>



			<div style="float: left;">
				<c:if test="${teacher.getIspass()==1 }">
					<div class="icon-over"
						style="border: 3px solid #5cb85c; color: #5cb85c">
						<b>已通过</b>
					</div>
				</c:if>
				<c:if test="${teacher.getIspass()==0 }">
					<div class="icon-over">
						<b>审核中</b>
					</div>
				</c:if>
				<c:if test="${teacher.getIspass()==-1 }">
					<div class="icon-over"
						style="border: 3px solid #dc6950; color: #dc6950;">
						<b>未通过</b>
					</div>
				</c:if>
			</div>
		</div>
	</div>
	<div style="background: #f6f6f6">
		<div class="container"
			style="background: #fff; box-shadow: 0px 1px 15px #bbb">
			<div class="row" style="border-bottom: 1px solid #ddd">
				<button type="button" class="btn btn-link link"
					style="text-decoration: none; outline: none; color: #797979; border-bottom: 4px solid #5cb85c"
					href="#course" data-toggle="tab">课程</button>
				<button type="button" class="btn btn-link link"
					style="text-decoration: none; outline: none; color: #797979; border-bottom: 4px solid #5cb85c"
					href="#student" data-toggle="tab">学生</button>
				<button type="button" class="btn btn-link link"
					style="text-decoration: none; outline: none; color: #797979; border-bottom: 4px solid #5cb85c; float: right"
					href="#teacherDetail" data-toggle="tab">个人信息</button>
				<button type="button" class="btn btn-link link"
					style="text-decoration: none; outline: none; color: #797979; border-bottom: 4px solid #5cb85c; float: right"
					href="#create" data-toggle="tab">课堂管理</button>
			</div>

			<div id="myTabContent" class="tab-content">
				<div class="tab-pane fade" id="course" style="margin-right: -20px">
					<div class="row" style="height: 600px; padding: 0px 20px">
						<c:forEach items="${courses}" var="course">
							<div class="course">
								<div>
									<a href="#"><img
										src="${pageContext.request.contextPath}/image/face/6.jpg"></a>
								</div>
								<div style="height: 80px; padding: 0px 6px">
									<a href="#" style="font-size: 14px">${course.cname }</a><br>
									<a style="color: #999" href="#"><h6
											style="display: inline-block;">${course.teacherDetail.tname }</h6>
								</div>
								<a href="#"><span class="glyphicon glyphicon-yen"
									style="border-right: 1px solid #ddd; color: #e88282"><font
										class="cprice">${course.cprice }</font></span><span
									class="glyphicon glyphicon-user"><font class="cprice">${course.stucount }</font></span>
								</a>
							</div>
						</c:forEach>

						<c:forEach items="${auditCourse}" var="course">
							<div class="course">
								<div>
									<a href="#"><img
										src="${pageContext.request.contextPath}/image/face/6.jpg"></a>
								</div>
								<div style="height: 80px; padding: 0px 6px">
									<a href="#" style="font-size: 14px">${course.cname }</a><br>
									<a style="color: #999" href="#"><h6
											style="display: inline-block;">${course.teacherDetail.tname }</h6>
										<c:if test="${course.ispass==0 }">
											<span class="glyphicon glyphicon-info-sign ispass"
												style="border: none"> 待审核</span>
										</c:if> <c:if test="${course.ispass==-1 }">
											<span class="glyphicon glyphicon-remove-sign ispass"
												style="border: none; color: #e88282"> 未通过</span>
										</c:if> </a>
								</div>
								<a href="#"><span class="glyphicon glyphicon-yen"
									style="border-right: 1px solid #ddd; color: #e88282"><font
										class="cprice">${course.cprice }</font></span><span
									class="glyphicon glyphicon-user"><font class="cprice">0</font></span>
								</a>
							</div>
						</c:forEach>
					</div>
				</div>
				<div class="tab-pane fade" id="student" style='min-height: 600px'>
					<div class="row" style="padding: 0px 20px; margin-right: -35px;">
						<c:forEach items="${ students}" var="s">
							<div class="student">
								<div class="text-center">
									<a href="#"><img
										src="${pageContext.request.contextPath}/image/face/6.jpg"
										alt="..." class="img-circle"
										style="border-radius: 50%; width: 110px"></a>
								</div>
								<div class='text-center' style="height: 80px; padding: 0px 6px">
									<a style="color: #999" href="#">
										<h5 style="display: inline-block;">${s.snick }</h5>
									</a>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>

				<div class="tab-pane fade" id="create">
					<div class="row" style="padding: 0px 20px;">
						<div class="page-header text-right">
							<h2>课堂</h2>
						</div>
						<form class="courseform"
							action="${pageContext.request.contextPath }/createCourse"
							method="Post" enctype="multipart/form-data" id="form">
							<div class="col-md-12">
								<div class="col-md-6">
									<div class="form-group">
										<label for="exampleInputEmail1">课程名称</label> <input
											type="text" class="form-control" id="exampleInputEmail1"
											placeholder="CoruseName" name="cname">
									</div>
									<div class="form-group">
										<label for="exampleInputPassword1">课程类型</label> <select
											class="combobox form-control" name="typeid">
											<c:forEach items="${type }" var="t">
												<option value="${t.typeid }">${t.typename }</option>
											</c:forEach>
										</select>
									</div>
									<div class="form-group">
										<label for="exampleInputPassword1">课程价格</label>
										<div class="input-group">
											<span class="input-group-addon">￥</span> <input type="text"
												class="form-control"
												aria-label="Amount (to the nearest dollar)" name="cprice">
											<span class="input-group-addon">.00</span>
										</div>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group text-right">
										<div id="preview">
											<img id="imghead" border="0"
												src="${pageContext.request.contextPath}/image/face/6.jpg"
												width="200" height="200" onclick="$('#previewImg').click();" />
										</div>
										<input type="file" onchange="previewImage(this)"
											style="display: none;" id="previewImg" name="photo" />
									</div>
								</div>
								<div class="col-md-12">
									<div class="form-group">
										<label for="exampleInputFile">课堂介绍</label>
										<textarea class="summernote" name="cinfo"></textarea>
									</div>
								</div>
							</div>
							<div class="col-md-12">
								<button type="button" class="btn btn-warning"
									style="float: right; margin-right: 20px;" id="submit">
									<span class="glyphicon glyphicon-ok-circle"></span> 提交
								</button>
							</div>
						</form>
						<div id="addTask" style="display: none">
							<div class="col-md-5">
								<div
									style="border: 1px solid #ddd; padding: 15px; height: 280px">
									<form class="fileupload" id="fileupload" method="POST"
										enctype="multipart/form-data">
										<div class="page-header">
											<h2>添加章节</h2>
										</div>
										<div class="form-group">
											<label class="col-lg-3 control-label"
												style="line-height: 34px; font-size: 15px;">课时名程</label>
											<div class="col-lg-9">
												<input type="text" class="form-control" name="task"
													placeholder="Task" id="task" />
											</div>
										</div>
										<div class="col-lg-12" style="padding-top: 20px">
											<button type="button" id="browse" class="btn btn-success">添加...</button>
											<button type="button" id="start" class="btn btn-warning">开始上传</button>
											<a href="${pageContext.request.contextPath }/teacherManager"
												class="btn btn-warning">完成</a>
										</div>
									</form>
								</div>
							</div>
							<div class="col-md-7" style="margin-bottom: 20px">
								<table class="table table-striped">
									<tbody id="uploadlist">

									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>

				<div class="tab-pane fade in active" id="teacherDetail">
					<div class="row" style="margin: 45px;">
						<div class="col-md-12">
							<div class="panel panel-default" style="border-radius: 0px">
								<div class="panel-heading"
									style="background: #fff; padding: 18px 15px">我的信息</div>
								<div class="panel-body" style="padding: 0px">
									<img src="image/6.jpg" alt="..." class="img-rounded"
										style="width: 100%; height: 350px; border-radius: 0px">
								</div>
								<div class="panel-footer" style="padding: 40px 70px;">
									<form id="teacher" action="updateTeacher" method="post" enctype="multipart/form-data">
										<input type="hidden" name="tid" value="${teacher.getTid() }"/>
										<div class="form-group">
											<label for="exampleInputEmail1">姓名</label> <input type="text"
												class="form-control" id="exampleInputEmail1"
												placeholder="Name" value="${teacher.getTname()}" name="tname" readonly>
										</div>
										<div class="form-group">
											<label for="exampleInputEmail1">余额</label>
											<div class="input-group">
												<div class="input-group-addon">￥</div>
												<input type="text" class="form-control"
													id="exampleInputAmount" placeholder="Amount"
													name="tbalance" value="${teacher.getTbalance() }" readonly>
												<div class="input-group-addon">.00</div>
											</div>
										</div>
										<div class="form-group">
											<label for="exampleInputEmail1">所属机构</label> <input
												type="text" class="form-control" placeholder="Source" value="${teacher.getTsource() }" name="tsource" readonly>
										</div>
										<div class="form-group">
											<label for="exampleInputEmail1">电话号码</label> <input
												type="text" class="form-control"
												name="tphone" placeholder="Telephone" value="${teacher.getTphone() }" readonly>
										</div>
										<div id="pass-group" style="display: none">
											<div class="form-group">
												<label for="exampleInputPassword1">密码</label> <input
													type="password" class="form-control" id="tpwd" name="tpwd"
													placeholder="Password">
											</div>
											<div class="form-group">
												<label for="exampleInputPassword1">确认密码</label> <input
													type="password" class="form-control" id="repwd" name="repwd"
													placeholder="RePassword">
											</div>
											<div class="form-group">
												<label for="exampleInputFile">上传图片</label> <input type="file"
													name="photo">
											</div>
										</div>
										
										<div class="form-group">
											<label for="exampleInputFile">个人简介</label>
											<textarea class="form-control" name="tinfo" rows="8" readonly>${teacher.getTinfo() }</textarea>
										</div>
										<button type="button" id="edit" class="btn btn-primary">编辑</button>
										<div id="edit-group" style="display:none">
											<button type="button" id="cancel" class="btn btn-warning">取消</button>
											<button type="submit" id="success" class="btn btn-success">完成</button>
										</div>
									</form>

								</div>
							</div>
						</div>
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
	<script type="text/javascript">
		$(function() {
			$('.summernote').summernote({
				height : 350,
				tabsize : 2,
				lang : 'zh-CN'
			});

			$(".tasklist").slimScroll({
				color : 'rgb(0, 0, 0)',
				size : '7px',
				height : '532px',
			});

			$("#submit").on('click', function() {
				$("#form").ajaxSubmit(function(date) {
					if (date.extend.status >= 1) {
						$("#submit").hide();
						$("#addTask").show();
					}
				});
			});
			
			$("#edit").on('click', function() {
				$('#teacher').find('input,textarea').attr('readonly',false);
				$("#pass-group,#edit,#edit-group").toggle();
			});

			$("#cancel").on('click', function() {
				$('#teacher').find('.form-group').find('input,textarea').attr('readonly',true);
				$("#tpwd,#repwd").val("");
				$("#pass-group,#edit,#edit-group").toggle();
			});

			var fileUploader, //上传对象
			uploadStoreFileUrl = [], //当前图片列表
			uploadSuccessList = [], //图片上传成功后返回的列表
			fileNameList = [];//添加图片后的队列

			fileUploader = new plupload.Uploader(
					{
						browse_button : 'browse', //触发文件选择对话框的按钮，为那个元素id
						url : '${pageContext.request.contextPath}/Upload', //服务器端的上传页面地址
						runtimes : 'html5,flash,silverlight,html4',
						dragdrop : false,
						auto_start : false, // 选择文件后自动上传，若关闭需要自己绑定事件触发上传
						max_file_size : '10000mb',

						chunk_size : '5mb',

						filters : [ {
							title : "Vedio files",
							extensions : "mpg,m4v,mp4,flv,3gp,mov,avi,rmvb,mkv,wmv"
						} ],

						// Rename files by clicking on their titles
						rename : true,

						// Sort files
						sortable : true,

						views : {
							list : true,
							thumbs : true, // Show thumbs
							active : 'thumbs'
						},

						flash_swf_url : 'js/Moxie.swf', //swf文件，当需要使用swf方式进行上传时需要配置该参数
						silverlight_xap_url : 'js/Moxie.xap', //silverlight文件，当需要使用silverlight方式进行上传时需要配置该参数

						init : {
							'FilesAdded' : function(up, files) {
								if ($("#task").val() == "") {
									alert("请写课时名称！");
									return;
								}
								plupload
										.each(
												files,
												function(file) {
													var index = file.name
															.lastIndexOf(".");
													var format = file.name
															.substring(
																	index,
																	file.name.length);

													file.name = $("#task")
															.val()
															+ format;
													// 文件添加进队列后,处理相关的事情
													// 上传前预览
													var isAdd = true;
													// 先判断要上传的图片是否重复
													for (var i = 0; i < fileNameList.length; i++) {
														if (file.name == fileNameList[i]) {
															isAdd = false;
															return false;
														}
													}
													// 如果不是重复的，则添加到上传队列，并且在页面预览
													if (isAdd) {
														fileNameList.push($(
																"#task").val());
														var size = trans(files[0].size);

														var fileName = $(
																"<td></td>")
																.attr("id",
																		"task")
																.append(
																		file.name);
														var fileSize = $(
																"<td></td>")
																.append(size);
														var progressbar = $(
																"<div></div>")
																.attr(
																		{
																			"class" : "progress-bar progress-bar-warning progress-bar-striped",
																			'role' : 'progressbar',
																			'aria-valuenow' : '0',
																			'style' : 'width:10%',
																			'id' : files[0].id
																		})
																.append("0%");
														var progress = $(
																"<td></td>")
																.append(
																		$(
																				"<div></div>")
																				.append()
																				.addClass(
																						"progress")
																				.append(
																						progressbar)
																				.attr(
																						"style",
																						"width:175px"));
														var cancel = $(
																"<td class='status'></td>")
																.append(
																		$(
																				"<button></button>")
																				.append(
																						"取消")
																				.addClass(
																						"btn btn-danger cancel")
																				.attr(
																						{
																							"value" : files[0].id
																						}));
														var tr = $("<tr></tr>")
																.append(
																		$("<td></td>"))
																.append(
																		fileName)
																.append(
																		fileSize)
																.append(
																		progress)
																.append(cancel);

														tr
																.appendTo("#uploadlist");

														$("#task").val("");
													}
												});
							},
							'BeforeUpload' : function(up, file) {
								// 每个文件上传前,处理相关的事情
							},
							'UploadProgress' : function(up, file) {
								var status = $("#" + file.id).parent().parent()
										.parent();
								status.find(".cancel").remove();
								status.find(".status").html("上传中...");
								var percent = file.percent;
								$("#" + file.id).css({
									"width" : percent + "%"
								});
								$("#" + file.id).text(percent + "%");
							},
							'FileUploaded' : function(up, file, info) {
								// 上传成功后，返回图片路径，domain就是上面的domain参
								var status = $("#" + file.id).parent().parent()
										.parent();
								status.find(".status").html("上传成功");
							},
							'Error' : function(up, file, err, errTip) {
								//上传出错时,处理相关的事情
								if (file.code == '-601') {
									alert('只允许视频文件！')
								} else {
									alert(err);
								}
							}
						}
					});

			fileUploader.init();

			$("#start").click(function() {
				fileUploader.start(); //调用实例对象的start()方法开始上传文件，当然你也可以在其他地方调用该方法 
			})

			//取消按钮
			$("body").on('click', '.cancel', function() {
				var id = $(this).attr('value');
				var name = $(this).parent().parent().find("#task").text();
				alert(id + " " + name);

				$(this).parent().parent().remove();
				if (!(id == undefined || id == 'undefined')) {
					uploadStoreImgUrl.removeFile(id);
					$.each(fileNameList, function(index, item) {
						// index是索引值（即下标）   item是每次遍历得到的值；
						if (item == name) {
							fileNameList.splice(index, 1);
						}
					});
				}
			});
		});

		function trans(limit) {
			var size = "";
			if (limit < 0.1 * 1024) { //如果小于0.1KB转化成B  
				size = limit.toFixed(2) + "B";
			} else if (limit < 0.1 * 1024 * 1024) {//如果小于0.1MB转化成KB  
				size = (limit / 1024).toFixed(2) + "KB";
			} else if (limit < 0.1 * 1024 * 1024 * 1024) { //如果小于0.1GB转化成MB  
				size = (limit / (1024 * 1024)).toFixed(2) + "MB";
			} else { //其他转化成GB  
				size = (limit / (1024 * 1024 * 1024)).toFixed(2) + "GB";
			}

			var sizestr = size + "";
			var len = sizestr.indexOf("\.");
			var dec = sizestr.substr(len + 1, 2);
			if (dec == "00") {//当小数点后为00时 去掉小数部分  
				return sizestr.substring(0, len) + sizestr.substr(len + 3, 2);
			}
			return sizestr;
		}

		function previewImage(file) {
			var MAXWIDTH = 400;
			var MAXHEIGHT = 200;
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