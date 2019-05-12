<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>超级管理员页面</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!-- <link href="css/system.css"> -->
<!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
</head>
<body>

	<!-- 点击修改密码时的二级模态框 -->
	<div class="modal fade" id="adminUpdatePasswordModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">管理员修改密码</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group">
							<label class="col-sm-2 control-label">新密码：</label>
							<div class="col-sm-10">
								<input type="password" name="PassWord" class="form-control"
									id="admin_savePassWord_input" placeholder="新密码"> <span
									class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">再次输入：</label>
							<div class="col-sm-10">
								<input type="password" name="PassWord" class="form-control"
									id="admin_savePassWord2_input" placeholder="新密码"> <span
									class="help-block"></span>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="admin_savepassword_btn">保存</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">返回</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 点击修改密码时的一级模态框 -->
	<div class="modal fade" id="adminPasswordModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">管理员修改密码</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group">
							<label class="col-sm-2 control-label">原密码：</label>
							<div class="col-sm-10">
								<input type="password" name="PassWord" class="form-control"
									id="admin_updatePassWord_input" placeholder="密码"> <span
									class="help-block"></span>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="original_password_btn">保存</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">返回</button>
				</div>
			</div>
		</div>
	</div>


	<!-- 管理员修改自身密码的模态框 -->
	<div class="modal fade" id="adminUpdateModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">管理员信息修改</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group">
							<label class="col-sm-2 control-label">用户名</label>
							<div class="col-sm-10">
								<input type="text" name="StudentName" class="form-control"
									id="admin_name_input" placeholder="姓名"> <span
									class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">手机</label>
							<div class="col-sm-10">
								<input type="text" name="TelephoneNumber" class="form-control"
									id="admin_telephone_input" placeholder="手机"> <span
									class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">地址</label>
							<div class="col-sm-10">
								<input type="text" name="Adress" class="form-control"
									id="admin_adress_input" placeholder="地址"> <span
									class="help-block"></span>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" id="admin_updatePassword_btn">更改密码</button>
					<button type="button" class="btn btn-primary" id="admin_save_btn">保存</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">退出</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 设置分数段 -->
	<div class="modal fade" id="ScoreModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="Score">分数段</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group">
							<label class="col-sm-2 control-label">分数段：</label>
							<div class="col-sm-10">
								<input type="text" name="Score" class="form-control"
									id="status_update_input" placeholder="分数（数字））"> <span
									class="help-block"></span>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="score-update_btn">确定</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">退出</button>
				</div>
			</div>
		</div>
	</div>
	

	<!-- 管理员设置面试报名时间 -->
    <div class="modal fade" id="InterviewAddModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">管理员设置笔试报名时间</h4>
				</div>
				<table class="table table-hover" id="interview_table">
					<thead>
						<tr>
							<th>#</th>
							<th>开始时间	</th>
							<th>结束时间</th>
							<th>总人数</th>
							<th>目前人数</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
				<div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group">
							<label class="col-sm-2 control-label">开始时间</label>
							<div class="col-sm-10">
								<input type="text" name="begin_time" class="form-control"
									id="interview_add_begin_input" placeholder="时间点(xxxx-xx-xx xx:xx)"> <span
									class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">结束时间</label>
							<div class="col-sm-10">
								<input type="text" name="over_time" class="form-control"
									id="interview_add_over_input" placeholder="时间点(xxxx-xx-xx xx:xx)"> <span
									class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">总人数</label>
							<div class="col-sm-10">
								<input type="text" name="all_number" class="form-control"
									id="interview_add_number_input" placeholder="人数"> <span
									class="help-block"></span>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="interview_save_btn">保存</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">退出</button>
				</div>
			</div>
		</div>
	</div>
	
	
    <!-- 管理员设置笔试报名时间的模态框 -->
    <div class="modal fade" id="TimeAddModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">管理员设置笔试报名时间</h4>
				</div>
				<table class="table table-hover" id="time_table">
					<thead>
						<tr>
							<th>#</th>
							<th>开始时间	</th>
							<th>结束时间</th>
							<th>总人数</th>
							<th>目前人数</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
				<div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group">
							<label class="col-sm-2 control-label">开始时间</label>
							<div class="col-sm-10">
								<input type="text" name="begin_time" class="form-control"
									id="time_add_begin_input" placeholder="时间点(xxxx-xx-xx xx:xx)"> <span
									class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">结束时间</label>
							<div class="col-sm-10">
								<input type="text" name="over_time" class="form-control"
									id="time_add_over_input" placeholder="时间点(xxxx-xx-xx xx:xx)"> <span
									class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">总人数</label>
							<div class="col-sm-10">
								<input type="text" name="all_number" class="form-control"
									id="time_add_number_input" placeholder="人数"> <span
									class="help-block"></span>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="time_save_btn">保存</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">退出</button>
				</div>
			</div>
		</div>
	</div>
	
	
	<!-- 点击新增弹出的模态框 -->
	<div class="modal fade" id="userAddModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">用户添加</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group">
							<label for="email" class="col-sm-2 control-label">角色</label>
							<div class="col-sm-10">
								<select class="form-control" id="Indentity" name="IsAdmin">
									<option  value="2">普通用户</option>
									<option  value="1">超级管理员</option>
									<option  value="3">笔试官</option>
									<option  value="4">面试官</option>
									<option  value="5">删除管理员</option>
									<option  value="6">修改管理员</option>
									<option  value="7">查看管理员</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">账号</label>
							<div class="col-sm-10">
								<input type="text" name="AccountNumber" class="form-control"
									id="userAccountNumber_add_input" placeholder="账号（6位数）">
								<span class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">密码</label>
							<div class="col-sm-10">
								<input type="password" name="PassWord" class="form-control"
									id="userpwd_add_input" placeholder="密码"> <span
									class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">再次输入</label>
							<div class="col-sm-10">
								<input type="password" name="RePassWord" class="form-control"
									id="userpwd_add_input2" placeholder="密码"> <span
									class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">学校</label>
							<div class="col-sm-10">
								<input type="text" name="SchoolName" class="form-control"
									id="userschool_add_input" placeholder="学校"> <span
									class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">姓名</label>
							<div class="col-sm-10">
								<input type="text" name="StudentName" class="form-control"
									id="userName_add_input" placeholder="姓名"> <span
									class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">学号</label>
							<div class="col-sm-10">
								<input type="text" name="StudentId" class="form-control"
									id="userstuId_add_input" placeholder="学号"> <span
									class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label for="email" class="col-sm-2 control-label">年级</label>
							<div class="col-sm-10">
								<select class="form-control" id="Grade" name="Grade">
									<option  value="2018级">2018级</option>
									<option  value="2017级">2017级</option>
									<option  value="2016级">2016级</option>
									<option  value="2015级">2015级</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">手机</label>
							<div class="col-sm-10">
								<input type="text" name="TelephoneNumber" class="form-control"
									id="usertele_add_input" placeholder="手机"> <span
									class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">邮箱</label>
							<div class="col-sm-10">
								<input type="text" name="Email" class="form-control"
									id="useremail_add_input" placeholder="邮箱"> <span
									class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">地址</label>
							<div class="col-sm-10">
								<input type="text" name="Adress" class="form-control"
									id="useradress_add_input" placeholder="地址"> <span
									class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">自我介绍</label>
							<div class="col-sm-10">
								<textarea name="Self_introduction" id="introduction_add_input"
									placeholder="爱好、经历......" rows="5" cols="50"></textarea>
								<span class="help-block"></span>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="user_save_btn">保存</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">退出</button>
				</div>
			</div>
		</div>
	</div>


	<!-- 点击修改弹出的模态框 -->
	<div class="modal fade" id="userUpdateModal" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">信息修改</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group">
							<label class="col-sm-2 control-label">id</label>
							<div class="col-sm-10">
								<p class="form-control-static" id="userId_update_static"></p>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">账号</label>
							<div class="col-sm-10">
								<p class="form-control-static" id="useraccount_update_static"></p>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">学校</label>
							<div class="col-sm-10">
								<input type="text" name="SchoolName" class="form-control"
									id="userschool_update_input" placeholder="学校"> <span
									class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">姓名</label>
							<div class="col-sm-10">
								<input type="text" name="StudentName" class="form-control"
									id="userName_update_input" placeholder="姓名"> <span
									class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">学号</label>
							<div class="col-sm-10">
								<input type="text" name="StudentId" class="form-control"
									id="userstuId_update_input" placeholder="学号"> <span
									class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label for="email" class="col-sm-2 control-label">年级</label>
							<div class="col-sm-10">
								<select class="form-control" id="usergrade_update_input" name="Grade">
									<option  value="2018级">2018级</option>
									<option  value="2017级">2017级</option>
									<option  value="2016级">2016级</option>
									<option  value="2015级">2015级</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">手机</label>
							<div class="col-sm-10">
								<input type="text" name="TelephoneNumber" class="form-control"
									id="usertele_update_input" placeholder="手机"> <span
									class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">邮箱</label>
							<div class="col-sm-10">
								<input type="text" name="Email" class="form-control"
									id="useremail_update_input" placeholder="邮箱"> <span
									class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">地址</label>
							<div class="col-sm-10">
								<input type="text" name="Adress" class="form-control"
									id="useradress_update_input" placeholder="地址"> <span
									class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">自我介绍</label><span
								class="help-block"></span>
							<div class="col-sm-10">
								<textarea name="Self_introduction"
									id="introduction_update_input" placeholder="爱好、经历......"
									rows="5" cols="50"></textarea>
								<span class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">笔试/面试时间</label>
							<div class="col-sm-10">
								<p class="form-control-static" id="usertime_update_static"></p>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="user_update_btn">保存</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">退出</button>
				</div>
			</div>
		</div>
	</div>


	<div class="container">
		<!-- 标题 -->
		<div class="row">
			<div class="col-md-12">
				<h1>超级管理员页面</h1>
			</div>
		</div>
		<!-- 按钮 -->
		<div class="row">
			<div class="col-md-4 col-md-offset-8">
				<button class="btn btn-default" id="anmin_update_modal_btn">修改</button>
				<button class="btn btn-primary" id="user_add_modal_btn">新增</button>
				<button class="btn btn-danger" id="user_delete_all_btn">删除</button>
				<button class="btn btn-success" id="time_update_btn">笔试</button>
				<button class="btn btn-warning" id="interview_update_btn">面试</button>
				<button class="btn btn-info" id="status_update_btn">分数段</button>
			</div>
		</div>
		<!-- 表格数据 -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover" id="user_table">
					<thead>
						<tr>
							<th><input type="checkbox" id="check_all" /></th>
							<th>#</th>
							<th>账号</th>
							<th>学校</th>
							<th>姓名</th>
							<th>年级</th>
							<th>手机</th>
							<th>邮箱</th>
							<th>地址</th>
							<th>状态</th>
						</tr>
					</thead>
					<tbody>

					</tbody>

				</table>
			</div>
		</div>
		<!-- 分页信息 -->
		<div class="row">
			<!-- 分页文字信息 -->
			<div class="clo-md-6" id="page_Info_area"></div>
			<!-- 分页条 -->
			<div class="clo-md-6" id="page_nav_area"></div>
		</div>
	</div>


	<script type="text/javascript">
	
	var searchUrl = window.location.href;
	var searchData = searchUrl.split("=");
	var searchText = decodeURI(searchData[1]);
	
		//1.页面加载后，直接发送ajax请求，要到分页数据
		$(function() {
	        $("#admin_update_btn").attr("admin-id",searchText);
			to_page(1);
		});

		//页面跳转函数
		function to_page(pn) {
			$.ajax({
				url : "${APP_PATH}/personController/PageUser",
				data : "pn=" + pn,
				type : "GET",
				success : function(result) {
					//console.log(result);
					//解析数据并显示，再显示分页信息
					build_person_table(result);
					build_page_Info(result);
					build_page_nav(result);
				}
			})
		};

		//解析显示人的数据表格
		function build_person_table(result) {
			//要先清空表格数据，防止界面紊乱
			$("#user_table tbody").empty();
			var users = result.extend.pageInfo.list;
			$.each(users, function(index, item) {
				//alert(item.name);
				var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>");
				checkBoxTd.attr("del-time-id",item.timeId);
				var userIdTd = $("<td></td>").append(item.id);
				var userAuTd = $("<td></td>").append(item.accountNumber);
				var userSnTd = $("<td></td>").append(item.schoolName);
				var userStunTd = $("<td></td>").append(item.studentName);
				var userGdTd = $("<td></td>").append(item.grade);
				var userTpTd = $("<td></td>").append(item.telephoneNumber);
				var userElTd = $("<td></td>").append(item.email);
				var userAdTd = $("<td></td>").append(item.adress);
				var userSt = item.status;
				//显示学生状态
				if(userSt==1){
					var userStTd = $("<td></td>").append("还未报名");
				}else if(userSt==2){
					var userStTd = $("<td></td>").append("已经报名");
				}else if(userSt==3){
					var userStTd = $("<td></td>").append("已经报名笔试");
				}else if(userSt==4){
					var userStTd = $("<td></td>").append("笔试分数："+item.score);
				}else if(userSt==5){
					var userStTd = $("<td></td>").append("该用户已被淘汰");
				}else if(userSt==6){
					var userStTd = $("<td></td>").append("该用户已通过了笔试(还未预约面试)");
				}else if(userSt==7){
					var userStTd = $("<td></td>").append("该用户已预约了面试");
				}else if(userSt==8){
					var userStTd = $("<td></td>").append("笔试成绩："+item.score+" "+"面试成绩："+item.interviewScore);
				}else{
					//显示管理员身份
					var endentity = item.isAdmin;
					if(endentity==1){
						var userStTd = $("<td></td>").append("该用户为超级管理员");
					}else if(endentity==3){
						var userStTd = $("<td></td>").append("该用户为笔试官");
					}else if(endentity==4){
						var userStTd = $("<td></td>").append("该用户为面试官");
					}else if(endentity==5){
						var userStTd = $("<td></td>").append("该用户为删除管理员");
					}else if(endentity==6){
						var userStTd = $("<td></td>").append("该用户为修改管理员");
					}else if(endentity==7){
						var userStTd = $("<td></td>").append("该用户为查看管理员");
					}
				}
				var editBtn = $("<button></button>")
						.addClass("btn btn-primary btn-sm edit_btn")
						.append($("<span></span>")
						.addClass("glyphicon glyphicon-pencil"))
						.append("编辑");
				editBtn.attr("edit-id",item.id);
				var delBtn = $("<button></button>")
						.addClass("btn btn-danger btn-sm delete_btn")
						.append($("<span></span>")
						.addClass("glyphicon glyphicon-trash"))
						.append("删除");
				delBtn.attr("del-id",item.id);
				delBtn.attr("del-time-id",item.timeId);
				var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
				$("<tr></tr>")
				.append(checkBoxTd)
				.append(userIdTd)
				.append(userAuTd)
				.append(userSnTd)
				.append(userStunTd)
				.append(userGdTd)
				.append(userTpTd)
				.append(userElTd)
				.append(userAdTd)
				.append(userStTd)
				.append(btnTd)
				.appendTo("#user_table tbody");
			});
		};

		//解析并且显示分页表格信息
		function build_page_Info(result) {
			$("#page_Info_area").empty();
			$("#page_Info_area").append(
					"当前" + result.extend.pageInfo.pageNum + "页，总共"
							+ result.extend.pageInfo.pages + "页，总共"
							+ result.extend.pageInfo.total + "条记录");
		}

		//解析并且显示分页条信息,导航条
		function build_page_nav(result) {
			$("#page_nav_area").empty();
			var ul = $("<ul></ul>").addClass("pagination");
			$.each(result.extend.pageInfo.navigatepageNums, function(index,
					item) {
				//遍历页码数	    		
				var numLi = $("<li></li>").append($("<a></a>").append(item));
				if (result.extend.pageInfo.pageNum == item) {
					numLi.addClass("active");
				}
				numLi.click(function() {
					to_page(item);
				});
				ul.append(numLi);
			})
			var nav = $("<nav></nav>").append(ul);
			nav.appendTo("#page_nav_area");
		}

		//新增按钮的绑定事件
		$("#user_add_modal_btn").click(function() {
			//先清除表单数据
			$("#userAddModal form")[0].reset();
			$("#userAddModal").modal({
				backdrop : "static"
			});
		});		
		
		//校验状态的检查
		function show_validate_msg(ele,status,msg){
			//清除当前的校验状态元素
			$(ele).parent().removeClass("has-error has-success");
			$(ele).next("span").text("");
			if("success"==status){
				$(ele).parent().addClass("has-success");
				$(ele).next("span").text(msg);				
			}else if("error"==status){
				$(ele).parent().addClass("has-error");
				$(ele).next("span").text(msg);					
			}
		}
		
		//校验新增表格信息
		function validate_addform(){
			var account = $("#userAccountNumber_add_input").val();
			var pwd = $("#userpwd_add_input").val();
			var pwd2 = $("#userpwd_add_input2").val();
			var schName = $("#userschool_add_input").val();
			var stuId = $("#userstuId_add_input").val();
			var userName = $("#userName_add_input").val();
			var teleNum = $("#usertele_add_input").val();
			var email = $("#useremail_add_input").val();
			var adress = $("#useradress_add_input").val();
			var introduction = $("#introduction_add_input").val();
			var regAccount = /^[0-9]{6}$/;
			var regSchoolName = /^[\u4e00-\u9fa5]{1,15}$/;
			var regName = /^[\u4e00-\u9fa5]{2,4}$/;
			var regStuId = /^[0-9]{10}$/;
			var regTele = /^1[0-9]{10}$/;
			var regemail = /^[a-zA-Z\d]+([-_\.][a-zA-Z\d]+)*@[a-zA-Z\d]+\.[a-zA-Z\d]{2,4}$/;
	        var regIntroAndAdress=/^\s*$/g;
			//账号校验
			if(!regAccount.test(account)){
				show_validate_msg("#userAccountNumber_add_input", "error","账号必须是六位数");
				return false;
			}else{
				show_validate_msg("#userAccountNumber_add_input", "success","");
			}
			//密码校验
			if (pwd!=pwd2||null==pwd||""==pwd||null==pwd2||""==pwd2){
				show_validate_msg("#userpwd_add_input", "error",
						"两次密码不相同或为空");
				return false;
			} else {
				show_validate_msg("#userpwd_add_input", "success", "");
				show_validate_msg("#userpwd_add_input2", "success", "");				
			};
			//学校校验
			if(!regSchoolName.test(schName)){
				show_validate_msg("#userschool_add_input", "error","学校名称必须为汉字");
				return false;
			}else{
				show_validate_msg("#userschool_add_input", "success", "");
			};
			//姓名校验
			if(!regName.test(userName)){
                show_validate_msg("#userName_add_input","error","请输入正确的角色名(2-4位中文)");				
				return false;
			}else{
                show_validate_msg("#userName_add_input","success","");						
			};
			//学号校验
			if(!regStuId.test(stuId)){
				show_validate_msg("#userstuId_add_input", "error","学号为10位数");
				return false;
			}else{
				show_validate_msg("#userstuId_add_input", "success", "");
			};
			//手机号码校验
			if(!regTele.test(teleNum)){
				show_validate_msg("#usertele_add_input", "error","请输入正确的手机号码");
				return false;
			}else{
				show_validate_msg("#usertele_add_input", "success", "");
			};	
			//校验邮箱
			if(!regemail.test(email)){
				show_validate_msg("#useremail_add_input", "error","请输入正确的邮箱");
				return false;
			}else{
				show_validate_msg("#useremail_add_input", "success", "");
			};
			//地址校验
			if(regIntroAndAdress.test(adress)){
				show_validate_msg("#useradress_add_input", "error","地址不能为空");
				return false;
			}else{
				show_validate_msg("#useradress_add_input", "success", "");
			};
			//自我介绍校验
			if(regIntroAndAdress.test(introduction)){
				show_validate_msg("#introduction_add_input", "error","自我介绍不能为空");
				return false;
			}else{
				show_validate_msg("#introduction_add_input", "success", "");
			};
			return true;
		}
		
		//新增按钮里面的保存按钮的绑定事件
		$("#user_save_btn").click(function(){
			//1、发送ajax请求提交表单数据给服务器
			if(!validate_addform()){
				return false;
			}
			
			//2、检查账号是否存在
			$.ajax({
				url:"${APP_PATH}/personController/accountFind/"+$("#userAccountNumber_add_input").val(),
				type:"POST",
				success:function(result){
					if(result.extend.type=="Ok"){
						show_validate_msg("#userAccountNumber_add_input", "error","该账号已存在");
					}else{
						//3.获取插入者的身份
						//4.进行插入
						$.ajax({
							url:"${APP_PATH}/personController/insertUser",
							type:"POST",
							data:$("#userAddModal form").serialize(),
							success:function(result){
								//5.保存成功后关闭模态框
								$("#userAddModal").modal('hide');
							}
						});
					}
				}
				});
		});
		
		//删除一个人按钮绑定事件弹出模态框
		$(document).on("click",".delete_btn",function(){
			var userName = $(this).parents("tr").find("td:eq(4)").text();
			var userId = $(this).attr("del-id");
			if(confirm("确认删除【"+userName+"】吗?")){
				$.ajax({
					url:"${APP_PATH}/timeController/deleteUser/"+$(this).attr("del-time-id"),
					type:"POST",
					success:function(result){
						$.ajax({
							url:"${APP_PATH}/adminController/deleteUser/"+userId,
							type:"POST",
							success:function(result){
								alert("删除成功");
								to_page(1);
							}
						});
					}					
				});
			}
		});
		
		//编辑按钮绑定事件弹出模态框
		$(document).on("click",".edit_btn",function(){
            getPerson($(this).attr("edit-id"));
            //给更新按钮加Id方便保存时获取
            $("#user_update_btn").attr("edit-id",$(this).attr("edit-id"));
			$("#userUpdateModal").modal({
				backdrop : "static"
			});
		});
		
		//查找角色信息,完善修改查看表
		function getPerson(id){
			$.ajax({
				url:"${APP_PATH}/personController/IDfind/"+id,
				type:"GET",
				success:function(result){
					//构建表格
				    var userData = result.extend.Id_find_user;
				    $("#userId_update_static").text(userData.id);
				    $("#useraccount_update_static").text(userData.accountNumber);				    
				    $("#userName_update_input").val(userData.studentName);
				    $("#userstuId_update_input ").val(userData.studentId);
				    $("#userschool_update_input  ").val(userData.schoolName);
				    $("#usergrade_update_input  ").val(userData.grade);
				    $("#usertele_update_input ").val(userData.telephoneNumber);
				    $("#useremail_update_input ").val(userData.email);
				    $("#useradress_update_input ").val(userData.adress);
				    $("#introduction_update_input").val(userData.self_introduction);
					 $("#usertime_update_static").text("");
				    if(userData.timeId!=0){
				    $.ajax({
				    	url:"${APP_PATH}/timeController/timeUser/"+userData.timeId,
				    	type:"POST",
				    	success:function(result){
				    		var begin_over_time = result.extend.time.begin_time+"——"+result.extend.time.over_time;
 						    $("#usertime_update_static").text(begin_over_time);
				    	}
				     });
				   }
				}				
			});
		}
		
		//校验修改表格
		function validate_updateform(){
			var schName = $("#userschool_update_input").val();
			var stuId = $("#userstuId_update_input").val();
			var userName = $("#userName_update_input").val();
			var teleNum = $("#usertele_update_input").val();
			var email = $("#useremail_update_input").val();
			var adress = $("#useradress_update_input").val();
			var introduction = $("#introduction_update_input").val();
			var regSchoolName = /^[\u4e00-\u9fa5]{1,15}$/;
			var regName = /^[\u4e00-\u9fa5]{2,4}$/;
			var regStuId = /^[0-9]{10}$/;
			var regTele = /^1[0-9]{10}$/;
			var regemail = /^[a-zA-Z\d]+([-_\.][a-zA-Z\d]+)*@[a-zA-Z\d]+\.[a-zA-Z\d]{2,4}$/;
	        var regIntroAndAdress=/^\s*$/g;
			//学校校验
			if(!regSchoolName.test(schName)){
				show_validate_msg("#userschool_update_input", "error","学校名称必须为汉字");
				return false;
			}else{
				show_validate_msg("#userschool_update_input", "success", "");
			};
			//姓名校验
			if(!regName.test(userName)){
                show_validate_msg("#userName_update_input","error","请输入正确的角色名(2-4位中文)");				
				return false;
			}else{
                show_validate_msg("#userName_update_input","success","");						
			};
			//学号校验
			if(!regStuId.test(stuId)){
				show_validate_msg("#userstuId_update_input", "error","学号为10位数");
				return false;
			}else{
				show_validate_msg("#userstuId_update_input", "success", "");
			};
			//手机号码校验
			if(!regTele.test(teleNum)){
				show_validate_msg("#usertele_update_input", "error","请输入正确的手机号码");
				return false;
			}else{
				show_validate_msg("#usertele_update_input", "success", "");
			};	
			//校验邮箱
			if(!regemail.test(email)){
				show_validate_msg("#useremail_update_input", "error","请输入正确的邮箱");
				return false;
			}else{
				show_validate_msg("#useremail_update_input", "success", "");
			};
			//地址校验
			if(regIntroAndAdress.test(adress)){
				show_validate_msg("#useradress_update_input", "error","地址不能为空");
				return false;
			}else{
				show_validate_msg("#useradress_update_input", "success", "");
			};
			//自我介绍校验
			if(regIntroAndAdress.test(introduction)){
				show_validate_msg("#introduction_update_input", "error","自我介绍不能为空");
				return false;
			}else{
				show_validate_msg("#introduction_update_input", "success", "");
			};
			return true;
		}
		
		//修改表格更新按钮绑定事件		
		$("#user_update_btn").click(function(){
			//1、验证姓名格式
			if(!validate_updateform()){
				return false;
			}
			//2、发送ajax请求
			$.ajax({
				url:"${APP_PATH}/personController/updateUser/"+$(this).attr("edit-id"),
				type:"POST",
				data:$("#userUpdateModal form").serialize(),
				success:function(result){
				    //1关闭模态框
					$("#userUpdateModal").modal('hide');
				    //回到第一页
					to_page(1);
				}				
			});
		});
		
		//点击全选和全不选功能
		$("#check_all").click(function(){
			$(".check_item").prop("checked",$(this).prop("checked"));
		});
		
		//当选择全部时自动勾全选
		$(document).on("click",".check_item",function(){
			var flag = $(".check_item:checked").length==$(".check_item").length;
			$("#check_all").prop("checked",flag);
		});
		
		//点击全部删除时的操作
		$("#user_delete_all_btn").click(function(){
			var userNames = "";
			var del_idstr = "";
			var del_timeIds = "";
			$.each($(".check_item:checked"),function(){
				userNames += $(this).parents("tr").find("td:eq(4)").text()+",";
				del_idstr += $(this).parents("tr").find("td:eq(1)").text()+"-";
				del_timeIds += $(this).parents("td").attr("del-time-id")+"-";
			});
			userNames=userNames.substring(0,userNames.length-1);
			del_idstr=del_idstr.substring(0,del_idstr.length-1);
			del_timeIds=del_timeIds.substring(0,del_timeIds.length-1);
			if(""!=userNames){
			if(confirm("确认删除【"+userNames+"】这些用户吗？")){
				$.ajax({
					url:"${APP_PATH}/timeController/deleteUser/"+del_timeIds,
					type:"POST",
				});
				$.ajax({
					url:"${APP_PATH}/personController/deleteUser/"+del_idstr,
					type:"POST",
					success:function(result){
						alert("删除成功！");
						to_page(1);
					}
				});
				}
			}
		});
		
		//为时间安排按钮绑定事件
		$("#time_update_btn").click(function(){
			//先清除表单数据
			$("#TimeAddModal form")[0].reset();
			$("#TimeAddModal").modal({
				backdrop : "static"
			});
			$.ajax({
				url : "${APP_PATH}/timeController/queryAllTime",
				type : "POST",
				data : "typeId="+"1",
				success:function(result){
					build_time_table(result);
				}
			});
		});
		
		//构建事件表单
		function build_time_table(result){
			$("#time_table tbody").empty();
			var times = result.extend.times;
			$.each(times, function(index, item) {
				var timeIdTd = $("<td></td>").append(item.id);
				var timeANTd = $("<td></td>").append(item.all_number);
				var timeBTTd = $("<td></td>").append(item.begin_time);
				var timeOTTd = $("<td></td>").append(item.over_time);
				var timeNNTd = $("<td></td>").append(item.now_number);
				$("<tr></tr>")
				.append(timeIdTd)
				.append(timeBTTd)
				.append(timeOTTd)
				.append(timeANTd)
				.append(timeNNTd)
				.appendTo("#time_table tbody");
			});
		}

		
		//为添加时间段的保存按钮绑定事件
		$("#time_save_btn").click(function(){
			//1.校验时间格式
			if(!validate_timeform()){
				return false;
			}
			//2.校验时间是否开始的小于结束的时间
			var begintime =$("#time_add_begin_input").val();
			var overtime =$("#time_add_over_input").val();
			var   over=new Date(Date.parse(overtime .replace(/-/g,"/")));
			var   begin=new Date(Date.parse(begintime .replace(/-/g,"/")));
			if(begin>=over)	{
				show_validate_msg("#time_add_begin_input", "error","开始的时间不应该大于结束时间");
				return false;
			}		
			//3.发送ajax请求保存时间段
			$.ajax({
				url:"${APP_PATH}/timeController/insertTime",
				type:"POST",
				data:$("#TimeAddModal form").serialize(),
				success:function(result){
					$("#TimeAddModal").modal('hide');
				}
			});
		});
		
		//校验增加笔试时间表格
		function validate_timeform(){
			var beginm_time = $("#time_add_begin_input").val();
			var over_time = $("#time_add_over_input").val();
			var Number = $("#time_add_number_input").val();
			var regNumber = /^[0-9]{1,5}$/;
	        var regTime = /^(\d{4})-((0([1-9]{1}))|(1[0|1|2]))-(([0-2]([0-9]{1}))|(3[0|1]))\s([01][0-9]|2[0-3]):([0-5][0-9])$/;
			//开始时间
			if(!regTime.test(beginm_time)){
				show_validate_msg("#time_add_begin_input", "error","格式不正确(xxxx-xx-xx xx:xx)");
				return false;
			}else{
				show_validate_msg("#time_add_begin_input", "success", "");
			};
			//结束时间
			if(!regTime.test(over_time)){
                show_validate_msg("#time_add_over_input","error","格式不正确(xxxx-xx-xx xx:xx)");				
				return false;
			}else{
                show_validate_msg("#time_add_over_input","success","");						
			};
			//人数
			if(!regNumber.test(Number)){
				show_validate_msg("#time_add_number_input", "error","请输入人数");
				return false;
			}else{
				show_validate_msg("#time_add_number_input", "success", "");
			};
			return true;
		}
		
		//点击面试时间安排
		$("#interview_update_btn").click(function(){
			//先清除表单数据
			$("#InterviewAddModal form")[0].reset();
			$("#InterviewAddModal").modal({
				backdrop : "static"
			});
			$.ajax({
				url : "${APP_PATH}/timeController/queryAllTime",
				type : "POST",
				data : "typeId="+"2",
				success:function(result){
					build_interview_table(result);
				}
			});
		});
		
		//面试时间表显示
		function build_interview_table(result){
			$("#interview_table tbody").empty();
			var times = result.extend.times;
			$.each(times, function(index, item) {
				var timeIdTd = $("<td></td>").append(item.id);
				var timeANTd = $("<td></td>").append(item.all_number);
				var timeBTTd = $("<td></td>").append(item.begin_time);
				var timeOTTd = $("<td></td>").append(item.over_time);
				var timeNNTd = $("<td></td>").append(item.now_number);
				$("<tr></tr>")
				.append(timeIdTd)
				.append(timeBTTd)
				.append(timeOTTd)
				.append(timeANTd)
				.append(timeNNTd)
				.appendTo("#interview_table tbody");
			});
		}			
		
		//校验面试时间增加表
		function validate_interviewform(){
			var beginm_time = $("#interview_add_begin_input").val();
			var over_time = $("#interview_add_over_input").val();
			var Number = $("#interview_add_number_input").val();
			var regNumber = /^[0-9]{1,5}$/;
	        var regTime = /^(\d{4})-((0([1-9]{1}))|(1[0|1|2]))-(([0-2]([0-9]{1}))|(3[0|1]))\s([01][0-9]|2[0-3]):([0-5][0-9])$/;
			//开始时间
			if(!regTime.test(beginm_time)){
				show_validate_msg("#interview_add_begin_input", "error","格式不正确(xxxx-xx-xx xx:xx)");
				return false;
			}else{
				show_validate_msg("#interview_add_begin_input", "success", "");
			};
			//结束时间
			if(!regTime.test(over_time)){
                show_validate_msg("#interview_add_over_input","error","格式不正确(xxxx-xx-xx xx:xx)");				
				return false;
			}else{
                show_validate_msg("#interview_add_over_input","success","");						
			};
			//人数
			if(!regNumber.test(Number)){
				show_validate_msg("#interview_add_number_input", "error","请输入人数");
				return false;
			}else{
				show_validate_msg("#interview_add_number_input", "success", "");
			};
			return true;
		}
		
		//面试时间安排的保存按钮
			$("#interview_save_btn").click(function(){
			//1.校验面试时间的输入格式
			if(!validate_interviewform()){
				return false;
			}
			//2.校验输入时间的大小关系
			var begintime =$("#interview_add_begin_input").val();
			var overtime =$("#interview_add_over_input").val();
			var   over=new Date(Date.parse(overtime .replace(/-/g,"/")));
			var   begin=new Date(Date.parse(begintime .replace(/-/g,"/")));
			if(begin>=over)	{
				show_validate_msg("#interview_add_begin_input", "error","开始的时间不应该大于结束时间");
				return false;
			}	
			//3.发送ajax请求保存时间段
			$.ajax({
				url:"${APP_PATH}/timeController/insertInterviewTime",
				type:"POST",
				data:$("#InterviewAddModal form").serialize(),
				success:function(result){
					$("#InterviewAddModal").modal('hide');
				}
			});
		});
		
		
		//分数段截取按钮绑定事件status_update_btn  ScoreModal
		$("#status_update_btn").click(function(){
			//先清除表单数据
			$("#ScoreModal form")[0].reset();
			$("#ScoreModal").modal({
				backdrop : "static"
			});
		});
		
		//为分数段截取模态框的确认按钮绑定事件score-update_btn
		$("#score-update_btn").click(function(){
			//校验为数字
			var regNumber = /^[0-9]{1,5}$/;
			var number =  $("#status_update_input").val();
			if(!regNumber.test(number)){
				show_validate_msg("#status_update_input", "error", "请输入数字");
				return false;
			}
			//截断分数段
			$.ajax({
				url:"${APP_PATH}/personController/scoreCut",
				type:"POST",
				data:"score="+ $("#status_update_input").val(),
				success:function(){
					$("#ScoreModal").modal('hide');
				}
			});
		});
		
		//为管理员修改自身信息按钮绑定事件  adminUpdateModal
		$("#anmin_update_modal_btn").click(function(){
			build_admin_table();
			$("#adminUpdateModal").modal({
				backdrop : "static"
			});
		});
		
		//超级管理员的个人信息修改
		function build_admin_table(){
			$("#adminUpdateModal tbody").empty();
			$.ajax({
				//1.查找管理员信息
				url:"${APP_PATH}/personController/IDfind/"+searchText,
				type:"GET",
				success:function(result){
				//2.构造管理员的信息表
				    var userData = result.extend.Id_find_user;
				    $("#admin_name_input ").val(userData.studentName);
				    $("#admin_telephone_input ").val(userData.telephoneNumber);
				    $("#admin_adress_input ").val(userData.adress);
				    }
			});
		}
		
		//管理员信息修改表的保存按钮绑定事件 admin_save_btn
		$("#admin_save_btn").click(function(){
			if(confirm("确定修改？")){
				//1.校验数据
				if(!validate_adminModalform()){
					return false;
				}
				//2.发送ajax请求
				$.ajax({
					url:"${APP_PATH}/personController/adminUpdate/"+searchText,
					type:"POST",
					data:$("#adminUpdateModal form").serialize(),
					success:function(result){
						$("#adminUpdateModal").modal('hide');
					    }
				});
			}
		});
		
		
		//校验数据
		function validate_adminModalform(){
			var name = $("#admin_name_input").val();
			var telephone = $("#admin_telephone_input").val();
			var adress = $("#admin_adress_input").val();
			var regname = /^[\u4e00-\u9fa5]{2,4}$/;
			var regtelephone = /^1[0-9]{10}$/;
	        var regadress = /^\s*$/g;
			//校验用户名
			if(!regname.test(name)){
				show_validate_msg("#admin_name_input", "error","用户名为2-4位汉字");
				return false;
			}else{
				show_validate_msg("#admin_name_input", "success", "");
			};
			//校验电话
			if(!regtelephone.test(telephone)){
                show_validate_msg("#admin_telephone_input","error","电话号码格式错误");				
				return false;
			}else{
                show_validate_msg("#admin_telephone_input","success","");						
			};
			//校验地址
			if(regadress.test(adress)){
				show_validate_msg("#admin_adress_input", "error","地址不为空");
				return false;
			}else{
				show_validate_msg("#admin_adress_input", "success", "");
			};
			return true;
		}
		
		
		//管理员点击修改密码时的操作 adminUpdatePasswordModal
		$("#admin_updatePassword_btn").click(function(){
			$("#adminUpdateModal").modal('hide');
			//先清除表单数据
			$("#adminPasswordModal form")[0].reset();
			$("#adminPasswordModal").modal({
				backdrop : "static"
			});
		});
		
		//修改密码一级窗口的确认密码  original_password_btn
		$("#original_password_btn").click(function(){
			$.ajax({
				url:"${APP_PATH}/personController/adminConfirmPassword/"+searchText,
				type:"POST",
				data:"original_password="+ $("#admin_updatePassWord_input").val(),
				success:function(result){
					//根据后台返回信息显示状态
					if(result.extend.type=="error"){
						//密码错误显示错误信息
			 			show_validate_msg("#admin_updatePassWord_input", "error","密码错误");
					}else{
						//密码正确弹出新的模态框   adminUpdatePasswordModal
						$("#adminPasswordModal").modal('hide');
						$("#adminUpdatePasswordModal form")[0].reset();
						$("#adminUpdatePasswordModal").modal({
							backdrop : "static"
						});	
					}
				 }
			});
		});
		
		
		//保存新密码   admin_updatepassword_btn
		$("#admin_savepassword_btn").click(function(){
			//1.校验新密码
			var PassWord=$("#admin_savePassWord_input").val();
			var PassWord2=$("#admin_savePassWord2_input").val();
			if(PassWord!=PassWord2||null==PassWord||""==PassWord2||null==PassWord||""==PassWord2){
				show_validate_msg("#admin_savePassWord_input", "error","两次密码不相等或有为空！");
				return false;
			}else{
			//2.发送ajax请求更改密码
				$.ajax({
					url:"${APP_PATH}/personController/adminSavePassword/"+searchText,
					type:"POST",
					data:"password="+PassWord,
					success:function(){
						$("#adminUpdatePasswordModal").modal('hide');
					}
				});
			}
		});
		
		
	</script>
</body>
</html>