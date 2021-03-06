<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.hlzt.commons.model.GlobalVar"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width,initial-scale=1">	
		<title></title>
	</head>

	<body>
		<div class="row" style="margin-top: 50px;">
		<div class="col-xs-12 col-md-10 col-md-offset-1">
			<div class="panel panel-primary">
			<form role="form" class="form-inline" method="post" action="<%=basePath%>${url}/formerTerm.shtm" id="select">
				<div class="panel-body">					
						<div class="form-group">
							<label>往届年份：</label>
							<input type="text" name="formerTerm" class="form-control input-sm" value="${formerTerm}"/>
						</div>											
						<div class="form-group">
							<label>课题名称：</label>
							<input type="text" name="title" class="form-control input-sm" value="${title}" placeholder="请输入课题关键字"/>
						</div>
						<input name="pageNo" type="hidden"  value="${page.pageNo}"   id="pageNow"/>
						<input name="pageSize" type="hidden"  value="${page.pageSize}" id="pageSize"/>
						<button class="btn btn-primary" type="submit" id="keyWordSelect">查询</button>
						<div class="form-group">
							<div class="alert alert-info" style="margin-bottom:0px;padding:10px"><p>课题三年不能重复,请输入关键字查询往届课题</p></div>
						</div>					
				   </div>
				</form>
			</div>	
			</div>
		</div>
		<div class="row">
			<div class="col-xs-12 col-md-10 col-md-offset-1">
				<form method="post" action="<%=basePath %>${url}/exportFormerTermInfo.shtm" >
					<div class="panel panel-primary">					
						<div class="panel-heading">
							<span class="fa fa-check-square-o"></span>&nbsp;&nbsp;往届信息查询
						</div>
						<div class="panel-body">
						<div class="table-responsive">
							<table class="table table-bordered table-striped table-hover" style="text-align: center;">
								<thead>
									<tr>
										<th>姓名</th>							
										<th>专业名称</th>
										<th>毕业年级</th>
										<th>课题名称</th>			
										<th>指导老师</th>
									</tr>
								</thead>
								<tbody>
								<c:if test="${page.results!=null}">
									<c:forEach var="paper" items="${page.results}">
										<tr>
											<td>${paper.stuName}</td>
											<td>${paper.stuMajor}</td>
											<td>${paper.term}</td>
											<td>${paper.title}</a></td>
											<td>${paper.zdTeacher}</td>									
										</tr>	
								    </c:forEach>	
							    </c:if>														
								</tbody>
							</table>
						</div>
						</div>
						<div class="panel-footer">
						 	<input type="hidden" value="${formerTerm}" name="formerTerm">
							<input type="hidden" value="${teacherName}" name="teacherName">
							<input type="hidden" value="${studentName}" name="studentName">
							<input type="hidden" value="${studentNum}" name="studentNum">
							<div class="row">		

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
					</div>
				</form>
			</div>
		</div>
	
	</body>

</html>