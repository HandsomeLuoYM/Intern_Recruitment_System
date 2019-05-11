<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>面试官页面</title>
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
							<th>分数</th>
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

		$(function() {
			to_page(1);
		});

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

		//跳转页面
		function to_page(pn) {
			$.ajax({
				url : "${APP_PATH}/adminController/PageInterview",
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
				url : "${APP_PATH}/adminController/Idfind/" + searchText,
				type : "POST",
				success : function(result) {
					var Indentity = result.extend.user.isAdmin;
					$.each(users,
							function(index, item) {
								var userIdTd = $("<td></td>").append(item.id);
								var userAuTd = $("<td></td>").append(
										item.accountNumber);
								var userSnTd = $("<td></td>").append(
										item.schoolName);
								var userStunTd = $("<td></td>").append(
										item.studentName);
								var userGdTd = $("<td></td>")
										.append(item.grade);
								var userTpTd = $("<td></td>").append(
										item.telephoneNumber);
								var userElTd = $("<td></td>")
										.append(item.email);
								var userAdTd = $("<td></td>").append(
										item.adress);
								var scoreTd = $(
										"<input type='text'id='score'/>")
										.addClass("form-control");
								var saveBtn = $("<button></button>").addClass(
										"btn btn-info btn-sm save_btn").append(
										$("<span></span>").addClass(
												"glyphicon glyphicon-ok"))
										.append("确定");
								saveBtn.attr("save-id", item.id);
								var btnTd = $("<td></td>").append(saveBtn);
								$("<tr></tr>").append(userIdTd)
										.append(userAuTd).append(userSnTd)
										.append(userStunTd).append(userGdTd)
										.append(userTpTd).append(userElTd)
										.append(userAdTd).append(scoreTd)
										.append(btnTd).appendTo(
												"#user_table tbody");
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

		//确定按钮绑定事件
		$(document).on(
				"click",
				".save_btn",
				function() {
					var userId = $(this).attr("save-id");
					var InterviewScore = $(this).parents("tr").find("#score")
							.val();
					if (InterviewScore > 100) {
						alert("分数输入错误！（0-100）");
						return false;
					}
						if (confirm("确定该用户的面试分数为"+InterviewScore+"？")) {
							$.ajax({
								url : "${APP_PATH}/adminController/RegisterScore",
								type : "POST",
								data : "userId=" + userId + "&" + "InterviewScore="
										+ InterviewScore,
								success : function(result) {
									to_page(1);
								}
							});
						}
				});
	</script>

</body>
</html>