<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.hlzt.commons.model.GlobalVar"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>

	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width,initial-scale=1">
		<title>审核教师课题</title>

	</head>

	<body style="margin-top:50px;">
	<script type="text/javascript">
			window.onload=function(){
				/*刷新页面下拉框值不变*/	
		   		if(document.getElementById("selHid").value==""){
		   			document.getElementById("sel").value=3;
		   		}else{
		   			document.getElementById("sel").value=document.getElementById("selHid").value;
		   		}
				/*弹窗提示异常消息*/
		   		var error = $("#error").val();
		   		if(!(error==''|| error==undefined || error==null)){
				$(".modal-title").html("错误提示");
				$(".modal-body").html(error);
				$("#mymodal-error").modal("toggle");
				}
		   		
		   		/*弹窗提示成功消息*/
		   		var success = $("#success").val();
		   		if(!(success==''|| success==undefined || success==null)){
				$(".modal-title").html("提示");
				$(".modal-body").html(success);
				$("#mymodal-error").modal("toggle"); 
				}
			}	
		</script>
		<input type="hidden" value="${errorMsg}" id="error">
		<input type="hidden" value="${successMsg}" id="success">
		<!--下面是代码任务部分-->
		<!--row_1 ↓↓↓↓-->
		<div class="row" style="margin-top: 50px;" id="row1">
			<div class="col-xs-12 col-md-11 col-md-offset-1">
				<form class="form-inline" action="<%=basePath %>majorLeader/findTeaTitle.shtm" method="post" id="select">
					<div class="panel panel-primary">
						<div class="panel-body">
							<label class="control-label">姓名：</label><input type="text" value="${teaName}" class="form-control" id="stu_name" name="teaName" placeholder="教师姓名" />
							<label class="control-label">状态:</label>
							<input type="hidden" value="${status}" id="selHid">
							<select class="form-control" name="status" id="sel">
								<option value="0">未审核</option>
								<option value="1">已通过</option>
								<option value="2">未通过</option>
								<option value="3">查询全部</option>
							</select>&nbsp;&nbsp;
							<input name="pageNo" type="hidden" value="${page.pageNo}" id="pageNow" />
							<input type="hidden" value="${page.pageSize}" name="pageSize" id="pageSize">
							<button class="btn btn-primary" type="submit" id="keyWordSelect"><span class="fa fa-search">查询</span></button>
						</div>
					</div>
				</form>
			</div>
		</div>
		<!--row_1 ↑↑↑↑-->
		<!--row_2 ↓↓↓↓-->
		<div class="row" id="row2">
			<div class="col-xs-12 col-md-11 col-md-offset-1">
				<form action="<%=basePath %>majorLeader/findTeaTitle_checkTeaTitle.shtm" method="post">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<span class="fa fa-check-square-o"></span>&nbsp;&nbsp;审核教师课题</div>
						<div class="table-responsive">
							<table class="table table-bordered table-hover" style="text-align:center">
								<thead>
									<tr>
										<th style="text-align: center;">选择</th>
										<th>教师姓名</th>
										<th>专业</th>
										<th>职称</th>
										<th>课题名</th>
										<th>审核状态</th>
										<th>审核课题</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach var="teacherTitle" items="${page.results}">
									<tr>
										<td style="text-align: center;"><input name="ids" value="${teacherTitle.id}" type="checkbox" id="check"></td>
										<td>${teacherTitle.teacher.teaName}</td>
										<td>${teacherTitle.teacher.major}</td>
										<td>${teacherTitle.teacher.zhicheng}</td>
										<td>${teacherTitle.title}</td>
										<td>
											<c:if test="${teacherTitle.leaderStatus==0}">
											待审核</span>
											</c:if>
											<c:if test="${teacherTitle.leaderStatus==1}">
											已通过
											</c:if>
											<c:if test="${teacherTitle.leaderStatus==2}">
											未通过
											</c:if>
										</td>
										<td>
											<a href="<%=basePath %>majorLeader/findTeaTitle_findTeaTitleById.shtm?id=${teacherTitle.id}">审核</a>
										</td>
									</tr>
								</c:forEach>	
								</tbody>
							</table>
						</div>
						<div class="panel-footer">						
						<div class="row" style="padding-left:15px">
							<input class="btn btn-default" id="check_all" value="全选" type="button">&nbsp;&nbsp;
							<input type="hidden" name="teaName" value="${teaName}">
							<input type="hidden" name="findStatus" value="${status}">
							<input type="hidden" name="status" value="" id="cs">
							<script type="text/javascript">
								function pass(){
									document.getElementById("cs").value = 1
									
								}
								function notpass(){
									document.getElementById("cs").value = 2
								}
							</script>
							<button type="submit" class="btn btn-primary alert-success" onclick="pass()">通过</button>&nbsp;&nbsp;
							<button type="submit" class="btn btn-primary alert-danger" onclick="notpass()">退回</button>&nbsp;&nbsp;
							
								<div class="col-xs-8 col-md-8 " style="float: right; text-align:right;">
								<script type="text/javascript" src="<%=basePath%>js/page.js"></script>
								<c:if test="${page.isAjax==0}">
									<c:if test="${page.pageNo-1>0 }">
										<a href="javascript:upPage()" class="btn btn-default btn-sm">&laquo;上一页</a>
									</c:if>

									<a class="btn btn-default btn-sm">第${page.pageNo }页</a>

									<c:if test="${page.pageNo+1<=page.totalPage }">
										<a href="javascript:nextPage()" class="btn btn-default btn-sm">下一页&raquo;</a>
									</c:if>
										&nbsp;&nbsp;共${page.totalRecord }条&nbsp;共${page.totalPage}页 &nbsp;&nbsp;跳转到&nbsp;
										<input type="text" value="" id="zc_tz_text"
										style="width:28px;height:28px" />&nbsp;页<input type="button"
										value="跳转" id="zc_tz_button" class="btn btn-default btn-sm"
										onclick="zcTzClick(${page.totalPage})" /> &nbsp;&nbsp;每页&nbsp;<input type="text" value="" id="page_size_text"
										style="width:28px;height:28px" />&nbsp;条<input type="button"
										value="设置" id="zc_size_button" class="btn btn-default btn-sm"
										onclick="pageSizeClick()" />
								</c:if>
							</div>
						</div><!-- /row -->
							
						</div>

					</div>
				</form>

			</div>

		</div>
		
		<!--row_2 ↑↑↑↑-->
		</div>
		<div class="modal fade" id="mymodal-error" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
	   <div class="modal-dialog">
		 <div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title"></h4>
				</div>
				<div class="modal-body">
				<p></p>
				</div>
				<div class="modal-footer">			
					<button type="button" class="btn btn-primary"
						data-dismiss="modal">确认</button>
				</div>
			</div>
		</div>
	</div>
		
		<script type="text/javascript">
			var a = 1;
			$('#check_all').click(function() {
				if(a == 1) {
					$('[name=ids]:checkbox').prop('checked', true);
					a = a - 1;
				} else {
					$('[name=ids]:checkbox').attr('checked', false);
					a = a + 1;
				}

			})
		</script>
	</body>

</html>