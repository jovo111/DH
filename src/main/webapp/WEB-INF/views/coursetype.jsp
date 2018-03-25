<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="zh_CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Document</title>
	
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.2.1.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/bootstraps.min.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<style>
	.content button{
		font-size:30px;
		margin:20px 5px 0px 0px;
	}
	.content button span{
		font-size:14px;
	}
</style>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<h2>
					课堂类型信息&nbsp;<small>课堂类型信息</small>
				</h2>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<ol class="breadcrumb">
					<li><a href="#">Home</a></li>
					<li class="active">CourseTypeInfo</li>
				</ol>
			</div>
		</div>

		<div class="row">
			<div class="col-md-4">
				<form class="form-inline" action="insertType"
					style="border-bottom: 1px solid #c5c0bc; padding-bottom: 10px;">
					<div class="form-group">
						<input type="text" class="form-control" id="exampleInputName2"
							placeholder="Text" name="typename" >
					</div>
					
					<input type="button" class="btn btn-info" id="addButton" value="查询" />
					<button type="submit" class="btn btn-warning" >添加</button>
				</form>
			</div>
		</div>

		<div class="row">
			<div class="col-md-12 content" id="div_button">
				
			</div>
		</div>
	</div>
	
</body>
	<script type="text/javascript">
		$(function(){
			$.ajax({
				url : "${pageContext.request.contextPath}/admin/courseTypes",
				type : "GET",
				success : function(result) {
					console.log(result);
					build_button(result);
				}
			});
		});
		
		function build_button(result){
			
			$("#div_button").empty();
			var users=result.extend.courseTypes;
			$.each(users,function(index,item){
				
				$.ajax({
					url : "${pageContext.request.contextPath}/admin/queryCount",
					data : "typeid="+item.typeid,
					type : "GET",
					success : function(results) {
						build_types(results);
					}
				});
				
				function build_types(results){
					var span1=$("<span></span>").addClass("badge").append(results.extend.count);
					var span2=$("<span></span>").addClass("glyphicon glyphicon-file").attr("onclick","div_view("+item.typeid+",'"+item.typename+"')");
					var span3=$("<span></span>").addClass("glyphicon glyphicon-pencil").attr("onclick","div_update("+item.typeid+")");
					var span4=$("<span></span>").addClass("glyphicon glyphicon-trash").attr("onclick","div_delete("+results.extend.count+","+item.typeid+")");
				
					var random=Math.random()*10;
					
					var button=$("<button></button>").append(item.typename," ")
					.append(span1)
					.append("&emsp;&emsp;")
					.append(span2," ")
					.append(span3," ")
					.append(span4)
					.appendTo("#div_button");
					if(random<=2){
						button.addClass("btn btn-info");
					}else if(random>=3 && random<=5){
						button.addClass("btn btn-success");
					}else if(random>=6 && random<=8){
						button.addClass("btn btn-danger");
					}else{
						button.addClass("btn btn-warning");
					}
				}
				
			});
		}
		
		
		$("#addButton").click(function(){
			var typename=$("#exampleInputName2").val();
			if(typename!=""){
				$.ajax({
					url : "${pageContext.request.contextPath}/admin/getLikeAll",
					data : "typename="+typename,
					type : "GET",
					success : function(result) {
						console.log(result);
						build_button(result);
					}
				});
			}else{
				$.ajax({
					url : "${pageContext.request.contextPath}/admin/courseTypes",
					type : "GET",
					success : function(result) {
						console.log(result);
						build_button(result);
					}
				});
			}
		});
		
		//详情信息
		function div_view(typeid,typename){
			$("#div_view").modal();
			$("#viewid").empty();
			$("#viewname").empty();
			var id=$("<label></label>").attr("for","exampleInputEmail1").append("类型编号：").append(typeid);
			var name=$("<label></label>").attr("for","exampleInputEmail1").append("类型名称：").append(typename);
			$("#viewid").append(id);
			$("#viewname").append(name);
		}
		
		//修改课堂类型
		function div_update(typeid){
			$("#div_update").modal();
			$("#typeid").empty();
			//添加一个隐藏框：typeid 用来修改
			var input=$("<input>").addClass("form-control").attr({"type":"hidden","name":"typeid","value":typeid});
			
			$("#typeid").append(input);
		}
		
		//删除课堂类型
		function div_delete(count,typeid){
			if(count!=0){
				alert("删除失败，请先将课堂信息删除")
			}else{
				$("#div_delete").modal();
				$("#ojbk").empty();
				var a=$("<a></a>").addClass("btn btn btn-primary")
					.attr("href","deleteType?typeid="+typeid).append("确认");
				var button=$("<button></button>").addClass("btn btn-danger")
					.attr({"type":"button","data-dismiss":"modal"}).append("取消");
				
				$("#ojbk").append(a)
				.append(button);
			}
		}
		
		
	</script>
	
	
	<div class="modal fade" tabindex="-1" role="dialog" id="div_view">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">详情信息</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-md-12">
								<div class="form-group" id="viewid">
									
								</div>
								<div class="form-group" id="viewname">
									
								</div>

								<div class="modal-footer">
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
	
	
	<div class="modal fade" tabindex="-1" role="dialog" id="div_update">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">修改课堂类型信息</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-md-12">
							<form action="updateType" method="post">
								<div class="form-group" id="typeid">
									
								</div>
								<div class="form-group">
									<label for="exampleInputEmail1">课堂类型名称</label> <input type="text"
										class="form-control" id="exampleInputEmail1"
										placeholder="Name" name="typename">
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
	
	
	<div class="modal fade" tabindex="-1" role="dialog" id="div_delete" >
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
					<div class="modal-body" id="ojbk">
						
					</div>
				</center>
			</div>
		</div>
	</div>
	
</html>