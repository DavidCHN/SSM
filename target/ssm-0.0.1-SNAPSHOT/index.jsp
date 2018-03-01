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
			<table class="table table-hover" id="pers_table">
				<thead>
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
				</thead>
				<tbody>
				</tbody>
			</table>
		</div>
		<div class="row">
			<div class="col-md-6" id="page_info_area">
			
			</div>
			<div class="col-md-6"></div>
		</div>
	</div>
	<script type="text/javascript">
		$(function() {
			$.ajax({
				url : "${APP_PATH}/persons",
				data : "pn=1",
				type : "get",
				success : function(result) {
					console.log(result);
					build_emp_table(result);
					build_pageInfo(result);
					
					build_nav_table(result);
					
				}
			});
		});

		function build_emp_table(result) {

			var emps = result.extend.pageInfo.list;
			$.each(emps, function(index, item) {
				var empID = $("<td></td>").append(item.id);
				var empName = $("<td></td>").append(item.name);
				var empAge = $("<td></td>").append(item.age);
				var empAddress = $("<td></td>").append(item.address);
				var empGender = $("<td></td>").append(
						item.gender == "F" ? "女" : "男");
				var empEmail = $("<td></td>").append(item.email);
				var empDept = $("<td></td>").append(item.department.name);
				var btnEdit=$("<button></button>").addClass("btn btn-primary btn-xs").append("<span></span>").addClass("glyphicon glyphicon-pencil").append("编辑");
				var btnDel=$("<button></button>").addClass("btn btn-danger btn-xs").append("<span></span>").addClass("glyphicon glyphicon-trash").append("删除");
				
				var btnTb=$("<td></td>").append(btnEdit).append(" ").append(btnDel);
				
				$("<tr></tr>").append(empID).append(empName).append(empAge)
						.append(empAddress).append(empGender).append(empEmail)
						.append(empDept).append(btnTb).appendTo("#pers_table tbody");
			})
		}
		
		function build_pageInfo(result){
			
			var p1=$("<span></span>").addClass("badge").append(result.extend.pageInfo.pageNum);
			var p2=$("<span></span>").addClass("badge").append(result.extend.pageInfo.pages);
			var p3=$("<span></span>").addClass("badge").append(result.extend.pageInfo.total);
			$("#page_info_area").append("当前第").append(p1).append("页,总共").append(p2).append("页,总共").append(p3).append("条记录.");
		}
		
		function build_nav_table(result){
			
		}
	</script>
</body>
</html>