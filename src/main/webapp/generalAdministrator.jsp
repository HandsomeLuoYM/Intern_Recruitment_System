<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>普通管理员页面</title>
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

<!-- 点击查看弹出的模态框 -->
	<div class="modal fade" id="userCheckModal" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">查看信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group">
							<label class="col-sm-2 control-label">id</label>
							<div class="col-sm-10">
								<p class="form-control-static" id="userId_check_static"></p>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">账号</label>
							<div class="col-sm-10">
								<p class="form-control-static" id="accountNumber_check_static"></p>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">学校</label>
							<div class="col-sm-10">
								<p class="form-control-static" id="schoolName_check_static"></p>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">姓名</label>
							<div class="col-sm-10">
								<p class="form-control-static" id="studentName_check_static"></p>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">学号</label>
							<div class="col-sm-10">
								<p class="form-control-static" id="studentId_check_static"></p>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">年级</label>
							<div class="col-sm-10">
								<p class="form-control-static" id="grade_check_static"></p>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">账号</label>
							<div class="col-sm-10">
								<p class="form-control-static" id="studentName_check_static"></p>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">电话</label>
							<div class="col-sm-10">
								<p class="form-control-static" id="telephoneNumber_check_static"></p>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">邮箱</label>
							<div class="col-sm-10">
								<p class="form-control-static" id="email_check_static"></p>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">地址</label>
							<div class="col-sm-10">
								<p class="form-control-static" id="adress_check_static"></p>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">自我介绍</label><span
								class="help-block"></span>
							<div class="col-sm-10">
								<p class="form-control-static" id="introduction_checke_static" rows="5" cols="50"></p>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">笔试/面试时间</label>
							<div class="col-sm-10">
								<p class="form-control-static" id="usertime_check_static"></p>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
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


<!-- 主体界面 -->
<div class="container">
		<!-- 标题 -->
		<div class="row">
			<div class="col-md-12">
				<h1>管理员页面</h1>
			</div>
		</div>
		<!-- 表格数据 -->
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
		
		//页面打开后加载表格数据
		$(function() {
			to_page(1);
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
		
		//跳转页面
		function to_page(pn) {
			$.ajax({
				url : "${APP_PATH}/adminController/PageUser",
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

		//构建表格主体
		function build_person_table(result) {
			//要先清空表格数据，防止界面紊乱
			$("#user_table tbody").empty();
			var users = result.extend.pageInfo.list;
			$.ajax({
				url:"${APP_PATH}/adminController/Idfind/"+searchText,
				type:"POST",
				success:function(result){
					var Indentity = result.extend.user.isAdmin;
					$.each(users, function(index, item) {
						var userIdTd = $("<td></td>").append(item.id);
						var userAuTd = $("<td></td>").append(item.accountNumber);
						var userSnTd = $("<td></td>").append(item.schoolName);
						var userStunTd = $("<td></td>").append(item.studentName);
						var userGdTd = $("<td></td>").append(item.grade);
						var userTpTd = $("<td></td>").append(item.telephoneNumber);
						var userElTd = $("<td></td>").append(item.email);
						var userAdTd = $("<td></td>").append(item.adress);
						
						var userSt = item.status;
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
							var userStTd = $("<td></td>").append("");
						}
						if(Indentity==5){
						   var delBtn = $("<button></button>")
							.addClass("btn btn-danger btn-sm delete_btn")
							.append($("<span></span>")
							.addClass("glyphicon glyphicon-trash"))
							.append("删除");
							delBtn.attr("del-id",item.id);
							delBtn.attr("del-time-id",item.timeId);	
							var btnTd = $("<td></td>").append(delBtn);
						}else if(Indentity==6){
							var editBtn = $("<button></button>")
							.addClass("btn btn-primary btn-sm edit_btn")
							.append($("<span></span>")
							.addClass("glyphicon glyphicon-pencil"))
							.append("编辑");
							editBtn.attr("edit-id",item.id);
							var btnTd = $("<td></td>").append(editBtn);
						}else if(Indentity==7){
							var editBtn = $("<button></button>")
							.addClass("btn btn-warning btn-sm check_btn")
							.append($("<span></span>")
							.addClass("glyphicon glyphicon-zoom-in"))
							.append("查看");
							editBtn.attr("check-id",item.id);
							var btnTd = $("<td></td>").append(editBtn);
						}
						$("<tr></tr>")
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
				}
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
		
		//查找角色信息,完善修改查看表
		function getPerson(id){
			$.ajax({
				url:"${APP_PATH}/adminController/Idfind/"+id,
				type:"POST",
				success:function(result){
				    var userData = result.extend.user;
				    $("#userId_update_static").text(userData.id);
				    $("#useraccount_update_static").text(userData.accountNumber);				    
				    $("#userName_update_input").val(userData.studentName);
				    $("#userstuId_update_input ").val(userData.studentId);
				    $("#userschool_update_input  ").val(userData.schoolName);
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
		
		//编辑按钮绑定事件弹出模态框
		$(document).on("click",".edit_btn",function(){
            getPerson($(this).attr("edit-id"));
            //给更新按钮加Id方便保存时获取
            $("#user_update_btn").attr("edit-id",$(this).attr("edit-id"));
			$("#userUpdateModal").modal({
				backdrop : "static"
			});
		});
			
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
				url:"${APP_PATH}/adminController/updateUser/"+$(this).attr("edit-id"),
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
		
		
		//删除按钮绑定事件弹出模态框
		$(document).on("click",".delete_btn",function(){
			var userName = $(this).parents("tr").find("td:eq(3)").text();
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
								alert("删除成功！");
								to_page(1);
							}
						});
					}					
				});
			}
		});
		
		//查看按钮绑定事件弹出模态框
		$(document).on("click",".check_btn",function(){
            showPerson($(this).attr("check-id"));
			$("#userCheckModal").modal({
				backdrop : "static"
			});
		});
		
		//构建查看表
		function showPerson(id){
			$.ajax({
				url:"${APP_PATH}/adminController/Idfind/"+id,
				type:"POST",
				success:function(result){
				    var userData = result.extend.user;
				    $("#userId_check_static").text(userData.id);
				    $("#accountNumber_check_static").text(userData.accountNumber);				    
				    $("#schoolName_check_static").text(userData.studentName);
				    $("#studentName_check_static ").text(userData.studentId);
				    $("#studentId_check_static  ").text(userData.schoolName);
				    $("#grade_check_static  ").text(userData.grade);
				    $("#telephoneNumber_check_static ").text(userData.telephoneNumber);
				    $("#email_check_static ").text(userData.email);
				    $("#adress_check_static ").text(userData.adress);
				    $("#introduction_checke_static").text(userData.self_introduction);
					$("#usertime_check_static").text("");
				    if(userData.timeId!=0){
				    $.ajax({
				    	url:"${APP_PATH}/timeController/timeUser/"+userData.timeId,
				    	type:"POST",
				    	success:function(result){
				    		var begin_over_time = result.extend.time.begin_time+"——"+result.extend.time.over_time;
 						    $("#usertime_check_static").text(begin_over_time);
				    	}
				     });
				   }
				}				
			});
		}
		
		
	</script>
</body>
</html>