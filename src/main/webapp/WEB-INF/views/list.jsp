<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>人员信息展示</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<link rel="stylesheet"
	href="${APP_PATH}/static/bootstrap/css/bootstrap.min.css" />
<script type="text/javascript"
	src="${APP_PATH}/static/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="${APP_PATH}/static/jquery/jquery-3.3.1.min.js"></script>
</head>
<body>
	<div class="container">

		<div class="row">
			<div class="col-md-8">
				<h1>兰州市供水集团公司供水管线GIS系统后台管理</h1>
			</div>
		</div>
		<div class="row">
			<div class="col-md-2 col-md-offset-10">
				<button type="button" class="btn btn-success">新增</button>
				<button type="button" class="btn btn-info">删除</button>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div style="background-color: #4682B4; height: 3px; width: 100%"></div>
			</div>
		</div>
		<div class="row">
			<table class="table table-hover">
				<tr>
					<th>编号</th>
					<th>姓名</th>
					<th>年龄</th>
					<th>住址</th>
					<th>性別</th>
					<th>邮箱</th>
					<th>所属部门</th>
					<th>操作</th>
				</tr>
				<c:forEach items="${pageInfo.list}" var="emp">
					<tr <c:if test="${emp.id mod 2==0}">
  						class="success"
						</c:if>>
						<td>${emp.id}</td>
						<td>${emp.name}</td>
						<td>${emp.age}</td>
						<td>${emp.address}</td>
						<td>${emp.gender=="F"?"女":"男"}</td>
						<td>${emp.email}</td>
						<td>${emp.department.name}</td>
						<td>
						 <button type="button" class="btn btn-primary btn-xs"> 
						 <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
						 修改</button>
 						 <button type="button" class="btn btn-danger btn-xs">
 						 <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
 						 删除</button>
 						 </td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div class="row">
			<div class="col-md-6">
			当前第 <span class="badge">${pageInfo.pageNum}</span>页,总共<span class="badge">${pageInfo.pages}</span>页,总共<span class="badge">${pageInfo.total}</span>条记录.
			</div>
			<div class="col-md-6">
				<nav aria-label="Page navigation">
				<ul class="pagination">
					<li><a href="${APP_PATH }/persons?pn=1">首页</a></li>
					<c:if test="${pageInfo.hasPreviousPage}">
					<li><a href="${APP_PATH}/persons?pn=${pageInfo.pageNum-1}" aria-label="Previous"> <span
							aria-hidden="true">&laquo;</span>
					</a></li>
					</c:if>
					
					<c:forEach items="${pageInfo.navigatepageNums}" var="page_Num">
					<c:if test="${pageInfo.pageNum==page_Num }">
						<li class="active"><a href="#">${page_Num}</a></li>
					</c:if>
					<c:if test="${pageInfo.pageNum!=page_Num }">
						<li><a href="${ APP_PATH}/persons?pn=${page_Num}">${page_Num}</a></li>
					</c:if>
					</c:forEach>
					<c:if test="${pageInfo.hasNextPage }">
					<li><a href="${APP_PATH }/persons?pn=${pageInfo.pageNum+1}" aria-label="Next"> <span
							aria-hidden="true">&raquo;</span>
					</a></li>
					</c:if>
					
					<li><a href="${APP_PATH }/persons?pn=${pageInfo.pages}">末页</a></li>
				</ul>
				</nav>
			</div>
		</div>
	</div>
</body>
</html>