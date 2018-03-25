<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>teacher</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.2.1.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/bootstraps.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/bootstrapValidator.min.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrapValidator.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<style type="text/css">
.img-rounded {
	width: 70px;
	height: 70px;
}

.panel-heading {
	font-size: 20px;
}

.teble-div {
	padding: 0 15px;
	font-size: 18px;
}
</style>
<script type="text/javascript">
    $(document).ready(function() {
    	formValidator();
    }); 
</script>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<h2>
					教师信息&nbsp;<small>教师信息</small>
				</h2>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<ol class="breadcrumb">
					<li><a href="#">Home</a></li>
					<li class="active">TeacherInfo</li>
				</ol>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-info">
					<div class="panel-heading">
						<span class="glyphicon glyphicon-menu-hamburger"
							aria-hidden="true"></span>&nbsp;教师信息表
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-md-1">
								<button type="button" class="btn btn-success btn-lg"
									onclick="add()">
									添加教师信息&nbsp;<span class="glyphicon glyphicon-plus"
										aria-hidden="true"></span>
								</button>
							</div>
							<div class="col-md-3 col-md-offset-8">
								<form class="navbar-form navbar-right" role="search">
									<div class="form-group input-group-lg">
										<input type="text" class="form-control" placeholder="Search"
											id="example">
									</div>
								</form>
							</div>
						</div>
					</div>
					<div class="teble-div">
						<table class="table table-striped table-hover" id="table1">
							<thead>
								<tr>
									<td>Photo</td>
									<td>Number</td>
									<td>Name</td>
									<td>Phone</td>
									<td>Info</td>
									<td>Source</td>
									<td>Operation</td>
								</tr>
							</thead>
							<tbody>

							</tbody>
						</table>
					</div>

					<div class="row">
						<div class="col-md-8"></div>

						<div class="col-md-4">
							<nav aria-label="Page navigation" id="page_nav_area"></nav>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript" defer="defer">
		$(function() {
			to_Page(1, "");
		});

		function to_Page(pn, example) {
			if ($("#example").val() != "") {
				example = $("#example").val();
			}

			$.ajax({
				url : "${pageContext.request.contextPath}/admin/teachers",
				data : "pn=" + pn + "&example=" + example,
				type : "POST",
				success : function(result) {
					console.log(result);
					build_table(result);
					build_page_nav(result);
					pageInfo_p(result);
				}
			});
		}

		$("#example").keyup(function() {
			var example = $(this).val();
			$.ajax({
				url : "${pageContext.request.contextPath}/admin/teachers",
				data : "pn = 1&example=" + example,
				type : "POST",
				success : function(result) {
					console.log(result);
					build_table(result);
					build_page_nav(result);
					pageInfo_p(result);
				}
			});
		});

		function build_table(result) {
			$("#table1 tbody").empty();
			var users = result.extend.pageInfo.list;
			$
					.each(
							users,
							function(index, item) {
								var img = $("<img>")
										.attr("src",
												"${pageContext.request.contextPath}"+item.teacherDetail.tphoto)
										.addClass("img-rounded");
								var tphoto = $("<td></td>").append(img); 
								var tnum = $("<td></td>").append(item.tnum);
								var tname = $("<td></td>").append(
										item.teacherDetail.tname);
								var tphone = $("<td></td>").append(
										item.teacherDetail.tphone);
								var text = $("<textarea></textarea>").append(
										item.teacherDetail.tinfo).addClass(
										"form-control").attr("rows", "3");
								var tinfo = $("<td></td>").append(text);
								var tsource = $("<td></td>").append(
										item.teacherDetail.tsource);

								var primary = $("<button></button>")
										.append("详情")
										.addClass("btn btn-primary")
										.attr(
												"onclick",
												"window.location.href='${pageContext.request.contextPath}/admin/teacherprofile?tid="
														+ item.tid + "'");
								var warning = $("<button></button>").append(
										"编辑").addClass("btn btn-warning").attr(
										"onclick",
										"div_warning(this,"+item.tid+")");
								var danger = $("<button></button>")
										.append("删除")
										.addClass("btn btn-danger").attr(
												"onclick",
												"div_danger(" + item.tid + ")");
								var operation = $("<td></td>").append(primary,
										" ", warning, " ", danger);

								$("<tr></tr>").append(tphoto).append(tnum)
										.append(tname).append(tphone).append(
												tinfo).append(tsource).append(
												operation).appendTo(
												"#table1 tbody");

							});
		}

		function pageInfo_p(result) {
			$(".col-md-8").empty();
			var pageNum = result.extend.pageInfo.pageNum;//当前第几页
			var pages = result.extend.pageInfo.pages;//总页数
			var p = $("<p></p>").append('共' + pages + '页&emsp;').append(
					'当前第' + pageNum + '/' + pages + '页')
					.addClass("navbar-text");
			$("<span></span>").append(p).appendTo(".col-md-8");
		}

		function build_page_nav(result) {
			$("#page_nav_area").empty();

			var ul = $("<ul></ul>").addClass("pagination pagination-lg");
			//<li class="previous"><a href="#"><span aria-hidden="true">&larr;</span> Older</a></li>
			var orderPageLi = $("<li></li>").append(
					$("<a></a>").append($("<span></span>").append("&larr;"))
							.append("Older").attr("href", "#")).addClass(
					"previous");

			var newerPageLi = $("<li></li>").append(
					$("<a></a>").append($("<span></span>").append("Newer"))
							.append("&rarr;").attr("href", "#")).addClass(
					"next");

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
		}

		//打开添加教师模块
		function add() { 
			$("input[id='exampleInputNum1']").val("");
			$("input[id='exampleInputPassword1']").val(""); 
			$("input[id='exampleInputName1']").val("");
			$("input[id='exampleInputPhone1']").val("");
			$("input[id='exampleInputSourse1']").val("");
			$("input[id='exampleInputInfo1']").val("");
			$("textarea[id='exampleInputFile1']").val(""); 
			$("img[id='imghead']").attr({'width':'200px','height':'150px','src':"${pageContext.request.contextPath}/image/teacher/1.jpg"});
			 
			 $("#addteacher").data('bootstrapValidator').destroy();
		     $('#addteacher').data('bootstrapValidator', null);
		      formValidator();
			$("#myModal").modal();
		}
		 
		function show() {
			$("#detail").toggle();
		}
		
		function div_warning(obj,tid) {
			
			$("input[id='exampleInputPassword2']").val(""); 
			$("input[id='exampleInputName2']").val("");
			$("input[id='exampleInputPhone2']").val("");
			$("input[id='exampleInputSourse2']").val(""); 
			$("textarea[id='exampleInputFile2']").val("");
			$("img[id='upimghead']").attr('src',"default.jpg");
			$("#updateteacher").data('bootstrapValidator').destroy();
		     $('#updateteacher').data('bootstrapValidator', null);
		      formValidator();      
		      var tds= $(obj).parent();
		      var tdss=tds.parent().find('td'); 
		      var img=(tdss.eq(0).find('img'))[0].src; 
		       
			 $('#exampleInputName2').val(""+tdss.eq(2).text());
			 $('#exampleInputPhone2').val(""+tdss.eq(3).text());
			 $('#upimghead').attr('src',img);
			 $('#exampleInputSourse2').val(""+tdss.eq(5).text());
			 $('#exampleInputFile2').val(""+tdss.eq(4).text());
			$("#div_warning").modal();
			$("#tids").empty();
			var input = $("<input>").addClass("form-control").attr({
				"type" : "hidden",
				"name" : "tid",
				"value" : tid
			});

			$("#tids").append(input);
		}
		  
		    
		 function formValidator(){
		        $('#addteacher').bootstrapValidator({
		            message: 'This value is not valid',
		            feedbackIcons: {
		            valid: 'glyphicon glyphicon-ok',
		            invalid: 'glyphicon glyphicon-remove',
		            validating: 'glyphicon glyphicon-refresh'
		                    },
		            fields: {
		                //账户
		                tnum: {
		                    message: '账户验证失败',
		                    validators: {
		                        notEmpty: {
		                            message: '账户不能为空'
		                        },regexp: {
		                            regexp: /^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$/,
		                            message: '请输入正确的账户'
		                        },
		                        stringLength: {
		                            min: 11,
		                            max: 11,
		                            message: '账户长度必须在11位'
		                        }
		                    }
		                },
		                tpwd: {
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
		                }, 
		                tname: {
		                    message: '姓名验证失败',
		                    validators: {
		                        notEmpty: {
		                            message: '密码不能为空'
		                        },regexp: {
		                            regexp: /^[\u4e00-\u9fa5]{0,4}$/,
		                            message: '姓名必须是中文'
		                        },
		                        stringLength: {
		                            min: 2,
		                            max: 4,
		                            message: '姓名长度必须在2到4位之间'
		                        }
		                    }
		                }, 
		                tphone: {
		                    message: '电话号码验证失败',
		                    validators: {
		                        notEmpty: {
		                            message: '电话号码不能为空'
		                        },regexp: {
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
		                tsource: {
		                    message: '教育机构验证失败',
		                    validators: {
		                        notEmpty: {
		                            message: '教育机构不能为空'
		                        },
		                        stringLength: {
		                            min: 6,
		                            max: 50,
		                            message: '教育机构长度必须在6到20位之间'
		                        }
		                    }
		                }, 
		            }
		        });
		        $('#updateteacher').bootstrapValidator({
		            message: 'This value is not valid',
		            feedbackIcons: {
		            valid: 'glyphicon glyphicon-ok',
		            invalid: 'glyphicon glyphicon-remove',
		            validating: 'glyphicon glyphicon-refresh'
		                    },
		            fields: {
		                //账户
		                tnum: {
		                    message: '账户验证失败',
		                    validators: {
		                        notEmpty: {
		                            message: '账户不能为空'
		                        },regexp: {
		                            regexp: /^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$/,
		                            message: '请输入正确的账户'
		                        },
		                        stringLength: {
		                            min: 11,
		                            max: 11,
		                            message: '账户长度必须在11位'
		                        }
		                    }
		                },
		                tpwd: {
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
		                }, 
		                tname: {
		                    message: '姓名验证失败',
		                    validators: {
		                        notEmpty: {
		                            message: '姓名不能为空'
		                        },regexp: {
		                            regexp: /^[\u4e00-\u9fa5]{0,4}$/,
		                            message: '姓名必须是中文'
		                        },
		                        stringLength: {
		                            min: 2,
		                            max: 4,
		                            message: '姓名长度必须在2到4位之间'
		                        }
		                    }
		                }, 
		                tphone: {
		                    message: '电话号码验证失败',
		                    validators: {
		                        notEmpty: {
		                            message: '电话号码不能为空'
		                        },regexp: {
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
		                tsource: {
		                    message: '教育机构验证失败',
		                    validators: {
		                        notEmpty: {
		                            message: '教育机构不能为空'
		                        },
		                        stringLength: {
		                            min: 6,
		                            max: 50,
		                            message: '教育机构长度必须在6到20位之间'
		                        }
		                    }
		                }, 
		                 
		            }
		        });
		    }
		function div_danger(tid) {
			$("#div_danger").modal();
			$("#ojbk").empty();
			var a = $("<a></a>").addClass("btn btn btn-primary").attr("href",
					"deleteTeacher?tid=" + tid).append("确认");
			var button = $("<button></button>").addClass("btn btn-danger")
					.attr({
						"type" : "button",
						"data-dismiss" : "modal"
					}).append("取消");

			$("#ojbk").append(a).append(button);
		}

		//图片预览
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
						200, 150);
				status = ('rect:' + rect.top + ',' + rect.left + ','
						+ rect.width + ',' + rect.height);
				div.innerHTML = "<div id=divhead style='width:"+rect.width+"px;height:"+rect.height+"px;margin-top:"+rect.top+"px;"+sFilter+src+"\"'></div>";
			}
		}
		function uppreviewImage(file) {
			var MAXWIDTH = 200;
			var MAXHEIGHT = 150;
			var div = document.getElementById('uppreview');
			if (file.files && file.files[0]) {
				div.innerHTML = '<img id=upimghead onclick=$("#uppreviewImg").click()>';
				var img = document.getElementById('upimghead');
				img.onload = function() {
					var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT,
							200, 150);
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
				div.innerHTML = '<img id=upimghead>';
				var img = document.getElementById('upimghead');
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

	<div class="modal fade" tabindex="-1" role="dialog" id="myModal">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">添加教师信息</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<form action="insertOne" id="addteacher" method="post"
							enctype="multipart/form-data">
							<div class="col-md-6">
								<div class="form-group">
									<div id="preview">
										<img id="imghead" border="0"
											src="${pageContext.request.contextPath}/image/teacher/1.jpg"
											width="150" height="150" onclick="$('#previewImg').click();" />
									</div>
									<input type="file" onchange="previewImage(this)"
										style="display: none;" id="previewImg" name="photo" />
								</div>
								<div class="form-group" style="margin-top: 40px">
									<label for="exampleInputNum1">账号</label> <input type="text"
										class="form-control" id="exampleInputNum1"
										placeholder="Account" name="tnum" data-bv-trigger="blur" />
								</div>
								<div class="form-group" style="margin-top: 40px">
									<label for="exampleInputPassword1">密码</label> <input
										type="password" class="form-control"
										id="exampleInputPassword1" placeholder="Password" name="tpwd" />
								</div>
								<!-- <div class="checkbox">
									<label> <input type="checkbox" onclick="show()" /> 填写详细信息
									</label>
								</div> -->
							</div>

							<div class="col-md-6" style="border-left: 1px solid #e5e5e5">
								<div style="display: block;" id="detail">
									<div class="form-group">
										<label for="exampleInputName1">姓名</label> <input type="text"
											class="form-control" id="exampleInputName1"
											placeholder="Name" name="tname" />
									</div>
									<div class="form-group">
										<label for="exampleInputPhone1">电话号码</label> <input
											type="text" class="form-control" id="exampleInputPhone1"
											placeholder="Phone" name="tphone" />
									</div>
									<div class="form-group">
										<label for="exampleInputSourse1">教育机构/地址</label> <input
											type="text" class="form-control" id="exampleInputSourse1"
											placeholder="Education" name="tsource" />
									</div>
									<div class="form-group">
										<label for=exampleInputFile1>个人简介</label>
										<textarea class="form-control" id="exampleInputFile1" rows="4"
											name="tinfo"></textarea>
									</div>
								</div>
								<div class="modal-footer" style="border: 0px">
									<input type="submit" value="保存" class="btn btn-primary" />
									<button type="button" class="btn btn-danger"
										data-dismiss="modal">关闭</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>


	<div class="modal fade" tabindex="-1" role="dialog" id="div_warning">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">修改教师信息</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-md-12">
							<form action="updateteacherDetail" id="updateteacher"
								method="post">
								<div class="form-group" id="tids"></div>

								<div class="form-group">
									<label for="exampleInputName2">姓名</label> <input type="text"
										class="form-control" id="exampleInputName2" placeholder="Name"
										name="tname" />
								</div>
								<div class="form-group">
									<label for="exampleInputPhone2">电话号码</label> <input type="text"
										class="form-control" id="exampleInputPhone2"
										placeholder="Phone" name="tphone" />
								</div>
								<div class="form-group">
									<label for="exampleInputSourse2">教育机构</label> <input
										type="text" class="form-control" id="exampleInputSourse2"
										placeholder="Education" name="tsource" />
								</div>
								<div class="form-group">
									<div id="uppreview">
										<img id="upimghead" border="0"
											src="${pageContext.request.contextPath}/image/teacher/1.jpg"
											width="150" height="150"
											onclick="$('#uppreviewImg').click();" />
									</div>
									<input type="file" onchange="uppreviewImage(this)"
										style="display: none;" id="uppreviewImg" name="tphoto" />
								</div>
								<div class="form-group">
									<label for="exampleInputFile2">个人简介</label>
									<textarea class="form-control" id="exampleInputFile2" rows="4"
										name="tinfo"></textarea>
								</div>

								<div class="modal-footer">
									<input type="submit" value="保存" class="btn btn-primary" />
									<button type="button" class="btn btn-danger"
										data-dismiss="modal">关闭</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>




	<div class="modal fade" tabindex="-1" role="dialog" id="div_danger">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">确定删除？</h4>
				</div>
				<center>
					<div class="modal-body" id="ojbk"></div>
				</center>
			</div>
		</div>
	</div>
</body>
</html>
