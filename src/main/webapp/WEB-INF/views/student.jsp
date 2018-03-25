<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>student</title>
<link href="${pageContext.request.contextPath}/css/bootstraps.min.css"
	rel="stylesheet" type="text/css" />

<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.2.1.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrapValidator.min.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrapValidator.min.js"></script>
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
					学生信息&nbsp;<small>学生信息</small>
				</h2>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<ol class="breadcrumb">
					<li><a href="#">Home</a></li>
					<li class="active">StudentInfo</li>
				</ol>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-info">
					<div class="panel-heading">
						<span class="glyphicon glyphicon-menu-hamburger"
							aria-hidden="true"></span>&nbsp;学生信息表
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-md-1">
								<button type="button" class="btn btn-success btn-lg"
									onclick="add()">
									添加学生信息&nbsp;<span class="glyphicon glyphicon-plus"
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
									<td>Nick</td>
									<td>Balance</td>
									<td>Operation</td>
								</tr>
							</thead>
							<tbody></tbody>
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
				url : "${pageContext.request.contextPath}/admin/students",
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
				url : "${pageContext.request.contextPath}/admin/students",
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
												"${pageContext.request.contextPath}"+item.studentDetail.sphoto)
										.addClass("img-rounded");
								var sphoto = $("<td></td>").append(img);
								var snum = $("<td></td>").append(item.snum);
								var snick = $("<td></td>").append(
										item.studentDetail.snick);
								var sbalance = $("<td></td>").append(
										item.studentDetail.sbalance);
								var primary=$("<a></a>").append("详情").addClass("btn btn-primary").
										attr({"role":"button","href":"${pageContext.request.contextPath}/admin/studentProfile?sid="+item.sid});
								var warning = $("<button></button>").append(
										"编辑").addClass("btn btn-warning").attr("onclick","div_warning(this,"+item.sid+")");
								var danger = $("<button></button>")
										.append("删除")
										.addClass("btn btn-danger").attr("onclick","div_danger("+item.sid+")");
								var operation = $("<td></td>").append(primary," ",
										warning," ", danger);

								$("<tr></tr>").append(sphoto).append(snum)
										.append(snick).append(
												sbalance).append(operation)
										.appendTo("#table1 tbody");

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

		function add() {
			
			$("input[id='exampleInputNum1']").val("");
			$("input[id='exampleInputPassword1']").val("");
			$("input[id='exampleInputNick1']").val("");
			$("input[id='exampleInputBalance1']").val("");
			$("input[id='exampleInputFile1']").val("");
			 $("#addstudent").data('bootstrapValidator').destroy();
		     $('#addstudent').data('bootstrapValidator', null);
		      formValidator();
			$("#myModal").modal();
		}

		function show() {
			$("#detail").toggle();
		}
		
		function div_warning(obj,sid){ 
			$("input[id='exampleInputPassword2']").val("");
			$("input[id='exampleInputNick2']").val("");
			$("input[id='exampleInputBalance']").val("");
			$("input[id='exampleInputFile2']").val("");
			$("#upstudent").data('bootstrapValidator').destroy();
		     $('#upstudent').data('bootstrapValidator', null);
		      formValidator();
		      var tds= $(obj).parent();
		      var tdss=tds.parent().find('td'); 
		      var img=(tdss.eq(0).find('img'))[0].src; 
		       
				 $('#exampleInputNick2').val(""+tdss.eq(2).text()); 
				 $('#exampleInputBalance2').val(""+tdss.eq(3).text()); 
				 $('#exampleInputFile2').attr('src',img);
			$("#div_warning").modal();
			$("#sids").empty();
			var input=$("<input>").addClass("form-control").attr({"type":"hidden","name":"sid","value":sid});
			
			$("#sids").append(input);
		}
		
		function div_danger(sid){
			$("#div_danger").modal();
			$("#ojbk").empty();
			var a=$("<a></a>").addClass("btn btn btn-primary")
				.attr("href","deleteStudent?sid="+sid).append("确认");
			var button=$("<button></button>").addClass("btn btn-danger")
				.attr({"type":"button","data-dismiss":"modal"}).append("取消");
			
			$("#ojbk").append(a)
			.append(button);
		}
		function formValidator(){
			 $("#addstudent").bootstrapValidator({
				 message: 'This value is not valid',
		            feedbackIcons: {
		            valid: 'glyphicon glyphicon-ok',
		            invalid: 'glyphicon glyphicon-remove',
		            validating: 'glyphicon glyphicon-refresh'
		                    },
		            fields: {
		            	snum: {
			                    message: '账户验证失败',
			                    validators: {
			                        notEmpty: {
			                            message: '账户不能为空'
			                        },regexp: {
			                            regexp: /^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$/,
			                            message: '请输入正确的账户(电话号码)'
			                        },
			                        stringLength: {
			                            min: 11,
			                            max: 11,
			                            message: '账户长度必须在11位'
			                        }
			                    }
			                },spwd: {
			                    message: '密码验证失败',
			                    validators: {
			                        notEmpty: {
			                            message: '密码不能为空'
			                        },regexp: {
			                            regexp: /^[A-Za-z0-9]+$/,
			                            message: '请输入正确的密码'
			                        },
			                        stringLength: {
			                            min: 6,
			                            max: 6,
			                            message: '密码长度必须在6位'
			                        }
			                    }
			                },snick: {
			                    message: '昵称验证失败',
			                    validators: {
			                        notEmpty: {
			                            message: '昵称不能为空'
			                        },regexp: {
			                            regexp: /^[\u4e00-\u9fa5]{0,}$/,
			                            message: '请输入你昵称的账户，必须为中文'
			                        },
			                        stringLength: {
			                            min: 2,
			                            max: 6,
			                            message: '账户长度必须在2到6位'
			                        }
			                    }
			                },sbalance: {
			                    message: '余额验证失败',
			                    validators: {
			                        notEmpty: {
			                            message: '余额不能为空'
			                        },regexp: {
			                            regexp: /^[0-9]+$/,
			                            message: '请输入正确的余额，必须为数字'
			                        },
			                        stringLength: {
			                            min: 1,
			                            max: 21,
			                            message: '账户长度在1到21位之间'
			                        }
			                    }
			                },sphoto: {
			                    message: '文件验证失败',
			                    validators: {
			                        notEmpty: {
			                            message: '文件不能为空'
			                        } 
			                    }
			                }
		            }
			 });
			 $("#upstudent").bootstrapValidator({
				 message: 'This value is not valid',
		            feedbackIcons: {
		            valid: 'glyphicon glyphicon-ok',
		            invalid: 'glyphicon glyphicon-remove',
		            validating: 'glyphicon glyphicon-refresh'
		                    },
		            fields: {
		            	 spwd: {
			                    message: '密码验证失败',
			                    validators: {
			                        notEmpty: {
			                            message: '密码不能为空'
			                        },regexp: {
			                            regexp: /^[A-Za-z0-9]+$/,
			                            message: '请输入正确的密码'
			                        },
			                        stringLength: {
			                            min: 6,
			                            max: 6,
			                            message: '密码长度必须在6位'
			                        }
			                    }
			                },snick: {
			                    message: '昵称验证失败',
			                    validators: {
			                        notEmpty: {
			                            message: '昵称不能为空'
			                        },regexp: {
			                            regexp: /^[\u4e00-\u9fa5]{0,}$/,
			                            message: '请输入你昵称的账户，必须为中文'
			                        },
			                        stringLength: {
			                            min: 2,
			                            max: 6,
			                            message: '账户长度必须在2到6位'
			                        }
			                    }
			                },sbalance: {
			                    message: '余额验证失败',
			                    validators: {
			                        notEmpty: {
			                            message: '余额不能为空'
			                        },regexp: {
			                            regexp: /^[0-9]+$/,
			                            message: '请输入正确的余额，必须为数字'
			                        },
			                        stringLength: {
			                            min: 1,
			                            max: 21,
			                            message: '账户长度在1到21位之间'
			                        }
			                    }
			                } 
		            }
			 });
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
					<h4 class="modal-title">添加学生信息</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-md-12">
							<form action="insertStudent" id="addstudent" method="post" enctype="multipart/form-data">
								<div class="form-group">
									<label for="exampleInputNum1">账号</label> <input type="text"
										name="snum" id="exampleInputNum1" class="form-control" placeholder="Account">
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">密码</label> <input
										type="password" id="exampleInputPassword1" name="spwd" class="form-control"
										placeholder="Password">
								</div>
								<!-- <div class="checkbox">
									<label> <input type="checkbox" onclick="show()" />
										填写详细信息
									</label>
								</div> -->
								<div style="display: block;" id="detail">
									<div class="form-group">
										<label for="exampleInputNick1">昵称</label> <input type="text"
											class="form-control" id="exampleInputNick1" name="snick" placeholder="Name">
									</div>
									<div class="form-group">
										<label for="exampleInputBalance1">余额</label> <input
											type="number" id="exampleInputBalance1" class="form-control" name="sbalance"
											placeholder="Money">
									</div>
									<div class="form-group">
										<label for="exampleInputFile">头像</label> <input type="file"
											name="sphoto" id="exampleInputFile2">
									</div>
								</div>
								<div class="modal-footer">
									<input type="submit" class="btn btn-primary" value="保存" />
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



	<div class="modal fade" tabindex="-1" role="dialog" id="div_warning">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">修改学生信息</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-md-12">
							<form action="updateStudent" method="post" id="upstudent">
								<div class="form-group" id="sids"></div>
								<div class="form-group">
									<label for="exampleInputPassword2">新密码</label> <input
										type="password" id="exampleInputPassword2" class="form-control" placeholder="Name"
										name="spwd">
								</div>
								<div class="form-group">
									<label for="exampleInputNick2">昵称</label> <input type="text"
										class="form-control" id="exampleInputNick2" placeholder="Name" name="snick">
								</div> 
								<div class="form-group">
										<label for="exampleInputBalance2">余额</label> <input
											type="number" id="exampleInputBalance2" class="form-control" name="sbalance"
											placeholder="Money">
									</div>
								<div class="form-group">
									<label for="exampleInputFile"></label> <input type="file"
										id="exampleInputFile2" name="sphoto">
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