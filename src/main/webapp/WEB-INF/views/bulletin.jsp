<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta name="Generator" content="EditPlus®">
<meta name="Author" content="JOVO">
<meta name="Keywords" content="">
<meta name="Description" content="">
<title>Document</title>

<link href="${pageContext.request.contextPath}/css/bootstraps.min.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/fullcalendar.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/css/fullcalendar.print.min.css"
	rel="stylesheet" media="print">
<link href="${pageContext.request.contextPath}/css/animate.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/sweetalert2.min.css"
	rel="stylesheet">

<style type="text/css">
#calendar {
	max-width: 1500px;
	margin: 20px auto;
}

#warn {
	padding: 2px;
	background-color: #ffffff;
	border-color: #ffffff;
}

.label {
	font-size: 16px;
	line-height: 2;
}

.modal-content {
	background: #000000;
	color: #ffffff
}

.modal-footer button {
	font-size: 16px;
	color: #ffffff;
}

.modal-footer button:hover {
	text-decoration: none;
	color: #ffffff;
}

.swal2-modal {
	border-radius: 30px;
}

.swal2-confirm {
	margin-right: 20px;
}

.swal2-icon.swal2-success::before {
	background: rgba(0, 0, 0, 0);
}

.swal2-icon.swal2-success::after {
	background: rgba(0, 0, 0, 0);
}

.swal2-icon.swal2-success .fix {
	background: rgba(0, 0, 0, 0);
}
</style>
</head>
<body style="background: #ddd">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<h2>
					公告信息&nbsp;<small>公告信息</small>
				</h2>
			</div>
		</div>

		<div class="row">
			<div class="col-md-12">
				<ol class="breadcrumb" style="background: #ffffff">
					<li><a href="#">Home</a></li>
					<li class="active">BulletinInfo</li>
				</ol>
			</div>
		</div>

		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default">
					<div class="panel-body">日期</div>
					<div class="panel-footer">
						<div id="calendar"></div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" tabindex="-1" role="dialog" id="myModal">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header" id="modalHeader">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="modalTitle">添加公告</h4>
				</div>
				<div class="modal-body">
					<form>
						<input type="hidden" class="form-control" id="id">
						<div class="form-group">
							<label for="exampleInputTitle">标题</label> <input type="email"
								class="form-control" id="title" placeholder="Title">
						</div>
						<div class="form-group">
							<label for="exampleInputContent">内容</label>
							<textarea class="form-control" rows="5" id="_content"></textarea>
						</div>
						<input type="hidden" class="form-control" id="beginTime"> <input
							type="hidden" class="form-control" id="endTime">
					</form>
				</div>
				<div class="modal-footer" id="update">
					<button type="button" class="btn btn-link" data-calendar="updateBulletin">修改</button>
					<button type="button" class="btn btn-link" data-calendar="deleteBulletin">删除</button>
					<button class="btn btn-link" data-dismiss="modal">关闭</button>
				</div>
				<div class="modal-footer" id="insert">
					<button type="button" class="btn btn-link" data-calendar="insertBulletin">添加</button>
					<button class="btn btn-link" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
	<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.js"
		type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"
		type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/moment.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/fullcalendar.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/locale-all.js"></script>
	<script src="${pageContext.request.contextPath}/js/sweetalert2.min.js"></script>

	<script>
		$(document).ready(function() {
			$('#calendar').fullCalendar({
				header: {
					left: 'prev,next today',
					center: 'title',
					right: 'month,agendaWeek,agendaDay'
				},
				editable: true,
				locale: "zh_cn",
				eventColor: '#378006',
				events: function(start,end,timezone, callback) {
			        $.ajax({
			            url: '${pageContext.request.contextPath}/admin/bulletins',
			            type: 'POST',
			            data: "",
			            success: function(result) {
			            	var info=result.extend.bulletins;
			            	console.log(result);
			                var events = [];
			                $.each(info,function(index, item) {
			                      events.push({
			                      id:item.bulletinid,
			                      aid:item.admin.aid,
			                      title: item.admin.aname+" "+item.title,
			                      content:item.content,
			                      start: item.releaseBegin,
			                      end:item.releaseEnd== null ? item.releaseBegin : item.releaseEnd
			                     });
			                });
			                callback(events);
			            }
			        });
			    },


                eventDrop: function(event, delta, revertFunc) {
                	releasetime(event, delta, revertFunc);
                },
                
                
                

                eventResize: function(event, delta, revertFunc) {
                	releasetime(event, delta, revertFunc);
                },


                dayClick: function(date) {
                	var isoDate = moment(date).toISOString();
                	clear();
                	$("#myModal").modal();
                	$("#insert").show();
                	$("#update").hide();
                	$("#beginTime").val(isoDate);
                	$("#endTime").val(isoDate);
                },

                eventClick: function (event, element) {
                	clear();
                	var title = event.title.split(' ');
                	
                	$("#myModal").modal();
                	$("#modalHeader").hide();
                	$("#insert").hide();
                	$("#update").show();
                	$("#id").val(event.id);
                	$("#title").val(title[1]);
                	$("#_content").val(event.content);
                	$("#beginTime").val(event.start.format());
                	$("#endTime").val(event.end.format());

                }
            });

			$("body").on("click", "[data-calendar]", function(){
				var str="";
				var calendarAction = $(this).data('calendar');
				var currentId = $("#id").val();
				var currentTitle = $("#title").val();
				var currentContent = $("#_content").val();
				var currentBegin=$('#beginTime').val();
				var currentEnd=$('#endTime').val();
				var currentEvent = $("#calendar").fullCalendar('clientEvents', currentId);

				if(calendarAction == 'insertBulletin'){
					if (currentTitle != '') {
						str="title="+currentTitle+"&content="+currentContent+"&releaseBegin="+currentBegin+"&aid=1";
						data(calendarAction,str);
						alert(bulletinid);
						$('#calendar').fullCalendar('renderEvent', {
							id: bulletinid,
							title: "jovo "+currentTitle,
							start: currentBegin,
							end:  currentEnd,
							content:currentContent,
							allDay: true,
						}, true);

						$('#myModal').modal('hide');
					}
				}


				if(calendarAction == 'updateBulletin') {
					if (currentTitle != '') {
						str="bulletinid="+currentId+"&title="+currentTitle+"&content="+currentContent+"&releaseBegin="+currentBegin+"&releaseEnd="+currentEnd+"&aid=1";
						data(calendarAction,str);
						currentEvent[0].title = "jovo "+currentTitle;
						currentEvent[0].content = currentContent;

						$('#calendar').fullCalendar('updateEvent', currentEvent[0]);
						$('#myModal').modal('hide');
					}
				}

				if(calendarAction == 'deleteBulletin') {
					$('#myModal').modal('hide');
					setTimeout(function () {
						swal({
							title: '你确定删除吗？',
							text: "你将无法恢复改数据！",
							type: 'warning',
							showCancelButton: true,
							confirmButtonText: '是的，删除',
							cancelButtonText: '取消',
							confirmButtonClass: 'btn btn-danger',
							cancelButtonClass: 'btn btn-default',
							buttonsStyling: false,
							background: 'rgba(0,0,0,0.096)'
						}).then(function(isConfirm) {
							if (isConfirm == true) {
								str="bulletinid="+currentId;
								data(calendarAction,str);
								$('#calendar').fullCalendar('removeEvents', currentId);
								swal({
									title:"已删除!",
									type:'success',
									background: 'rgba(0,0,0,0.096)'
								});
							}
						})
					}, 200);
				}
			});
		});

		function clear(){
			$("#modalHeader").show();
			$("#id").val("");
			$("#title").val("");
			$("#_content").val("");
			$("#beginTime").val("");
			$("#endTime").val("");
		}
		
		var bulletinid="";
		function data(action,str){
			$.ajax({
	            url: '${pageContext.request.contextPath}/admin/'+action,
	            type: 'POST',
	            data: str,
	            success: function(result) {
	            	if(action == 'insertBulletin'){
	            		bulletinid = result.extend.bulletinid;
	            		alert(bulletinid);
	         		}
	            	if(result.extend.status>=1){
	            		swal({
							title:"执行成功!",
							type:'success',
							background: 'rgba(0,0,0,0.096)'
						});
	            	}else{
	            		swal({
							title:"执行失败!",
							type:'error',
							background: 'rgba(0,0,0,0.096)'
						});
	            	}
	            }
	        });
		}
		
		function releasetime(event, delta, revertFunc){
        	var currentId=event.id;
        	var currentBegin=event.start.format();
        	var currentEnd=event.end.format();
        	swal({
				title: '你确定修改吗？',
				text: "现在的时间为："+currentBegin+"——"+currentEnd,
				type: 'warning',
				showCancelButton: true,
				confirmButtonText: '是的，修改',
				cancelButtonText: '取消',
				confirmButtonClass: 'btn btn-danger',
				cancelButtonClass: 'btn btn-default',
				buttonsStyling: false,
				background: 'rgba(0,0,0,0.096)'
			}).then(function(isConfirm) {
				if (isConfirm == true) {
					str="bulletinid="+currentId+"&releaseBegin="+currentBegin+"&releaseEnd="+currentEnd;
					data("updateBulletinRelease",str);
				}else{
					revertFunc();
				}
			})
        }
	</script>
</body>
</html>
