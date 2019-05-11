<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册界面</title>
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
	<!-- 注册成功弹出的模态框 -->
	<div class="modal fade" id="AccountNumber_modal" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document"
			style="position: absolute; top: 0; bottom: 0; left: 0; right: 0;">
			<div class="modal-content"
				style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); width: 100%;">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group">
							<label class="col-sm-4 control-label">你获得的账号是：</label>
							<div class="col-sm-4">
								<p class="form-control-static" id="AccountNumber_static"></p>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<a href="http://localhost:8080/maven-ssm-web/login.jsp"><button
							type="button" class="btn btn-primary" id="confirm_btn">确认</button></a>
				</div>
			</div>
		</div>
	</div>

	<!-- 主题部分 -->
	<div id="registeTable" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">注册账号</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group">
							<label class="col-sm-2 control-label">学校名称</label>
							<div class="col-sm-10">
								<input type="text" name="SchoolName" class="form-control"
									id="SchoolName_add_input" placeholder="学校名称（广东工业大学）"> <span
									class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">姓名</label>
							<div class="col-sm-10">
								<input type="text" name="StudentName" class="form-control"
									id="StudentName_add_input" placeholder="姓名（2-4位汉字）"> <span
									class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">学号</label>
							<div class="col-sm-10">
								<input type="text" name="StudentId" class="form-control"
									id="StudentId_add_input" placeholder="学号（10位数）"> <span
									class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label for="email" class="col-sm-2 control-label">年级</label>
							<div class="col-sm-10">
								<select class="form-control" id="Grade" name="Grade">
									<option value="2018级">2018级</option>
									<option value="2017级">2017级</option>
									<option value="2016级">2016级</option>
									<option value="2015级">2015级</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">手机号码</label>
							<div class="col-sm-10">
								<input type="text" name="TelephoneNumber" class="form-control"
									id="TelephoneNumber_add_input" placeholder="手机号码（11位）">
								<span class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">密码</label>
							<div class="col-sm-10">
								<input type="password" name="PassWord" class="form-control"
									id="PassWord_add_input" placeholder="输入密码"> <span
									class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">再次输入</label>
							<div class="col-sm-10">
								<input type="password" name="PassWord2" class="form-control"
									id="PassWord2_add_input" placeholder="再次输入密码"> <span
									class="help-block"></span>
							</div>
						</div>
						<input type="button" value="选择头像" onclick="javascript:$('input[name=\'PicturePath\']').click();" /> 
						<input name="Picture" readonly /> 
						<input type="file" name="PicturePath" style="display: none;"
							   onchange="javascript:$('input[name=\'Picture\']').val(this.files[0].name);"  id="pictureFile"/>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="user_save_btn">保存</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">
						<a href="http://localhost:8080/maven-ssm-web/login.jsp">返回</a>
					</button>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		//校验表单
		function validate_form() {
			var schName = $("#SchoolName_add_input").val();
			var stuId = $("#StudentId_add_input").val();
			var userName = $("#StudentName_add_input").val();
			var teleNum = $("#TelephoneNumber_add_input").val();
			var password = $("#PassWord_add_input").val();
			var repassword = $("#PassWord2_add_input").val();
			var regSchoolName = /^[\u4e00-\u9fa5]{1,15}$/;
			var regName = /^[\u4e00-\u9fa5]{2,4}$/;
			var regStuId = /^[0-9]{10}$/;
			var regTele = /^1[0-9]{10}$/;
			//学校校验
			if (!regSchoolName.test(schName)) {
				show_validate_msg("#SchoolName_add_input", "error", "学校名称必须为汉字");
				return false;
			} else {
				show_validate_msg("#SchoolName_add_input", "success", "");
			}
			//姓名校验
			if (!regName.test(userName)) {
				show_validate_msg("#StudentName_add_input", "error",
						"请输入正确的角色名(2-4位中文)");
				return false;
			} else {
				show_validate_msg("#StudentName_add_input", "success", "");
			}
			//学号校验
			if (!regStuId.test(stuId)) {
				show_validate_msg("#StudentId_add_input", "error", "学号为10位数");
				return false;
			} else {
				show_validate_msg("#StudentId_add_input", "success", "");
			}
			//手机号码校验
			if (!regTele.test(teleNum)) {
				show_validate_msg("#TelephoneNumber_add_input", "error",
						"请输入正确的手机号码");
				return false;
			} else {
				show_validate_msg("#TelephoneNumber_add_input", "success", "");
			}
			//密码校验
			if (password != repassword || null == repassword
					|| "" == repassword || null == repassword
					|| "" == repassword) {
				show_validate_msg("#PassWord_add_input", "error", "两次密码不相同或为空");
				return false;
			} else {
				show_validate_msg("#PassWord_add_input", "success", "");
				show_validate_msg("#PassWord2_add_input", "success", "");
			}
			return true;
		}

		//校验状态的检查
		function show_validate_msg(ele, status, msg) {
			//清除当前的校验状态元素
			$(ele).parent().removeClass("has-error has-success");
			$(ele).next("span").text("");
			if ("success" == status) {
				$(ele).parent().addClass("has-success");
				$(ele).next("span").text(msg);
			} else if ("error" == status) {
				$(ele).parent().addClass("has-error");
				$(ele).next("span").text(msg);
			}
		}

		//保存按钮的绑定事件
		$("#user_save_btn").click(function() {
					//发送ajax请求提交表单数据给服务器
					if (!validate_form()) {
						return false;
					}
					var formData = new FormData();
	        		formData.append("pictureFile", $("#pictureFile")[0].files[0]);
					$.ajax({
						url : "${APP_PATH}/userController/ChangePicture",
						type : "POST",
						data : formData,
			            processData: false,
			            contentType: false,
						success : function(result) {
							$("#registeTable form Picture").val(result.extend.picturePath);
							$.ajax({
								url : "${APP_PATH}/userController/insertUser",
								type : "POST",
								data : $("#registeTable form").serialize()
										+"&"+"picturePath="+result.extend.picturePath,
								success : function(result) {
									
									$("#AccountNumber_modal").modal({
										backdrop : "static"
									});
									$("#AccountNumber_static").text(
											result.extend.AccountNumber);
								}
							});
						}
					});
				});
		
	</script>
</body>
</html>