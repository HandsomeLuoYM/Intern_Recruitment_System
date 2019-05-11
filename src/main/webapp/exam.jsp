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
<title>笔试页面</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
	<style>
		h1 {
			margin-bottom:20px;
		}
		tr {
			border-bottom: 1px solid #ddd;
		}
		.form-control {
			height:28px;
			margin-top:4.4px;
		}
		h3 {
			margin-bottom:20px;
		}
		#moving-line {
			width:50%;
			height:1.5px;
			background-color:#999;
			animation:moveline 7s infinite;
			margin:0 auto;
		}
		@keyframes moveline {
			0%,10% {
				width:0%;
			}
			25%, 75% {
				width:90%;
			}
			90%,100% {
				width:0%;
			}
		}
		
		
	</style>
</head>
<body>

	 <!-- 提交答案后弹出的模态框 -->
	<div class="modal fade" id="Score_modal" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document" style="position:absolute;top:0;bottom:0;left:0;right:0;">
			<div class="modal-content" style="position:absolute;top:50%;left:50%;transform:translate(-50%,-50%);width:100%;">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group">
							<label class="col-sm-4 control-label">你的选择题成绩是：</label>
							<div class="col-sm-4">
								<p class="form-control-static" id="Score_static"></p>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary"
						id="examOver_btn">确认</button>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<!-- 标题 -->
		<div class="row">
			<div class="col-md-12">
				<h1 style="text-align:center;">笔试页面</h1>
				<div id="moving-line"></div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
			<h3>选择题(多选题)</h3>
				<table class="table table-hover" id="answer_table">
					<thead>
						<tr>
							<th>#</th>
							<th>题目</th>
							<th style="width:15%;">A选项</th>
							<th style="width:15%;">B选项</th>
							<th style="width:15%;">C选项</th>
							<th style="width:15%;">D选项</th>
						</tr>
					</thead>
					<tbody>

					</tbody>
				</table>
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-12">
			<h3>填空题</h3>
				<table class="table table-hover" id="completion_table">
					<thead>
						<tr>
							<th>#</th>
							<th>题目</th>
							<th>分值</th>
							<th style="width:130px; text-align:center;">你的答案</th>
						</tr>
					</thead>
					<tbody>

					</tbody>
				</table>
				<!-- 按钮 -->
				<div class="row">
					<div class="col-md-4 col-md-offset-8">
						<button class="btn btn-success" id="anwer_save_btn">确认答案</button>
					</div>
				</div>
			</div>
		</div>
		
	</div>
</body>
<script type="text/javascript">

var searchUrl = window.location.href;
var searchData = searchUrl.split("=");
var searchText = decodeURI(searchData[1]);

$(function(){
    build_proposition_table();
    build_completion_table();
});


//将选择题选项打乱
function randomsort(a, b) {
    return Math.random()>.5 ? -1 : 1;
//用Math.random()函数生成0~1之间的随机数与0.5比较，返回-1或1
}

//构建选择题主体
function build_proposition_table(){
	$.ajax({
		url:"${APP_PATH}/examController/queryAllExam",
		type:"GET",
		success:function(result){
			var exams = result.extend.AllExam;
			$.each(exams,function(index,item){
				var arr = [item.aoption,item.boption,item.coption,item.doption];
				var arr2 = arr.sort(randomsort);
				var AcheckBox = $("<input type='checkbox' class='check_item'/>");
				AcheckBox.attr("check-value",arr2[0]);
				var BcheckBox = $("<input type='checkbox' class='check_item'/>");
				BcheckBox.attr("check-value",arr2[1]);
				var CcheckBox = $("<input type='checkbox' class='check_item'/>");
				CcheckBox.attr("check-value",arr2[2]);
				var DcheckBox = $("<input type='checkbox' class='check_item'/>");
				DcheckBox.attr("check-value",arr2[3]);
				var idTd = $("<td></td>").append(item.id);
				var StemTd = $("<td></td>").append(item.stem);
				var ATd = $("<td></td>").append(AcheckBox).append(arr2[0]);
				var BTd = $("<td></td>").append(BcheckBox).append(arr2[1]);
				var CTd = $("<td></td>").append(CcheckBox).append(arr2[2]);
				var DTd = $("<td></td>").append(DcheckBox).append(arr2[3]);
			
				$("<tr></tr>")
				.append(idTd)
				.append(StemTd)
				.append(ATd)
				.append(BTd)
				.append(CTd)
				.append(DTd)    				
// 				.append(OptionTd)
				.appendTo("#answer_table tbody");
			});
		}
	});
};

//构建填空题的表格completion_table
function build_completion_table(){
	$.ajax({
		url:"${APP_PATH}/completionController/qurryAll",
		type:"POST",
		success:function(result){
			var completions = result.extend.completionInfo;
			$.each(completions,function(index,item){
				var idTd = $("<td></td>").append(item.id);
				var problemTd = $("<td></td>").append(item.content);
				var scoreTd = $("<td></td>").append(item.score);
				var answerTd = $("<input type='text'id='answer'/>").addClass("form-control");
				$("<tr></tr>")
				.append(idTd)
				.append(problemTd)
				.append(scoreTd)
				.append(answerTd)
				.appendTo("#completion_table tbody");
			});
		}
	});
}


//提交答案按钮绑定事件
$("#anwer_save_btn").click(function(){
	
	//提交填空题的答案
	$("#completion_table tbody tr").each(function(){
		var Content = $(this).find("#answer").val();
		var Problem = $(this).find("td:eq(1)").text();
		var UserId = searchText;
		var Score = $(this).find("td:eq(2)").text();
		$.ajax({
			url:"${APP_PATH}/answerController/insertAnswer",
			type:"POST",
			data:"Content="+Content+"&"+
				 "Problem="+Problem+"&"+
				 "UserId="+UserId+"&"+
				 "Score="+Score,
				 success:function(result){
				 }
			
		});
	});

	
	var ids_values="";
	if(confirm("确定提交答案？")){
		$("#answer_table tbody tr").each(function(){
			var check_values="";
			$.each($(this).find(".check_item:checked"),function(){
				check_values += $(this).attr("check-value")+"-";
			});
			check_values=check_values.substring(0,check_values.length-1);
			ids_values+=","+ $(this).find("td:eq(0)").text()+"="+check_values;
			});
		};
		ids_values=ids_values.substring(1,ids_values.length);
		console.log(ids_values);
		//校验选择题分数
		$.ajax({
			url:"${APP_PATH}/examController/checkExam",
			type:"POST",
			data:"ids_values="+ids_values,
			success:function(result){
				//1.给用户设置分数
			    $.ajax({
			    url:"${APP_PATH}/userController/overExam",
			    type:"POST",
			    data:"userId="+ searchText +"&"+
			     	 "score="+ result.extend.score,
				});
				//2.得到信息
				$("#Score_modal").modal({
				backdrop : "static"
				});
			    $("#Score_static").text(result.extend.score);				
			}				
		});		
		
	});
		
	//分数框确认后跳回用户界面
	$("#examOver_btn").click(function(){
		url = "showperson.jsp?id="+searchText;//此处拼接内容
		window.location.href=url;
	});
	
	
</script>
</html>