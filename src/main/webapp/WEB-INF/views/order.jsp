<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh_CN">
<head>
<title>teacher</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/bootstraps.min.css">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/bootstrap-datetimepicker.min.css">

<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.2.1.js"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker.zh-CN.js"></script>
<style type="text/css">
* {
	font-size: 18px;
}

#d411 {
	width: 200px;
}

#d412 {
	width: 200px;
}

.panel-heading:hover {
	cursor: pointer;
}

.panel-body {
	display: none;
}

.Wdate {
	height: 34px;
	border-radius: 4px;
}

div[class^="datetimepicker-"] {
	width: 220px !important;
}

.table-condensed {
	width: 100% !important;
}
</style>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<h2>
					订单信息&nbsp;<small>订单信息</small>
				</h2>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<ol class="breadcrumb">
					<li><a href="#">Home</a></li>
					<li class="active">OrderInfo</li>
				</ol>
			</div>
		</div>


		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-info">
					<div class="panel-heading" onclick="querybtu()">
						<span class="glyphicon glyphicon-search" aria-hidden="true"></span>&nbsp;条件查询
					</div>
					<div class="panel-body" id="panel-body">
						<div class="row">
							<div class="col-md-3">
								<div class="form-group">
									<label class="control-label" for="order_id">订单编号</label> <input
										type="text" name="oid" id="oid" placeholder="Order ID"
										class="form-control">
								</div>
							</div>

							<div class="col-md-3">
								<div class="form-group">
									<label class="control-label" for="order_id">订单状态</label> <select
										class="form-control" id="isbuy">
										<option value="">全部</option>
										<option value="1">已购买</option>
										<option value="0">未购买</option>
									</select>
								</div>
							</div>

							<div class="col-md-3">
								<div class="form-group">
									<label class="control-label" for="order_id">客户</label> <input
										type="text" name="snick" id="snick" placeholder="Customer"
										class="form-control">
								</div>
							</div>

							<div class="col-md-3">
								<div class="form-group">
									<label class="control-label" for="order_id">课程</label> <input
										type="text" name="cname" id="cname" placeholder="Course"
										class="form-control">
								</div>
							</div>
							<div class="col-md-2">
								<div class="form-group">
									<br />
									<button onclick="to_Page(1,'','','','')" class="btn btn-danger">查询</button>
									<button type="reset" class="btn btn-danger"
										onclick="btureset()">清除</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-11">
				<form class="form-inline navbar-right">
					<div class="form-group">
						<label for="exampleInputName2">时间：</label>
						<div class="input-group date" id="datetimepicker1">
							<input type="text" class="form-control" id="starting" readonly>
							<div class="input-group-addon">
								<span class="glyphicon glyphicon-th"></span>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label for="exampleInputName2">~</label>
						<div class="input-group date" id="datetimepicker2">
							<input type="text" class="form-control" id="ending" readonly>
							<div class="input-group-addon">
								<span class="glyphicon glyphicon-th"></span>
							</div>
						</div>
						<button type="button" onclick="to_time(1,'','')"
							class="btn btn-danger">查询</button>
						<button type="button" onclick="timereset()" class="btn btn-danger">清除</button>
					</div>
				</form>
			</div>
		</div>

		<div class="row">
			<div class="col-md-12">
				<table class="table table-striped table-hover" id="table1">
					<thead>
						<tr>
							<td>OrderId</td>
							<td>Customer</td>
							<td>Course</td>
							<td>Price</td>
							<td>DataAdd</td>
							<td>Status</td>
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
</body>

<script type="text/javascript">
	$(function() {
		to_Page(1, "", "", "", "");

		$("#datetimepicker1").datetimepicker({
			format : 'yyyy-mm-dd',
			autoclose : true,
			todayBtn : true,
			todayHighlight : true,
			endDate : new Date(),
			showMeridian : true,
			pickerPosition : "bottom-left",
			startView : 2,
			minView : 2
		}).on('changeDate', function(ev) {
			var starttime = $("#starting").val();
			$("#datetimepicker2").datetimepicker('setStartDate', starttime);
		});

		$("#datetimepicker2").datetimepicker({
			format : 'yyyy-mm-dd',
			autoclose : true,
			todayBtn : true,
			todayHighlight : true,
			endDate : new Date(),
			showMeridian : true,
			pickerPosition : "bottom-left",
			startView : 2,
			minView : 2
		}).on('changeDate', function(ev) {
			var endtime = $("#ending").val();
			$("#datetimepicker1").datetimepicker('setEndDate', endtime)
		});

	});
	function select_one(oid) {

		$.ajax({
			url : "${pageContext.request.contextPath}/admin/select_one",
			data : "oid=" + oid,

			type : "POST",
			success : function(result) {
				console.log(result);
				$("#primary").modal();
				var oid = result.extend.list[0].oid;
				var status = result.extend.list[0].isbuy;
				var otime = result.extend.list[0].otime;
				var cname = result.extend.list[0].course.cname;
				var snick = result.extend.list[0].studentDetail.snick;
				var cprice = result.extend.list[0].course.cprice;
				$("#status_one").attr("value", status);
				$("#oid_one").attr("value", oid);
				$("#cname_one").attr("value", cname);
				$("#otime_one").attr("value", otime);
				$("#snick_one").attr("value", snick);
				$("#cprice_one").attr("value", cprice);
			}
		});
	}
	function to_time(pn, starting, ending) {
		var starting=$("#starting").val();
		var ending=$("#ending").val();
		
		$.ajax({
			url : "${pageContext.request.contextPath}/admin/totime",
			data : "pn=" + pn + "&starting=" + starting + "&ending=" + ending,

			type : "POST",
			success : function(result) {
				console.log(result);
				build_table(result);
				build_page_nav(result);
				pageInfo_p(result);
			}
		});
	}
	function to_Page(pn, oid, isbuy, snick, cname) {
		var oid = $("#oid").val();
		var isbuy= $("#isbuy").val();
		var snick=$("#snick").val();
		var cname=$("#cname").val();
		
		$.ajax({
			url : "${pageContext.request.contextPath}/admin/orderss",
			data : "pn=" + pn + "&oid=" + oid + "&isbuy=" + isbuy + "&snick="
					+ snick + "&cname=" + cname,

			type : "POST",
			success : function(result) {
				console.log(result);
				build_table(result);
				build_page_nav(result);
				pageInfo_p(result);
			}
		});
	}
	function build_table(result) {
		$("#table1 tbody").empty();
		var users = result.extend.pageInfo.list;
		$.each(users, function(index, item) {
			var OrderId = $("<td></td>").append(item.oid);
			var Customer = $("<td></td>").append(item.studentDetail.snick);
			var Course = $("<td></td>").append(item.course.cname);
			var Price = $("<td></td>").append(item.course.cprice);
			var DataAdd = $("<td></td>").append(item.otime);
			var span = $("<span></span>");
			if (item.isbuy == 1) {
				span.append("已购买").addClass("label label-success");
			} else {
				span.append("未购买").addClass("label label-warning");
			}
			var Status = $("<td></td>").append(span);

			var primary = $("<button></button>").append("详情").addClass(
					"btn btn-primary").attr("onclick",
					"select_one(" + item.oid + ")");
			var warning = $("<button></button>").append("编辑").addClass(
					"btn btn-warning").attr("onclick",
					"div_warning(" + item.oid + ")");
			;
			var danger = $("<button></button>").append("删除").addClass(
					"btn btn-danger").attr("onclick",
					"div_danger(" + item.oid + ")");
			;
			var operation = $("<td></td>").append(primary, " ", warning, " ",
					danger);

			$("<tr></tr>").append(OrderId).append(Customer).append(Course)
					.append(Price).append(DataAdd).append(Status).append(
							operation).appendTo("#table1 tbody");
		});
	}
	function pageInfo_p(result) {
		$(".col-md-8").empty();
		var pageNum = result.extend.pageInfo.pageNum;//当前第几页
		var pages = result.extend.pageInfo.pages;//总页数
		var p = $("<p></p>").append('共' + pages + '页&emsp;').append(
				'当前第' + pageNum + '/' + pages + '页').addClass("navbar-text");
		$("<span></span>").append(p).appendTo(".col-md-8");
	}

	function build_page_nav(result) {
		$("#page_nav_area").empty();

		var ul = $("<ul></ul>").addClass("pagination pagination-lg");
		//<li class="previous"><a href="#"><span aria-hidden="true">&larr;</span> Older</a></li>
		var orderPageLi = $("<li></li>").append(
				$("<a></a>").append($("<span></span>").append("&larr;"))
						.append("Older").attr("href", "#"))
				.addClass("previous");

		var newerPageLi = $("<li></li>").append(
				$("<a></a>").append($("<span></span>").append("Newer")).append(
						"&rarr;").attr("href", "#")).addClass("next");

		if (result.extend.pageInfo.hasPreviousPage == false) {
			orderPageLi.addClass("disabled");
		} else {
			orderPageLi.click(function() {
				to_Page(result.extend.pageInfo.pageNum - 1);
			});
		}

		if (result.extend.pageInfo.hasNextPage == false) {
			newerPageLi.addClass("disabled");
		} else {
			newerPageLi.click(function() {
				to_Page(result.extend.pageInfo.pageNum + 1);
			});
		}

		ul.append(orderPageLi);

		$.each(result.extend.pageInfo.navigatepageNums, function(index, item) {
			var num = $("<li></li>").append($("<a></a>").append(item));
			ul.append(num);
			if (result.extend.pageInfo.pageNum == item) {
				num.addClass("active");
			}
			num.click(function() {
				to_Page(item);
			});
		});

		ul.append(newerPageLi);

		ul.appendTo("#page_nav_area");
	}
	function btureset() {
		$("#oid").val("").focus();
		$("#isbuy").val("");
		$("#snick").val("");
		$("#cname").val("");
		to_Page(1, '', '', '', '');
	}
	function timereset() {
		$("#starting").val("").focus();
		$("#ending").val("");
		to_time(1, '', '');
	}
	function querybtu() {
		$("#panel-body").toggle();
	}
	function primary(oid) {

		$("#primary").modal();
		$("#oids").empty();
		var input = $("<input>").addClass("form-control").attr({
			"type" : "hidden",
			"name" : "oid",
			"value" : oid
		});

		$("#oids").append(input);
	}
	function div_warning(sid) {
		$("#div_warning").modal();
		$("#sids").empty();
		var input = $("<input>").addClass("form-control").attr({
			"type" : "hidden",
			"name" : "sid",
			"value" : sid
		});

		$("#sids").append(input);
	}

	function div_danger(sid) {
		$("#div_danger").modal();
		$("#ojbk").empty();
		var a = $("<a></a>").addClass("btn btn btn-primary").attr("href",
				"deleteStudent?sid=" + sid).append("确认");
		var button = $("<button></button>").addClass("btn btn-danger").attr({
			"type" : "button",
			"data-dismiss" : "modal"
		}).append("取消");

		$("#ojbk").append(a).append(button);
	}
</script>
<!-- 查询订单信息 -->
<div class="modal fade" tabindex="-1" role="dialog" id="primary">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">订单信息</h4>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="col-md-4">
						<div class="form-group">
							<label for="exampleInputEmail1">ID</label> <input type="text"
								readonly="readonly" class="form-control" name="oid_one"
								id="oid_one" />
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<label for="exampleInputEmail1">客户</label> <input type="text"
								readonly="readonly" class="form-control" name="snick_one"
								id="snick_one" />
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<label for="exampleInputEmail1">课程</label> <input type="text"
								readonly="readonly" class="form-control" name="cname_one"
								id="cname_one" />
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<label for="exampleInputEmail1">价格</label> <input type="text"
								readonly="readonly" class="form-control" name="cprice_one"
								id="cprice_one" />
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<label for="exampleInputEmail1">时间</label> <input type="text"
								readonly="readonly" class="form-control" name="otime_one"
								id="otime_one" />
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<label for="exampleInputEmail1">状态</label> <input type="text"
								readonly="readonly" class="form-control" placeholder="Name"
								name="status_one" id="status_one" />
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-danger" data-dismiss="modal">关闭</button>
					</div>

				</div>
			</div>

		</div>
	</div>
</div>

<!-- 修改订单 -->
<div class="modal fade" tabindex="-1" role="dialog" id="div_warning">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">修改订单信息</h4>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="col-md-12">
						<form action="updateStudent" method="post">
							<div class="form-group" id="oids"></div>
					</div>
					</form>
				</div>
			</div>
		</div>

	</div>
</div>
</div>
<!-- 删除 -->
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
</html>