<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.hlzt.commons.model.GlobalVar"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width,initial-scale=1">

<!--CDN_CSS ↓↓↓↓-->
<!--<link rel="stylesheet" href="//apps.bdimg.com/libs/bootstrap/3.3.4/css/bootstrap.min.css">
		<link rel="stylesheet" href="http://apps.bdimg.com/libs/fontawesome/4.4.0/css/font-awesome.min.css">-->
<!--CDN_CSS ↑↑↑↑-->
<title>学生信息</title>

</head>

<body>
	<div class="row" style="margin-top:50px ;">
		<div class="col-xs-12 col-md-11 col-md-offset-1">
			<form action="<%=basePath%>guideTeacher/findStudentInfo.shtm"
				method="post" id="select">
				<input type="hidden" value="${page.pageNo}" name="pageNo">
			</form>
			<form action="<%=basePath%>guideTeacher/exportStuInfo.shtm"
				method="post">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<span class="fa fa-user"></span>&nbsp;&nbsp;学生信息
					</div>

					<div class="table-responsive">
						<table style="text-align:center" class="table table-bordered table-hover table-striped">
							<thead>
								<tr class="tr" >
									<th>姓名</th>
									<th>性别</th>
									<th>学号</th>
									<th>课题名</th>
									<th>班级</th>
									<th>电话</th>
									<th>邮箱</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="Student" items="${page.results}">
									<tr>
										<td>${Student.stuName }</td>
										<td>${Student.sex}</td>
										<td>${Student.userNum }</td>
										<td>${Student.title }</td>
										<td>${Student.stuClass }</td>
										<td>${Student.tel}</td>
										<td>${Student.mail }</td>
								</c:forEach>
								<c:if test="${page.results==null||fn:length(page.results)==0}">
									<tr>
										<td align="center" colspan="7">暂无指导学生！</td>
									</tr>
								</c:if>
							</tbody>
						</table>
					</div>

					<div class="panel-footer">
					<input type="hidden" value="${page.pageNo}" name="pageNo" id="pageNow"><!-- 记录当前页 -->
						<div class="row" style="padding-left:15px"><!-- row -->						
								<button type="submit" class="btn btn-primary">导出</button>			

							<div class="col-xs-8 col-md-8 "	style="float: right; text-align:right;">
									<script type="text/javascript" src="<%=basePath%>js/page.js"></script>
									<c:if test="${page.isAjax==0}">
										<c:if test="${page.pageNo-1>0 }">
											<a href="javascript:upPage()" class="btn btn-default btn-sm">&laquo;上一页</a>
										</c:if>

										<a class="btn btn-default btn-sm">第${page.pageNo }页</a>

										<c:if test="${page.pageNo+1<=page.totalPage }">
											<a href="javascript:nextPage()"
												class="btn btn-default btn-sm">下一页&raquo;</a>
										</c:if>
										&nbsp;&nbsp;共${page.totalRecord }条&nbsp;共${page.totalPage}页 &nbsp;&nbsp;跳转到&nbsp;
										<input type="text" value="" id="zc_tz_text"
											style="width:28px;height:28px" />&nbsp;页<input type="button"
											value="跳转" id="zc_tz_button" class="btn btn-default btn-sm"
											onclick="zcTzClick(${page.totalPage})" /> &nbsp;&nbsp;每页&nbsp;<input
											type="text" value="" id="page_size_text"
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
</body>

</html>