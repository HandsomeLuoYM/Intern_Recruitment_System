<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
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
<meta charset="UTF-8">
<title>命题人界面(改试卷)</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
</head>
<body>

<!-- 主体界面 -->
<div class="container">
		<!-- 标题 -->
		<div class="row">
			<div class="col-md-12">
				<h1>批改试卷</h1>
			</div>
		</div>
		<!-- 表格数据 -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover" id="marking_table">
					<thead>
						<tr>
							<th>#</th>
							<th>题干</th>
							<th>用户</th>
							<th>答案</th>
							<th>分值</th>
							<th></th>
							<th></th>
						</tr>
					</thead>
					<tbody>

					</tbody>

				</table>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		
	$(function(){
		build_mark_table();
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
	
	//构建表格的主体
	function build_mark_table(){
		$.ajax({
			url:"${APP_PATH}/answerController/qurryAll",
			type:"POST",
			success:function(result){
				var answerDatas=result.extend.answerList;
				$.each(answerDatas,function(index,item){
					var idTd = $("<td></td>").append(item.id);
					var contentTd = $("<td></td>").append(item.completion);
					var answerTd = $("<td></td>").append(item.content);
					var UserIdTd = $("<td></td>").append(item.userId);
					var ScoreTd = $("<td></td>").append(item.score);
					var userScoreTd = $("<input type='text'id='UserScore'/>").addClass("form-control");
					var save_btn = $("<button></button>").addClass(
					"btn btn-info btn-sm save_btn").append(
							$("<span></span>").addClass(
									"glyphicon glyphicon-ok"))
							.append("确定");
					var BtnTd =  $("<td></td>").append(userScoreTd).append(save_btn);
					$("<tr></tr>")
					.append(idTd)
					.append(contentTd)
					.append(UserIdTd)
					.append(answerTd)
					.append(ScoreTd)
					.append(userScoreTd)
					.append(save_btn)
					.appendTo("#marking_table tbody");					
					
				});
			}
			
		});
	}
	
	//保存按钮绑定事件
	$(document).on("click",".save_btn",function(){
		//校验分数
		var userScore = $(this).parent("tr").find("#UserScore").val();
		var Score = $(this).parent("tr").find("td:eq(4)").text();
		var StemId = $(this).parent("tr").find("td:eq(0)").text();
		var userId = $(this).parent("tr").find("td:eq(2)").text();
		var regScore = /^[0-9]{1,2}$/;
		if(!regScore.test(userScore)||parseInt(Score) < parseInt(userScore)){
			alert("分数输入错误！");
			return false;
		}
		$.ajax({
			url:"${APP_PATH}/answerController/markTest", 
			type:"POST",
			data:"StemId="+StemId,
			success:function(result){
				$.ajax({
					url:"${APP_PATH}/adminController/markTest", 
					type:"POST",
					data:"userScore="+userScore+"&"+
						 "userId="+userId,
					success:function(result){
			    		url="markingTest.jsp";
						window.location.href=url;
					}
				});
			}
		});
	});
	

	
	</script>
</body>
</html>