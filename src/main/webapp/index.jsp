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
	src="${APP_PATH}/static/jquery/jquery-3.3.1.min.js"></script>
<script type="text/javascript"
	src="${APP_PATH}/static/bootstrap/js/bootstrap.min.js"></script>

</head>
<body>
	<!-- Modal -->
	<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">新增用户</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">姓名</label>
							<div class="col-sm-8">
								<input type="text" name="name" class="form-control" id="personName"
									placeholder="张三">
									 <span class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword3" class="col-sm-2 control-label">年龄</label>
							<div class="col-sm-8">
								<input type="text" name="age" class="form-control" id="age"
									placeholder="18">
									 <span class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword3" class="col-sm-2 control-label">住址</label>
							<div class="col-sm-8">
								<input type="text" name="address" class="form-control" id="address"
									placeholder="兰州市七里河区XX路XX小区XX室">
									 <span class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword3" class="col-sm-2 control-label">邮箱</label>
							<div class="col-sm-8">
								<input type="email" name="email" class="form-control" id="email"
									placeholder="8888888@qq.com">
									 <span class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword3" class="col-sm-2 control-label">性别</label>
							<div class="col-sm-8">
								<label class="radio-inline"> <input type="radio"
									name="inlineRadioOptions" name="gender" id="gender1"  value="M" checked="checked">
									男
								</label> <label class="radio-inline"> <input type="radio"
									name="inlineRadioOptions" name="gender" id="gender2" value="F">
									女
								</label>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">所属部门</label>
							<div class="col-sm-6">
								<select class="form-control" name="jobId">
								</select>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="save_person">保存</button>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-md-8">
				<h1>兰州市供水集团公司供水管线GIS系统后台管理</h1>
			</div>
		</div>
		<div class="row">
			<div class="col-md-2 col-md-offset-10">
				<button type="button" class="btn btn-success" id="addModal">新增</button>
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
			<div class="col-md-6" id="page_info_area"></div>
			<div class="col-md-6" id="page_nav_area"></div>
		</div>
	</div>
	<script type="text/javascript">
		var totalRecode;
		$(function() {
			to_page(1);
		});

		function to_page(pn) {
			$.ajax({
				url : "${APP_PATH}/persons",
				data : "pn=" + pn,
				type : "get",
				success : function(result) {
					console.log(result);
					build_emp_table(result);
					build_pageInfo(result);
					build_nav_table(result);

				}
			});
		}

		function build_emp_table(result) {
			$("#pers_table tbody").empty();
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
				var btnEdit = $("<button></button>").addClass(
						"btn btn-primary btn-xs").append("<span></span>")
						.addClass("glyphicon glyphicon-pencil").append("编辑");
				var btnDel = $("<button></button>").addClass(
						"btn btn-danger btn-xs").append("<span></span>")
						.addClass("glyphicon glyphicon-trash").append("删除");

				var btnTb = $("<td></td>").append(btnEdit).append(" ").append(
						btnDel);

				$("<tr></tr>").append(empID).append(empName).append(empAge)
						.append(empAddress).append(empGender).append(empEmail)
						.append(empDept).append(btnTb).appendTo(
								"#pers_table tbody");
			})
		}

		function build_pageInfo(result) {
			$("#page_info_area").empty();
			var p1 = $("<span></span>").addClass("badge").append(
					result.extend.pageInfo.pageNum);
			var p2 = $("<span></span>").addClass("badge").append(
					result.extend.pageInfo.pages);
			var p3 = $("<span></span>").addClass("badge").append(
					result.extend.pageInfo.total);
			$("#page_info_area").append("当前第").append(p1).append("页,总共")
					.append(p2).append("页,总共").append(p3).append("条记录.");
			totalRecode=result.extend.pageInfo.pages;
		}

		function build_nav_table(result) {
			$("#page_nav_area").empty();
			var ulLi = $("<ul></ul>").addClass("pagination");
			var firstPageLi = $("<li></li>").append(
					$("<a></a>").append("首页").attr("href", "#"));
			var prePageLi = $("<li></li>").append(
					$("<a></a>").append($("<span></span>")).append("&laquo;"));
			if (result.extend.pageInfo.hasPreviousPage == false) {
				firstPageLi.addClass("disabled");
				prePageLi.addClass("disabled");
			} else {
				firstPageLi.click(function() {
					to_page(1);
				});
				prePageLi.click(function() {
					to_page(result.extend.pageInfo.pageNum - 1);
				});
			}
			var nextPageLi = $("<li></li>").append(
					$("<a></a>").append($("<span></span>")).append("&raquo;"));
			var lastPageLi = $("<li></li>").append(
					$("<a></a>").append("末页").attr("href", "#"));
			if (result.extend.pageInfo.hasNextPage == false) {
				nextPageLi.addClass("disabled");
				lastPageLi.addClass("disabled");
			} else {
				nextPageLi.click(function() {
					to_page(result.extend.pageInfo.pageNum + 1);
				});
				lastPageLi.click(function() {
					to_page(result.extend.pageInfo.pages);
				});
			}
			ulLi.append(firstPageLi).append(prePageLi);
			$.each(result.extend.pageInfo.navigatepageNums, function(index,
					item) {
				var numLi = $("<li></li>").append($("<a></a>").append(item));
				if (result.extend.pageInfo.pageNum == item) {
					numLi.addClass("active");
				}
				numLi.click(function() {
					to_page(item);
				});
				ulLi.append(numLi);
			});
			ulLi.append(nextPageLi).append(lastPageLi);

			var navEle = $("<nav></nav>").append(ulLi).appendTo(
					"#page_nav_area");
		}

		$("#addModal").click(function() {
			$("#empAddModal form")[0].reset();
			get_Department();
			$("#empAddModal").modal({
				backdrop : "static"
			});
		});
		function get_Department(){
			$("#empAddModal select").empty();
			$.ajax({
				url:"${APP_PATH}/depts",
				type:"get",
				success:function(result){
					$.each(result.extend.depts,function(){
						$("#empAddModal select").append($("<option></option>").append(this.name).attr("value",this.id));
					})
				}
			})
		}
		
		function validate_add_form(){
			var nameVal=$("#personName").val();
			var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
			if(!regName.test(nameVal)){
				show_validate_msg("#personName", "error", "用户名可以是2-5位中文或者6-16位英文和数字的组合");
				return false;
			}else{
				show_validate_msg("#personName", "success", "");
			}
			var email = $("#email").val();
			var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
			if(!regEmail.test(email)){		
				show_validate_msg("#email", "error", "邮箱格式不正确");
			
				return false;
			}else{
				show_validate_msg("#email", "success", "");
			}
			return true;
		}
		
		$("#personName").change(function(){
			var nameVal=this.value;
			$.ajax({
				url:"${APP_PATH}/checkuser",
				data:"personName="+nameVal,
				type:"POST",
				success:function(result){
					if(result.code==100){
						show_validate_msg("#personName","success","用户名可用");
						$("#save_person").attr("ajax_va","success");
					}else{
						show_validate_msg("#personName","error","用户名不可用");
						$("#save_person").attr("ajax_va","error");
					}
				}
			});
		});
		
		//显示校验结果的提示信息
		function show_validate_msg(ele,status,msg){
			//清除当前元素的校验状态
			$(ele).parent().removeClass("has-success has-error");
			$(ele).next("span").text("");
			if("success"==status){
				$(ele).parent().addClass("has-success");
				$(ele).next("span").text(msg);
			}else if("error" == status){
				$(ele).parent().addClass("has-error");
				$(ele).next("span").text(msg);
			}
		}
		
		$("#save_person").click(function(){
			
			if(!validate_add_form()){
				return false;
			};
			if($(this).attr("ajax_va")=="error"){
				return false;
			}
			
			$.ajax({
				url:"${APP_PATH}/persons",
				type:"post",
				data:$("#empAddModal form").serialize(),
				success:function(result){
					$("#empAddModal").modal("hide");
					to_page(totalRecode);
				}
			});
		});
		
	</script>
</body>
</html>