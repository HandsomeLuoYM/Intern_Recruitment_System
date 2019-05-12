<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.System.model.User"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户页面</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
</head>
<body>

  	<!-- 用户笔试和面试选择时间 -->
    <div class="modal fade" id="TimeModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">笔试时间</h4>
				</div>
				<table class="table table-hover" id="time_table">
					<thead>
						<tr>
							<th>#</th>
							<th>开始时间	</th>
							<th>结束时间</th>
							<th>总人数</th>
							<th>目前人数</th>
							<th>报名</th>							
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>				
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">退出</button>
				</div>
			</div>
		</div>
	</div>

 <!-- 用户报名的模态框 -->
    <div class="modal fade" id="TimeAddModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">用户报名</h4>
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
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">退出</button>
				</div>
			</div>
		</div>
	</div>
	
	
	
	<!-- 点击报名弹出的模态框 -->
	<div class="modal fade" id="enrollModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">介绍一下自己吧</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">				
						<div class="form-group">
							<label class="col-sm-2 control-label">学校</label>
							<div class="col-sm-10">
								<p class="form-control-static" id="schoolName_enroll_static"></p>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">姓名</label>
							<div class="col-sm-10">
								<p class="form-control-static" id="studentName_enroll_static"></p>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">学号</label>
							<div class="col-sm-10">
								<p class="form-control-static" id="studentId_enroll_static"></p>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">年级</label>
							<div class="col-sm-10">
								<p class="form-control-static" id="grade_enroll_static"></p>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">账号</label>
							<div class="col-sm-10">
								<p class="form-control-static" id="studentName_enroll_static"></p>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">电话</label>
							<div class="col-sm-10">
								<p class="form-control-static" id="telephoneNumber_enroll_static"></p>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">邮箱</label>
							<div class="col-sm-10">
								<input type="text" name="Email" class="form-control"
									id="email_enroll_input" placeholder="邮箱"> <span
									class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">地址</label>
							<div class="col-sm-10">
								<input type="text" name="Adress" class="form-control"
									id="adress_enroll_input" placeholder="地址"> <span
									class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">自我介绍</label><span
								class="help-block"></span>
							<div class="col-sm-10">
								<textarea name="Self_introduction" id="intro_text"
									placeholder="爱好、经历......" rows="15" cols="50"></textarea>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="user_enroll_btn">报名</button>
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
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="user_update_btn">修改</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">退出</button>
				</div>
			</div>
		</div>
	</div>


	<!-- 表格数据 -->
	<div class="container">
		<!-- 标题 -->
		<div class="row">
			<div class="col-md-12">
				<h1>用户页面</h1>
				<img id="file" src="" name="pictureFile" class="img-circle"
					height=75 width=75> <input type="button" value="更改头像"
					class="btn btn-default"
					onclick="javascript:$('input[name=\'PicturePath\']').click();" />
				<input name="Picture" readonly /> <input type="file"
					name="PicturePath" style="display: none;"
					onchange="javascript:$('input[name=\'Picture\']').val(this.files[0].name);"
					id="pictureFile" />
					<button class="btn btn-info" id="update_picture_btn">确认</button>
			</div>
		</div >
        <div class="alert alert-success" role="alert">
        		<div class="row">
		<div class="col-md-12">
		<table id="Tip_table">
			  <tbody>
			        
			  </tbody>
		</table>
		</div>	
		</div></div>			
		<!-- 按钮 -->
		<div class="row">
			<div class="col-md-4 col-md-offset-8">
				<button class="btn btn-primary" id="update_modal_btn">完善个人信息</button>
<!-- 				<button class="btn btn-info" id="update_picture_btn">修改头像</button> -->
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover" id="user_table">
					<thead>
						<tr>
							<th>#</th>
							<th>账号</th>
							<th>学校</th>
							<th>姓名</th>
							<th>年级</th>
							<th>手机</th>
							<th>邮箱</th>
							<th>地址</th>
						</tr>
					</thead>
					<tbody>

					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">

	var searchUrl = window.location.href;
	var searchData = searchUrl.split("=");
	var searchText = decodeURI(searchData[1]);
	
	$(function() {
		getData();
	})

	function getData() {
        $("#enroll_modal_btn").attr("enroll-id",searchText);        
        $("#update_modal_btn").attr("update-id",searchText);
		getUser(searchText);
	};
	
	
	//根据Id获取用户信息
	function getUser(id){
			$.ajax({
				url:"${APP_PATH}/userController/IDfindUser/"+id,
				type:"GET",
				success:function(result){
					build_person_table(result);
				}				
			});
		}
	
	
	//建立修改表的个人信息
	function update_table_build(id){
		$.ajax({
			url:"${APP_PATH}/userController/IDfindUser/"+id,
			type:"GET",
			success:function(result){
			    var user = result.extend.user;
			    $("#userId_update_static").text(user.id);
			    $("#useraccount_update_static").text(user.accountNumber);			    
			    $("#userschool_update_input").val(user.schoolName);
			    $("#userName_update_input").val(user.studentName);
			    $("#userstuId_update_input").val(user.studentId);
			    $("#Grade").val(user.grade);
			    $("#usertele_update_input").val(user.telephoneNumber);
			    $("#useremail_update_input").val(user.email);	
			    $("#useradress_update_input").val(user.adress);			 
			}				
		});
	}
	
	
	//建立表单个人信息
	function build_person_table(result) {
		//要先清空表格数据，防止界面紊乱
		$("#user_table tbody").empty();
		var user = result.extend.user;
			var status = user.status;
			
			$("#file").attr("src",user.picture);
			var userIdTd = $("<td></td>").append(user.id);
			var accountTd = $("<td></td>").append(user.accountNumber);
			var userNameTd = $("<td></td>").append(user.studentName);
			var userschTd = $("<td></td>").append(user.schoolName);
			var usergradeTd = $("<td></td>").append(user.grade);
			var userteleTd = $("<td></td>").append(user.telephoneNumber);
			var useremailTd = $("<td></td>").append(user.email);
			var useradressTd = $("<td></td>").append(user.adress);
			if(status==1){
				var status = $("<td></td>").append("你还没有报名哟！");
				var enjoin =$("<button></button>")
				.addClass("btn btn-danger enroll_modal_btn")
				.append("报名");
				var tipTd=$("<tr></tr>").append(status).append(enjoin);
				$("<tr></tr>").append(tipTd).appendTo("#Tip_table tbody");
			}else if(status==2){				
				var status = $("<td></td>").append("你已经报名了哟！   ");
				var enjoin =$("<button></button>")
				.addClass("btn btn-danger enroll_modal_btn")
				.append("修改报名信息");
				var interTd =$("<button></button>")
				.addClass("btn btn-info enter-btn")
				.append("报名笔试");
				interTd.attr("inter-id",user.id);
				var tipTd=$("<tr></tr>").append(status).append(enjoin).append(interTd);
				$("<tr></tr>").append(tipTd).appendTo("#Tip_table tbody");
			}else if(status==3){
				var status = $("<td></td>").append("你已经报名笔试了 ！");
				 $.ajax({
				    	url:"${APP_PATH}/timeController/timeUser/"+user.timeId,
				    	type:"POST",
				    	success:function(result){
				    		var begintime=result.extend.time.begin_time;
				    		var overtime=result.extend.time.over_time;
				    		var   over=new Date(Date.parse(overtime .replace(/-/g,"/")));
				    		var   begin=new Date(Date.parse(begintime .replace(/-/g,"/")));
				            var   curDate=new Date();
				            if(over>=curDate&&begin<=curDate){
								var interTd =$("<button></button>")
								.addClass("btn btn-success exam-begin-btn")
								.append("开始笔试考试");	
								interTd.attr("inter-id",user.id);
								var tipTd=$("<tr></tr>").append(status).append(interTd);
								$("<tr></tr>").append(tipTd).appendTo("#Tip_table tbody");
							}else{
								var interTd = "你的笔试时间是："+result.extend.time.begin_time+"--"+result.extend.time.over_time;
								var tipTd=$("<tr></tr>").append(status).append(interTd);
								$("<tr></tr>").append(status).append(tipTd).appendTo("#Tip_table tbody");

				            }
				    	}
				     });
			}else if(status==4){
				var tipTd = $("<td></td>").append("你已经完成了笔试，结果请等待通知！（结果通过你的邮箱和该页面通知）");
				$("<tr></tr>").append(tipTd).appendTo("#Tip_table tbody");
			}else if(status==5){
				var tipTd = $("<td></td>").append("抱歉！你未能通过笔试，希望你继续努力！");
				$("<tr></tr>").append(tipTd).appendTo("#Tip_table tbody");
			}else if(status==6){
				var status = $("<td></td>").append("恭喜"+user.studentName+"用户通过了笔试！");
				var interTd =$("<button></button>")
				.addClass("btn btn-info enterInterview-btn")
				.append("报名面试");
				interTd.attr("inter-id",user.id);
				var tipTd=$("<tr></tr>").append(status).append(interTd);
				$("<tr></tr>").append(tipTd).appendTo("#Tip_table tbody");
			}else if(status==7){
				var status = $("<td></td>").append("恭喜"+user.studentName+"面试预约成功！");
				var interTd ="";
				var tipTd=$("<tr></tr>").append(status).append(interTd);
				$("<tr></tr>").append(tipTd).appendTo("#Tip_table tbody");
			}else if(status==8){
				var status = $("<td></td>").append(user.studentName+"你的笔试成绩："+user.score+" "+"面试成绩："+user.interviewScore);
				var tipTd=$("<tr></tr>").append(status);
				$("<tr></tr>").append(tipTd).appendTo("#Tip_table tbody");
			}
			var retip=$("<td></td>").addClass("alert alert-success");
			var retip2=$("<td></td>").addClass("alert alert-success");
			$("<tr></tr>").append(userIdTd).append(accountTd).append(userschTd).append(userNameTd).append(
							usergradeTd).append(userteleTd).append(useremailTd).append(useradressTd).appendTo(
							"#user_table tbody");
	};
	
	//点击修改完善个人信息弹出并建立模态框.
	$("#update_modal_btn").click(function(){
		update_table_build($(this).attr("update-id"));
        $("#user_update_btn").attr("update-id",$(this).attr("update-id"));
		$("#userUpdateModal").modal({
			backdrop : "static"
		});
	});
	
	//点击保存的事件
		$("#user_update_btn").click(function(){
			//1、验证格式
			var schName = $("#userschool_update_input").val();
			var stuId = $("#userstuId_update_input").val();
			var userName = $("#userName_update_input").val();
			var teleNum = $("#usertele_update_input").val();
			var email = $("#useremail_update_input").val();
			var regSchoolName = /^[\u4e00-\u9fa5]{1,15}$/;
			var regName = /^[\u4e00-\u9fa5]{2,4}$/;
			var regStuId = /^[0-9]{10}/;
			var regTele = /^1[0-9]{10}/;
			var regemail = /^[a-zA-Z\d]+([-_\.][a-zA-Z\d]+)*@[a-zA-Z\d]+\.[a-zA-Z\d]{2,4}$/;
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
			//2、发送ajax请求
			$.ajax({
				url:"${APP_PATH}/userController/updateUser/"+$(this).attr("update-id"),
				type:"POST",
				data:$("#userUpdateModal form").serialize(),
				success:function(result){
					window.location.href=searchUrl;
				}				
			});
		});
	
	
		//校验input框状态的检查
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
	
	//报名按钮绑定事件弹出窗口
	$(document).on("click",".enroll_modal_btn",function(){
            $("#user_enroll_btn").attr("enroll-id",searchText);
            enroll_table_build(searchText);
			$("#enrollModal").modal({
				backdrop : "static"
			});
		});
	
	//报名窗口的建立
	function enroll_table_build(id){
		$.ajax({
			url:"${APP_PATH}/userController/IDfindUser/"+id,
			type:"GET",
			success:function(result){
				 var userData = result.extend.user;
				    $("#userId_enroll_static").text(userData.id);
				    $("#accountNumber_enroll_static").text(userData.accountNumber);				    
				    $("#schoolName_enroll_static").text(userData.studentName);
				    $("#studentName_enroll_static ").text(userData.studentId);
				    $("#studentId_enroll_static  ").text(userData.schoolName);
				    $("#grade_enroll_static  ").text(userData.grade);
				    $("#telephoneNumber_enroll_static ").text(userData.telephoneNumber);
				    $("#email_enroll_input ").val(userData.email);
				    $("#adress_enroll_input ").val(userData.adress);
			   		$("#intro_text").val(userData.self_introduction);			 
			}				
		});
	}
	
	//报名窗口确认按钮绑定事件
	$("#user_enroll_btn").click(function(){
        var user_introduction= $("#intro_text").val();
        var user_address = $("#adress_enroll_input").val();
        var user_email = $("#email_enroll_input").val();
		var regemail = /^[a-zA-Z\d]+([-_\.][a-zA-Z\d]+)*@[a-zA-Z\d]+\.[a-zA-Z\d]{2,4}$/;
        var regAddress=/^\s*$/g;
        var regIntroduction=/^\s*$/g;
      //校验邮箱
		if(!regemail.test(user_email)){
			show_validate_msg("#email_enroll_input", "error","请输入正确的邮箱");
			return false;
		}else{
			show_validate_msg("#email_enroll_input", "success", "");
		};
		//地址校验
		if(regAddress.test(user_address)){
			show_validate_msg("#adress_enroll_input", "error","地址不能为空");
			return false;
		}else{
			show_validate_msg("#adress_enroll_input", "success", "");
		};
        //校验自我介绍
        if(regIntroduction.test(user_introduction)){
        	alert("介绍一下自己吧！！！");
		    return false;
	    }
	    	$.ajax({
	    		url:"${APP_PATH}/userController/enroll/"+$("#user_enroll_btn").attr("enroll-id"),
	    		type:"POST",
	    		data:$("#enrollModal form").serialize(),
	    		success:function(result){
	    			window.location.href=searchUrl;
	    		}				
	    	});
	    });
	
	//点击报名笔试时间按钮弹出模态框
	$(document).on("click",".enter-btn",function(){
            //给更新按钮加Id方便保存时获取
			$("#TimeModal").modal({
				backdrop : "static"
			});
			$.ajax({
				url:"${APP_PATH}/timeController/queryAllTime",
				type:"POST",
				data:"typeId="+"1",
				success:function(result){
					build_time_table(result);
				}
			});
		});
	
	
	//构建时间表
			function build_time_table(result){
			$("#time_table tbody").empty();
			var times = result.extend.times;
			$.each(times, function(index, item) {
	    		var overtime=item.over_time;
	    		var   over=new Date(Date.parse(overtime .replace(/-/g,"/")));
	            var   curDate=new Date();
				if(over>=curDate){
					var timeIdTd = $("<td></td>").append(item.id);
					var timeANTd = $("<td></td>").append(item.all_number);
					var timeBTTd = $("<td></td>").append(item.begin_time);
					var timeOTTd = $("<td></td>").append(item.over_time);
					var timeNNTd = $("<td></td>").append(item.now_number);
					var enterTd =null;
					if(item.all_number!=item.now_number){
						var enterTd =$("<button></button>")
						.addClass("btn btn-warning  exam-btn")
						.append("报名");
						enterTd.attr("exam-id",item.id);
						enterTd.attr("exam-type",item.type);
					}
					$("<tr></tr>")
					.append(timeIdTd)
					.append(timeBTTd)
					.append(timeOTTd)
					.append(timeANTd)
					.append(timeNNTd)
					.append(enterTd)
					.appendTo("#time_table tbody");
				}
			});
		}
	
	//报名选择时间段时发送请求
	$(document).on("click",".exam-btn",function(){
            //给更新按钮加Id方便保存时获取
			TimeName = $(this).parents("tr").find("td:eq(2)").text()+"-"+ $(this).parents("tr").find("td:eq(3)").text();	
			if(confirm("确认报名"+TimeName+"这个时间段吗？")){
			$.ajax({
				url:"${APP_PATH}/userController/enterExam",
				data:"userId="+ searchText+"&"+
				     "timeId="+ $(this).attr("exam-id")+"&"+
				     "examType="+$(this).attr("exam-type"),
				type:"POST",
			});
			//如果已经报名了笔试或者面试，把时间段人数-1
			$.ajax({
				url:"${APP_PATH}/timeController/enterExam/"+ $(this).attr("exam-id"),
				type:"POST",
				success:function(result){
		    		window.location.href=searchUrl;
				}
			});
			}
		});
	
	//开始笔试按钮
	$(document).on("click",".exam-begin-btn",function(){
		var examurl = "exam.jsp?id="+$(this).attr("inter-id");
		window.location.href= examurl;
	});
	
	//点击报名面试时间按钮弹出模态框
	$(document).on("click",".enterInterview-btn",function(){
            //给更新按钮加Id方便保存时获取，打开模态框
			$("#TimeModal").modal({
				backdrop : "static"
			});
            //发送ajax请求，并且构建表格
			$.ajax({
				url:"${APP_PATH}/timeController/queryAllTime",
				type:"POST",
				data:"typeId="+"2",
				success:function(result){
					build_time_table(result);
				}
			});
		});
	
	//修改头像按钮绑定事件
	$("#update_picture_btn").click(function(){
		var formData = new FormData();
		formData.append("pictureFile", $("#pictureFile")[0].files[0]);
		if($("#pictureFile").val()!=""){
			if(confirm("确定修改头像吗？")){
				//1.把新的头像存到本地，然后获取路径
				$.ajax({
					url : "${APP_PATH}/userController/ChangePicture",
					type : "POST",
					data : formData,
		            processData: false,
		            contentType: false,
					success : function(result) {
						//2.更改用户头像的头像路径
						$.ajax({
							url:"${APP_PATH}/userController/updatePicture/"+searchText,
							type:"POST",
							data:"picturePath="+result.extend.picturePath,
							success:function(result){
					    		window.location.href=searchUrl;
							}
						});
					}
				});
			}
		}
	});
	
	
</script>
</html>