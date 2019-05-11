<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>分页列表</title>
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

	<!-- 点击新增弹出的模态框 -->
	<div class="modal fade" id="personAddModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">角色添加</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group">
							<label class="col-sm-2 control-label">姓名</label>
							<div class="col-sm-10">
								<input type="text"  name="name" class="form-control" id="personName_add_input"
									placeholder="姓名">
								<span class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">年龄</label>
							<div class="col-sm-10">
								<input type="text" name="age" class="form-control" id="personAge_add_input"
									placeholder="年龄">
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="person_save_btn">保存</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">退出</button>					
				</div>
			</div>
		</div>
	</div>


	<!-- 点击修改弹出的模态框 -->
	<div class="modal fade" id="personUpdateModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
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
								<p class="form-control-static" id="personId_update_static"></p>
						</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">姓名</label>
							<div class="col-sm-10">
								<input type="text"  name="name" class="form-control" id="personName_update_input"
									placeholder="姓名">
								<span class="help-block"></span>							
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">年龄</label>
							<div class="col-sm-10">
								<input type="text" name="age" class="form-control" id="personAge_update_input"
									placeholder="年龄">
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="person_update_btn">保存</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">退出</button>					
				</div>
			</div>
		</div>
	</div>


	<div class="container">
		<!-- 标题 -->
		<div class="row">
			<div class="col-md-12">
				<h1>测试页面</h1>
			</div>
		</div>
		<!-- 按钮 -->
		<div class="row">
			<div class="col-md-4 col-md-offset-8">
				<button class="btn btn-primary" id="person_add_modal_btn">新增</button>
				<button class="btn btn-danger" id="person_delete_all_btn">删除</button>
			</div>
		</div>
		<!-- 表格数据 -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover" id="person_table">
					<thead>
						<tr>
							<th>
								<input type="checkbox" id="check_all"/>
							</th>
							<th>#</th>
							<th>姓名</th>
							<th>年龄</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>

					</tbody>
					<%-- 					<c:forEach items="${pageInfo.list }" var="person"> --%>
					<!-- 						<tr> -->
					<%-- 							<th>${person.id }</th> --%>
					<%-- 							<th>${person.name }</th> --%>
					<%-- 							<th>${person.age }</th> --%>
					<!-- 							<th> -->
					<!-- 								<button class="btn btn-primary"><span class="glyphicon glyphicon-pencil" aria-hidden="true">编辑</button> -->
					<!-- 								<button class="btn btn-danger"><span class="glyphicon glyphicon-trash" aria-hidden="true">删除</button> -->
					<!-- 							</th> -->
					<!-- 						</tr> -->
					<%-- 					</c:forEach> --%>
				</table>
			</div>
		</div>
		<!-- 分页信息 -->
		<div class="row">
			<!-- 分页文字信息 -->
			<div class="clo-md-6" id="page_Info_area"></div>
			<!-- 分页条 -->
			<div class="clo-md-6" id="page_nav_area">
				<!-- 				<nav aria-label="Page navigation"> -->
				<!-- 					<ul class="pagination"> -->
				<%-- 					    <c:forEach items="${pageInfo.navigatepageNums }" var="page_Num"> --%>
				<%-- 					        <c:if test="${page_Num == pageInfo.pageNum }"> --%>
				<%-- 						        <li class="active"><a href="#">${page_Num }</a></li>					        					             --%>
				<%-- 					        </c:if> --%>
				<%-- 					        <c:if test="${page_Num != pageInfo.pageNum }"> --%>
				<%-- 						        <li><a href="${APP_PATH }/personController/PagePerson?pn=${page_Num }">${page_Num }</a></li>					        					             --%>
				<%-- 					        </c:if> --%>
				<%-- 					    </c:forEach> --%>
				<!-- 					</ul> -->
				<!-- 				</nav> -->
			</div>
		</div>
	</div>


	<script type="text/javascript">
		//1.页面加载后，直接发送ajax请求，要到分页数据
		$(function() {
			to_page(1);
		});

		//
		function to_page(pn) {
			$.ajax({
				url : "${APP_PATH}/personController/PagePerson",
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
			$("#person_table tbody").empty();
			var persons = result.extend.pageInfo.list;
			$.each(persons, function(index, item) {
				// 	    		alert(item.name);
				var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>");
				var personIdTd = $("<td></td>").append(item.id);
				var personNameTd = $("<td></td>").append(item.name);
				var personAgeTd = $("<td></td>").append(item.age);
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
				var btnTd = $("<td></td>").append(editBtn).append(" ").append(
						delBtn);
				//append执行完成后返回的还是append元素 <button class="btn btn-danger"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span>删除</button> -->
				$("<tr></tr>").append(checkBoxTd).append(personIdTd).append(personNameTd).append(
						personAgeTd).append(btnTd).appendTo(
						"#person_table tbody");
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
		$("#person_add_modal_btn").click(function() {
			//先清除表单数据
			$("#personAddModal form")[0].reset();
			$("#personAddModal").modal({
				backdrop : "static"
			});
		});
		
		//校验角色名
		function validate_form(){
			var perName = $("#personName_add_input").val();
			var regName= /^[\u4e00-\u9fa5]{2,4}$/;
			if(!regName.test(perName)){
// 				alert("请输入正确的角色名(2-4位中文)");
                show_validate_msg("#personName_add_input","error","请输入正确的角色名(2-4位中文)");				
				return false;
			}else{
                show_validate_msg("#personName_add_input","success","");						
			};
			return true;
		}
		
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
		
		//新增按钮里面的保存按钮的绑定事件
		$("#person_save_btn").click(function(){
			//发送ajax请求提交表单数据给服务器
// 			alert($("#personAddModal form").serialize());
			if(!validate_form()){
				return false;
			};
			$.ajax({
				url:"${APP_PATH}/personController/insert",
				type:"POST",
				data:$("#personAddModal form").serialize(),
				success:function(result){
// 					alert(result.msg);
					//保存成功后关闭模态框
					$("#personAddModal").modal('hide');
				}
			});
		});
		
		//删除按钮绑定事件弹出模态框
		$(document).on("click",".delete_btn",function(){
			var personName = $(this).parents("tr").find("td:eq(2)").text();
			var personId = $(this).attr("del-id");
			if(confirm("确认删除【"+personName+"】吗?")){
				$.ajax({
					url:"${APP_PATH}/personController/deletePerson/"+personId,
					type:"POST",
					success:function(result){
						alert(result.msg);
						to_page(1);
					}
				});
			}
		});
		
		//编辑按钮绑定事件弹出模态框
		$(document).on("click",".edit_btn",function(){
// 			alert("YES");
            getPerson($(this).attr("edit-id"));
            //给更新按钮加Id方便保存时获取
            $("#person_update_btn").attr("edit-id",$(this).attr("edit-id"));
			$("#personUpdateModal").modal({
				backdrop : "static"
			});
		});
		
		//查找角色信息
		function getPerson(id){
			$.ajax({
				url:"${APP_PATH}/personController/IDfind/"+id,
				type:"GET",
				success:function(result){
// 					console.log(result);
				    var personData = result.extend.Id_find_person;
				    $("#personId_update_static").text(personData.id);
				    $("#personName_update_input").val(personData.name);
				    $("#personAge_update_input").val(personData.age);
				}				
			});
		}
		
		
		//更新按钮绑定事件		
		$("#person_update_btn").click(function(){
			//1、验证姓名格式
			var perName = $("#personName_update_input").val();
			var regName= /^[\u4e00-\u9fa5]{2,4}$/;
			if(!regName.test(perName)){
                show_validate_msg("#personName_update_input","error","请输入正确的角色名(2-4位中文)");				
				return false;
			}else{
                show_validate_msg("#personName_update_input","success","");						
			};
			//2、发送ajax请求
			$.ajax({
				url:"${APP_PATH}/personController/update/"+$(this).attr("edit-id"),
				type:"POST",
				data:$("#personUpdateModal form").serialize(),
				success:function(result){
// 					alert(result.msg);
				    //1关闭模态框
					$("#personUpdateModal").modal('hide');
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
		$("#person_delete_all_btn").click(function(){
			var personNames = "";
			var del_idstr = "";
			$.each($(".check_item:checked"),function(){
				personNames += $(this).parents("tr").find("td:eq(2)").text()+",";
				del_idstr += $(this).parents("tr").find("td:eq(1)").text()+"-";
			});
			personNames=personNames.substring(0,personNames.length-1);
			del_idstr=del_idstr.substring(0,del_idstr.length-1);
			if(confirm("确认删除【"+personNames+"】这些角色吗？")){
				$.ajax({
					url:"${APP_PATH}/personController/deletePerson /"+del_idstr,
					type:"POST",
					success:function(result){
						alert(result.msg);
						to_page(1);
					}
				});
			}
		});
	</script>
</body>
</html>