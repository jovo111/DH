<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh_CN">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="Generator" content="EditPlusÂ®">
	<meta name="Author" content="">
	<meta name="Keywords" content="">
	<meta name="Description" content="">
	<title>Document</title>
	<link href="${pageContext.request.contextPath}/css/bootstraps.min.css" rel="stylesheet" type="text/css"/>

	<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.nicescroll.min.js" type="text/javascript"></script>  

	<script>
		$(function(){
			$(".scroll1,.scroll2").niceScroll({
				cursorcolor: "rgb(68, 68, 68)", // 改变滚动条颜色，使用16进制颜色值
        		cursoropacitymin: 0, // 当滚动条是隐藏状态时改变透明度, 值范围 1 到 0
        		cursoropacitymax: 1, // 当滚动条是显示状态时改变透明度, 值范围 1 到 0
		        cursorwidth: "5px", // 滚动条的宽度，单位：便素
		        cursorborder : "",  
		        cursorborderradius: "9px", // 滚动条圆角（像素）
		        scrollspeed: 120, // 滚动速度
		        mousescrollstep: 40, // 鼠标滚轮的滚动速度 (像素)
		        touchbehavior: false, // 激活拖拽滚动
		        hwacceleration: true, // 激活硬件加速
		        autohidemode: true,         
		        background: "#fff0", // 轨道的背景颜色
		        cursorminheight: 200, // 设置滚动条的最小高度 (像素)
		    });


		}); 
	</script>

	<style type="text/css">
		.scroll1{max-height: 510px;}
		.scroll2{max-height: 930px; font-size:22px;}

		.panel-body {
			padding: 0px;
		}

		.list-group-item:first-child {
			border-top-left-radius: 0px;
			border-top-right-radius: 0px;
		}

		.list1 .list-group-item{
			border-left:6px solid #a02525;
		}

		.list1 .list-group-item:hover{
			border-left:6px solid #f90505;
		}
	</style>
</head>
<body style="background:#ddd" >
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12"><h2>课时信息&nbsp;<small>课时信息</small></h2></div>
		</div>

		<div class="row">
			<div class="col-md-12">
				<ol class="breadcrumb" style="background:#ffffff">
					<li><a href="#">Home</a></li>
					<li class="active">TaskInfo</li>
				</ol>
			</div>
		</div>
		

		<!-- 左边Begin -->
		<div class="row" style="line-height: 2.2;">
			<div class="col-md-3 ">
				<!-- 课堂列表Begin -->
				<div class="panel panel-default">
					<div class="panel-heading">课堂列表</div>
					<div class="panel-body scroll1" >
						<div class="list-group list1" id="course">
							
						</div>
					</div>
				</div>
				<!-- 课堂列表End -->

				<!-- 添加课堂Begin -->
				<div class="panel panel-default">
					<div class="panel-body" style="padding:20px 20px">
						<div class="form-group">
							<label for="exampleInputText"><h4>添加章节</h4></label>
						</div>
						<form action="insertTask" method="post">
							<div class="form-group">
								<label for="exampleInputText" id="types" >所属：</label>
								<input type="hidden" name="cid" id="cids" ><!-- 根据此cid来添加课时列表的类型 -->
								<input type="hidden" name="typeid" value=${modelId } ><!-- 将typeid一起提交过去，继承查询此课堂类型 -->
								
							</div>
							<div class="form-group">
								<label for="exampleInputText">章节名称</label>
								<input type="text" class="form-control" placeholder="ChapterName" name="task" >
							</div>
							<div class="form-group">
								<label for="exampleInputFile">视频</label>
								<input type="file" name="videopath" >
							</div>
							<button type="submit" class="btn btn-success">提交</button>
						</form>
					</div>
				</div>
				<!-- 添加课堂End -->
				
			</div>
			<!-- 左边End -->

			<!-- 右边Begin -->
			<div class="col-md-9">
				<!--课时列表Begin -->
				<div class="panel panel-default">
					<div class="panel-heading">课时列表</div>
					<div class="panel-body scroll2">
						<div class="list-group list2" id="taskinfo">
							
						</div>
					</div>
				</div>
				<!--课时列表End -->
			</div>
			<!-- 右边End -->
		</div>
	</div>
</body>
	<script type="text/javascript">
		
		$(function(){
			load();
			task('${Top}');
			types('${TopName}');
		})
		
		function types(cname){
			$("#types").empty();
			$("#types").append("所属："+cname);//设置章节名
		
		}
		
		function load(){
			$.ajax({
				url : "${pageContext.request.contextPath}/admin/tasks",
				data : "typeid="+"${modelId}",
				type : "get",
				success : function(result) {
					console.log(result);
					build_course(result);
				}
			});
		}
		
		function build_course(result){
			$("#course").empty();
			var users = result.extend.course;
			$.each(users,function(index,item){
				var span=$("<span></span>").addClass("badge").append(item.count);
				var a=$("<a></a>").addClass("list-group-item")
						.attr({"href":"#","onclick":"task("+item.cid+"),types('"+item.cname+"')"})
						.append(span).append(item.cname);
						
				$("#course").append(a);
			});
		}
		
		function task(cid){
			$("#cids").val(cid);//设置隐藏框的cid，用于添加
			$.ajax({
				url : "${pageContext.request.contextPath}/admin/taskinfo",
				data : "cid="+cid,
				type : "GET",
				success : function(result) {
					console.log(result);
					build_a(result);
				}
			});
		}
		function build_a(result){
			$("#taskinfo").empty();
			var users = result.extend.task;
			$.each(users,function(index,item){
				var span1=$("<span></span>").addClass("glyphicon glyphicon-play-circle").attr("aria-hiddenn",true);
				var span2=$("<span></span>").addClass("glyphicon glyphicon glyphicon-remove text-right")
					.attr({"style":"float:right;","aria-hidden":true,"onclick":"deleteTask("+item.taskid+","+item.cid+")"});
				
				$("<a></a>").addClass("list-group-item")
				.attr({"href":"#","ondblclick":"updateTask("+item.taskid+","+item.cid+")"})
				.append(span1)
				.append(item.task)
				.append(span2)
				.appendTo("#taskinfo");
			});
		}
		
		//删除课时
		function deleteTask(taskid,cid){
			$("#div_danger").modal();
			$("#ojbk").empty();
			var a=$("<a></a>").addClass("btn btn btn-primary")
				.attr("href","deleteTask?taskid="+taskid+"&cid="+cid+"&typeid=${modelId}")
				.append("确认");
			var button=$("<button></button>").addClass("btn btn-danger")
				.attr({"type":"button","data-dismiss":"modal"}).append("取消");
			
			$("#ojbk").append(a)
			.append(button);
		}
		
		function updateTask(taskid,cid){
			$("#div_warning").modal();
			$("#taskids").empty();
			var taskid=$("<input>").attr({"type":"hidden","name":"taskid","value":taskid});
			$("#taskids").append(taskid);
			
			$("#taskTypes").val(cid);
			
		}
		
		
	</script>
	
	
	<div class="modal fade" tabindex="-1" role="dialog" id="div_warning">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">修改课时信息</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-md-12">
							<form action="updateTask" method="post" >
								<div class="form-group" id="taskids" >
									
								</div>
								<input type="hidden" name="typeid" value=${modelId } >
								<div class="form-group">
									<label for="exampleInputEmail1">类型编号</label> 
									<input type="text"
										class="form-control" 
										placeholder="Name" name="cid" id="taskTypes">
								</div>
								<div class="form-group">
									<label for="exampleInputEmail1">课时</label> <input type="text"
										class="form-control" 
										placeholder="Name" name="task">
								</div>
				
								<div class="form-group">
									<label for="exampleInputFile"></label> <input type="file" 
										id="exampleInputFile" name="videopath">
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
	
	
	<div class="modal fade" tabindex="-1" role="dialog" id="div_danger" >
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
	