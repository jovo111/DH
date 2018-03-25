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
.class-div{
	padding:20px 0;
}

.image{
	width:100%
}

.p1{
	overflow: hidden;
	text-overflow: ellipsis;
	display: -webkit-box;
	-webkit-line-clamp: 1;
	-webkit-box-orient: vertical;
	height: 30px;
	color: #4c4c4c;
	font-size: 20px;
}

.p2{
	overflow: hidden;
	text-overflow: ellipsis;
	display: -webkit-box;
	-webkit-line-clamp: 2;
	-webkit-box-orient: vertical;
	height: 36px;
	color: #9e9e9e;
}
</style>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<h2>
					课堂信息&nbsp;<small>课堂信息</small>
				</h2>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<ol class="breadcrumb">
					<li><a href="#">Home</a></li>
					<li class="active">CourseInfo</li>
				</ol>
			</div>
		</div>

		<!-- 课程类型 -->
		<div class="row">
			<div class="col-md-12">
				<ul class="nav nav-tabs" id="ulis">
					
				</ul>
			</div>
		</div>


		<!-- 课程 -->
		<div class="row class-div" id="divClass">
			
		</div>
		
		<div class="row">
			<div class="col-md-8"></div>

			<div class="col-md-4">
				<nav aria-label="Page navigation" id="page_nav_area"></nav>
			</div>
		</div>
		
	</div>
	
	
	
	<script type="text/javascript">
	$(function(){
		show(1,1);
	});
	
	
	function show(pn,typeid){
		$.ajax({
			url : "${pageContext.request.contextPath}/admin/courseTypes",
			data : "id="+typeid,
			type : "GET",
			success : function(result) {
				console.log(result);
				build_ul(result);
				course(pn,typeid);
			}
		});
	}	
		
		//课程类型
		function build_ul(result){
			$("#ulis").empty();
			var users=result.extend.courseTypes;
			$.each(users,function(index,item){
				var aaa=$("<a></a>").append(item.typename).attr({"href":"#","onclick":"show(1,"+item.typeid+")"});
				
				var li=$("<li></li>").append(aaa)
				.attr("role","presentation")
				.appendTo("#ulis");
				
				
				
				if(result.extend.id==item.typeid){
					li.addClass("active");
				} 
				
			});
		}
		
		
		
		
		//课程
		function course(pn,typeid){
			$.ajax({
				url : "${pageContext.request.contextPath}/admin/courses",
				data : "pn="+pn+"&typeid="+typeid,
				type : "POST",
				success : function(result) {
					console.log(result);
					build_view(result);
					build_page_nav(result,typeid);
					pageInfo_p(result);
				}
			});
		}
		
		function build_view(result){
			$("#divClass").empty();
			var users=result.extend.pageInfo.list;
			$.each(users,function(index,item){
				var img=$("<img>").attr("src","${pageContext.request.contextPath}/image/class1.jpg").addClass("image").addClass("thumbnail");
				var aimg=$("<a></a>").append(img).attr("href","${pageContext.request.contextPath}/admin/courseProfile?cid="+item.cid);
				
				var primary=$("<a></a>").append("详情").addClass("btn btn-primary").attr({"role":"button","href":"${pageContext.request.contextPath}/admin/courseProfile?cid="+item.cid});
				var danger=$("<a></a>").append("编辑").addClass("btn btn-danger").attr({"role":"button","href":"#"});
				var h3=$("<p></p>").append(item.cname).addClass("p1");
				var p1=$("<p></p>").append(item.cinfo).addClass("p2");
				var p2=$("<p></p>").append(primary,"&emsp;",danger);
				var divcaption=$("<div></div>").append(h3,p1,p2).addClass("caption");
				
				var divthumbnail=$("<div></div>").append(aimg,divcaption).addClass("thumbnail");
				
				$("<div></div>").append(divthumbnail)
				.addClass("col-sm-6 col-md-2")
				.appendTo("#divClass");
			});
		}
		
		function build_page_nav(result,typeid){
			$("#page_nav_area").empty();
			
			var ul=$("<ul></ul>").addClass("pagination pagination-lg");
			//<li class="previous"><a href="#"><span aria-hidden="true">&larr;</span> Older</a></li>
			var orderPageLi=$("<li></li>").
			append($("<a></a>").append($("<span></span>").append("&larr;")).append("Older").attr("href","#")).addClass("previous");		
			
			var newerPageLi=$("<li></li>").
			append($("<a></a>").append($("<span></span>").append("Newer")).append("&rarr;").attr("href","#")).addClass("next");
			
			if(result.extend.pageInfo.hasPreviousPage==false){
				orderPageLi.addClass("disabled");
			}else{
				orderPageLi.click(function(){
					course(result.extend.pageInfo.pageNum-1,typeid);
				});
			}
			
			if(result.extend.pageInfo.hasNextPage==false){
				newerPageLi.addClass("disabled");
			}else{
				newerPageLi.click(function(){
					course(result.extend.pageInfo.pageNum+1,typeid);
				});
			}
			
			ul.append(orderPageLi);
			
			$.each(result.extend.pageInfo.navigatepageNums,function(index,item){
				var num=$("<li></li>").append($("<a></a>").append(item));
				ul.append(num);
				if(result.extend.pageInfo.pageNum==item){
					num.addClass("active");
				}
				num.click(function(){
					course(item,typeid);
				});
			});
			
			ul.append(newerPageLi);
		
			ul.appendTo("#page_nav_area");
		}
		
		function pageInfo_p(result){
			$(".col-md-8").empty();
			var pageNum=result.extend.pageInfo.pageNum;//当前第几页
			var pages=result.extend.pageInfo.pages;//总页数
			var p=$("<p></p>").append('共'+pages+'页').append('当前第'+pageNum+'/'+pages+'页').addClass("navbar-text");
			$("<span></span>").append(p)
			.appendTo(".col-md-8");
		}
		
		
	</script>
	
	
	
</body>
</html>