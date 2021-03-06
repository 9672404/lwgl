<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.hlzt.commons.model.GlobalVar"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>
<meta http-equiv="Content-Type" />
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width,initial-scale=1">
<title></title>
</head>
<body style="font-family: '微软雅黑'; font-size: 17px;">
		<div class="row" style="margin-top: 50px;">
			<div class="col-sm-12 col-md-10 col-md-offset-1">
				<div class="panel panel-info">
					<div class="panel panel-heading"><span class="fa fa-edit"></span>&nbsp;&nbsp;可选课题</div>
					<form role="form" method="post" action="<%=basePath%>student/initApplyTitle_ApplyTitle.shtm" id="select">										
					<div class="panel-body">							
						<div class="table-responsive">
							<table class="table table-bordered table-striped table-hover text-center">
								<thead>
									<tr>
										<th>选择</th>
										<th>课题名称</th>
										<th>课题性质</th>
										<th>完成形式</th>
										<th>教师名</th>										
									</tr>
								</thead>
								<tbody>
									<c:if test="${page.results!=null}">
										<c:forEach var="teacherTitle" items="${page.results}">
											<tr>
												<td><input type="radio" name="teaTitleId"
													value="${teacherTitle.id}"></td>
												<td><a href="<%=basePath%>student/initApplyTitle_title.shtm?id=${teacherTitle.id}&Source=0&readOnly=1">${teacherTitle.title}</a>
												</td>				
												<td>${teacherTitle.nature}</td>
												<td>${teacherTitle.titleForm}</td>
												<td>${teacherTitle.teacher.teaName}</td>
											</tr>
										</c:forEach>
									</c:if>
								</tbody>
							</table>
						</div>						
					</div>
					<div class="modal fade" id="mymodal-data" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
							    <div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">
									<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
								</button>
									<h4 class="modal-title">提交申请</h4>
								</div>
								<div class="modal-body">
									<p>审核后无法修改，确认提交？</p>
								</div>
								<div class="modal-footer">
									<button type="submit" class="btn btn-primary">确认</button>
									<button type="button" class="btn btn-default"
										data-dismiss="modal">取消</button>
							    </div>
							  </div>
						</div>
					  </div>
					  <div class="panel-footer">
					  <div class="row" style="margin-left:15px;">	
							<button class="btn btn-primary" id="submitApply" type="button">提交</button>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<a class="btn btn-default" href="<%=basePath %>student/initApplyTitle.shtm">返回</a>	  							  						  		
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
						</div>
					  </div>
				</form>
			</div>
			</div>
		</div>
		<div class="modal fade" id="mymodal-error" tabindex="-1" role="dialog"
		aria-labelledby="mySmallModalLabel" aria-hidden="true">
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
					<button type="button" class="btn btn-primary" data-dismiss="modal">确认</button>
				</div>
			</div>
		</div>
	</div>
	<input hidden="hidden" id="ErrorMsg" value="${errorMsg}">
	<script type="text/javascript">
	$(document).ready(
			function() {
				var ErrorMsg = $("#ErrorMsg").val();
				if (!(ErrorMsg == '' || ErrorMsg == undefined || ErrorMsg == null)) {
					$(".modal-title").html("错误提示");
					$(".modal-body").html(ErrorMsg);
					$("#mymodal-error").modal("toggle");
				}
			});
	   $(function() {
			$("#submitApply").click(function() {
				var val = $('input:radio[name="teaTitleId"]:checked').val();
				if (val == null) {
					$(".modal-title").html("错误提示");
					$(".modal-body").html("请选择一个课题!");
					$("#mymodal-error").modal("toggle");
					return false;
				}	
				$(".modal-title").html("提交申请");
				$(".modal-body").html("审核后无法修改，确认提交？");
				$("#mymodal-data").modal("toggle");
			});
		});	
	</script>
</body>
</html>
