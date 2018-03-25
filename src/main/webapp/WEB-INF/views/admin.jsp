<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>teacher</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.2.1.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/bootstraps.min.css">
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
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<h2>
					管理员信息&nbsp;<small>管理员信息</small>
				</h2>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<ol class="breadcrumb">
					<li><a href="#">Home</a></li>
					<li class="active">AdminInfo</li>
				</ol>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-info">
					<div class="panel-heading">
						<span class="glyphicon glyphicon-menu-hamburger"
							aria-hidden="true"></span>&nbsp;管理员信息表
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-md-1">
								<button type="button" class="btn btn-success btn-lg">
									添加管理员信息&nbsp;<span class="glyphicon glyphicon-plus"
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
									<td>Password</td>
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

		function to_Page(pn,example) {
			if ($("#example").val() != "") {
				example = $("#example").val();
			}

			$.ajax({
				url : "${pageContext.request.contextPath}/admin/admins",
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
				url : "${pageContext.request.contextPath}/admin/admins",
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
												"${pageContext.request.contextPath}/image/1.jpg")
										.addClass("img-rounded");
								var sphoto = $("<td></td>").append(img);
								var aid = $("<td></td>").append(item.aid);
								var aname = $("<td></td>").append(item.aname);
								var apwd = $("<td></td>").append(item.apwd);
								var primary=$("<a></a>").append("详情").addClass("btn btn-primary").attr({"role":"button","href":"${pageContext.request.contextPath}/admin/adminProfile?aid="+item.aid});
								var warning = $("<button></button>").append(
										"编辑").addClass("btn btn-warning");
								var danger = $("<button></button>")
										.append("删除")
										.addClass("btn btn-danger");
								var operation = $("<td></td>").append(primary," ",
										warning," ", danger);

								$("<tr></tr>").append(sphoto).append(aid)
										.append(aname).append(apwd).append(
												operation).appendTo(
												"#table1 tbody");

							});
		}

		function pageInfo_p(result) {
			$(".col-md-8").empty();
			var pageNum = result.extend.pageInfo.pageNum;//当前第几页
			var pages = result.extend.pageInfo.pages;//总页数
			var p = $("<p></p>").append('共' + pages + '页').append(
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
					to_Page(result.extend.pageInfo.pageNum - 1,"");
				});
			}

			if (result.extend.pageInfo.hasNextPage == false) {
				newerPageLi.addClass("disabled");
			} else {
				newerPageLi.click(function() {
					to_Page(result.extend.pageInfo.pageNum + 1,"");
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
					to_Page(item,"");
				});
			});

			ul.append(newerPageLi);

			ul.appendTo("#page_nav_area");
		}

		function primary(aid) {
			alert("abc")
			$.ajax({
				url : "${pageContext.request.contextPath}/admin/adminOne",
				data : "aid=" + aid,
				type : "GET",
				success : function(result) {
					build_div(result);
					console.log(result);
				}
			});
			$("#myModal").modal();
		}

		function build_div(result) {
			$(".modal-body").empty();
			var users = result.extend.adminOne;
			var img = $("<img>").attr({
				"src" : "${pageContext.request.contextPath}/image/1.jpg",
				"width" : "200px",
				"height" : "200px"
			}).addClass("img-rounded");
			var aphoto = $("<p></p>").append(img);
			var aid = $("<p></p>").append(users.aid);
			var aname = $("<p></p>").append(users.aname);
			var apwd = $("<p></p>").append(users.apwd);

			$("<div></div>").append(aphoto).append(aid).append(aname).append(
					apwd).appendTo(".modal-body");

		}
	</script>

	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">详细信息</h4>
				</div>
				<div class="modal-body"></div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">
						<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭
					</button>
					<button type="button" id="btn_submit" class="btn btn-primary"
						data-dismiss="modal">
						<span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>保存
					</button>
				</div>
			</div>
		</div>
	</div>

</body>
</html>