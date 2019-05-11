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
<title>命题人界面</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
	<style>
		tr {
			transition: all 0.05s;
		}
	</style>
</head>
<body>

<!-- ===============================================点击添加题目弹出的模态框 ============================================ -->
	<div class="modal fade" id="ExamAddModal" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">添加选择题</h4>
				</div>				
				<div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group">
							<label class="col-sm-2 control-label">題目</label>
							<div class="col-sm-10">
								<input type="text" name="Stem" class="form-control"
									id="problem_add_input" placeholder="如：1+1"> <span
									class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">A选项</label>
							<div class="col-sm-10">
								<input type="text" name="AOption" class="form-control"
									id="Aoption_add_input" placeholder="选项"> <span
									class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">B选项</label>
							<div class="col-sm-10">
								<input type="text" name="BOption" class="form-control"
									id="Boption_add_input" placeholder="选项"> <span
									class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">C选项</label>
							<div class="col-sm-10">
								<input type="text" name="COption" class="form-control"
									id="Coption_add_input" placeholder="选项"> <span
									class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">D选项</label>
							<div class="col-sm-10">
								<input type="text" name="DOption" class="form-control"
									id="Doption_add_input" placeholder="选项"> <span
									class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">正确答案</label>
							<div class="col-sm-10">
								<input type="text" name="RightOption" class="form-control"
									id="Roption_add_input" placeholder="正确答案（不是选项）多个答案用中文逗号隔开"> <span
									class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">分值</label>
							<div class="col-sm-10">
								<input type="text" name="Score" class="form-control"
									id="Score_add_input" placeholder="分值"> <span
									class="help-block"></span>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="stem_add_btn">添加</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">退出</button>
				</div>
			</div>
		</div>
	</div>


	<!--============================================== 增加填空题的模态框 ============================== -->
	<div class="modal fade" id="CompletionAddModal" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">添加填空题</h4>
				</div>				
				<div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group">
							<label class="col-sm-2 control-label">題目</label>
							<div class="col-sm-10">
								<input type="text" name="Content" class="form-control"
									id="completion_add_input" placeholder="如：1+1"> <span
									class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">正确答案</label>
							<div class="col-sm-10">
								<input type="text" name="Answer" class="form-control"
									id="completionanswer_add_input" placeholder="正确答案"> <span
									class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">分值</label>
							<div class="col-sm-10">
								<input type="text" name="Score" class="form-control"
									id="completionScore_add_input" placeholder="分值"> <span
									class="help-block"></span>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="completion_add_btn">添加</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">退出</button>
				</div>
			</div>
		</div>
	</div>

	<!-- ================================================题目表格字体数据 ===============================================-->
	
	
<div class="container">
		<!-- 标题 -->
		<div class="row">
			<div class="col-md-12">
				<h1 style="text-align: center;">命题人页面</h1>
			</div>
		</div >		
		<!-- 按钮 -->
		<div class="row" style="position:relative;">
		<!-- margin-left: 70.5%; -->
			<div class="col-md-4 col-md-offset-8" style="margin-left:0; margin-top: 10px;margin-bottom: 10px;width:100%; ">
				<button class="btn btn-success" id="add_modal_btn" style="float:right; margin-right:10px;" >添加选择题题目</button>
				<button class="btn btn-success" id="marking_test_btn" style="float:left;">试卷批改</button>
<!-- 				<button class="btn btn-danger" id="enroll_modal_btn">报名</button> -->
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover" id="proposition_table">
					<thead>
						<tr>
							<th>#</th>
							<th>题目</th>
							<th>A选项</th>
							<th>B选项</th>
							<th>C选项</th>
							<th>D选项</th>
							<th>正确答案</th>
							<th>分值</th>
						</tr>
					</thead>
					<tbody>

					</tbody>
				</table>
			</div>
		</div>
		<div class="row" style="position:relative;">
			<div class="col-md-4 col-md-offset-8" style="margin-left:0; margin-top: 10px;margin-bottom: 10px;width:100%; ">
							<button class="btn btn-success" id="add_completion_btn" style="float:right;">添加填空题题目</button>
<!-- 				<button class="btn btn-danger" id="enroll_modal_btn">报名</button> -->
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover" id="completion_table">
					<thead>
						<tr style="width:100%;" >
							<th>#</th>
							<th style="width:37.5%;">填空题</th>
							<th style="width:48.5%;">正确答案</th>
							<th>分值</th>
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
	
	$(function(){
	    build_proposition_table();
	    build_completion_table();
	});


	
	
	//构建选择题主体
	function build_proposition_table(){
    	$.ajax({
			url:"${APP_PATH}/examController/queryAllExam",
    		type:"GET",
    		success:function(result){
    			var exams = result.extend.AllExam;
    			$.each(exams,function(index,item){
    				var idTd = $("<td></td>").append(item.id);
    				var StemTd = $("<td></td>").append(item.stem);
    				var ATd = $("<td></td>").append(item.aoption);
    				var BTd = $("<td></td>").append(item.boption);
    				var CTd = $("<td></td>").append(item.coption);
    				var DTd = $("<td></td>").append(item.doption);
    				var RTd = $("<td></td>").append(item.rightOption);
    				var STd = $("<td></td>").append(item.score);
    				var delTd =$("<button></button>")
					.addClass("btn btn-danger delete_btn")
					.append("删除");
    				delTd.attr("delete-id",item.id);
    				$("<tr></tr>")
    				.append(idTd)
    				.append(StemTd)
    				.append(ATd)
    				.append(BTd)
    				.append(CTd)
    				.append(DTd)    				
    				.append(RTd)
    				.append(STd)    				
    				.append(delTd)
    				.appendTo("#proposition_table tbody");
    			});
    		}
    	});
    };
    
    
    //构建填空题的主体
	function build_completion_table(){   	
		$.ajax({
			url:"${APP_PATH}/completionController/qurryAll",
    		type:"POST",
    		success:function(result){
    			var completion = result.extend.completionInfo;
    			$.each(completion,function(index,item){
    				var idTd = $("<td></td>").append(item.id);
    				var ContentTd = $("<td></td>").append(item.content);
    				var AnswerTd = $("<td></td>").append(item.answer);
    				var ScoreTd = $("<td></td>").append(item.score);
    				var delTd =$("<button></button>")
					.addClass("btn btn-danger deletecompletion_btn")
					.append("删除");
    				delTd.attr("completion-id",item.id);
    				$("<tr></tr>")
    				.append(idTd)
    				.append(ContentTd)
    				.append(AnswerTd)
    				.append(ScoreTd)    				
    				.append(delTd)
    				.appendTo("#completion_table tbody");
    			});
    		}
    	});
    }

    //为新增绑定事件
	$("#add_modal_btn").click(function(){
		$("#ExamAddModal").modal({
			backdrop : "static"
		});
	});
	
    //为添加填空题按钮绑定事件
    $("#add_completion_btn").click(function(){
    	$("#CompletionAddModal").modal({
			backdrop : "static"
		});
    });
    
    
    //新增选择题列表的保存按钮
    $("#stem_add_btn").click(function(){
		if(!validate_addform()){
			return false ;
		}
    	$.ajax({
    		url:"${APP_PATH}/examController/insertStem",
    		type:"POST",
    		data:$("#ExamAddModal form").serialize(),
    		success:function(result){
    			alert("添加成功！");
    			window.location.href=searchUrl;
    		}				
    	});
    });
    
    //新增列表的保存按钮
    $("#completion_add_btn").click(function(){
		if(!validatecompletion_addform()){
			return false ;
		}
    	$.ajax({
    		url:"${APP_PATH}/completionController/insertCompletion",
    		type:"POST",
    		data:$("#CompletionAddModal form").serialize(),
    		success:function(result){
    			alert("添加成功！");
    			window.location.href=searchUrl;
    		}				
    	});
    });
    
    //选择题的删除按钮操作
    $(document).on("click",".delete_btn",function(){
    	var stem = $(this).parents("tr").find("td:eq(1)").text();
    	if(confirm("确认删除【"+stem+"】这道题吗?")){
    		$.ajax({
    			url:"${APP_PATH}/examController/deleteStem/"+$(this).attr("delete-id"),
    			type:"POST",
    			success:function(result){
    				window.location.href=searchUrl;
    			}
    		});
    	}
    });
    
    //填空题的删除按钮操作
     $(document).on("click",".deletecompletion_btn",function(){
    	var stem = $(this).parents("tr").find("td:eq(1)").text();
    	if(confirm("确认删除【"+stem+"】这道题吗?")){
    		$.ajax({
    			url:"${APP_PATH}/completionController/delete/"+$(this).attr("completion-id"),
    			type:"POST",
    			success:function(result){
    				window.location.href=searchUrl;
    			}
    		});
    	}
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
       
    //校验选择题的模态框
    function validate_addform(){
        var problem= $("#problem_add_input").val();
        var Aoption= $("#Aoption_add_input").val();
        var Boption= $("#Boption_add_input").val();
        var Coption= $("#Coption_add_input").val();
        var Doption= $("#Doption_add_input").val();
        var Roption= $("#Roption_add_input").val();
        var Score= $("#Score_add_input").val();
        var reg=/^\s*$/g;
        var regScore=/^[0-9]{1,2}$/;
        	//题干校验
			if(reg.test(problem)){
				show_validate_msg("#problem_add_input", "error","题目不为空");
				return false;
			}else{
				show_validate_msg("#problem_add_input", "success", "");
			}
			//A选项校验
			if(reg.test(Aoption)){
                show_validate_msg("#Aoption_add_input","error","选项不能为空");				
				return false;
			}else{
                show_validate_msg("#Aoption_add_input","success","");						
			}
			//B选项校验
			if(reg.test(Boption)){
				show_validate_msg("#Boption_add_input", "error","选项不能为空");
				return false;
			}else{
				show_validate_msg("#Boption_add_input", "success", "");
			}
			//C选项校验
			if(reg.test(Coption)){
				show_validate_msg("#Coption_add_input", "error","选项不能为空数");
				return false;
			}else{
				show_validate_msg("#Coption_add_input", "success", "");
			}
			//D选项校验
			if(reg.test(Doption)){
				show_validate_msg("#Doption_add_input", "error","选项不能为空");
				return false;
			}else{
				show_validate_msg("#Doption_add_input", "success", "");
			}
			//答案校验
			if(reg.test(Roption)){
				show_validate_msg("#Roption_add_input", "error","答案不能为空");
				return false;
			}else{
				show_validate_msg("#Roption_add_input", "success", "");
			}
			//分值校验
			if(!regScore.test(Score)){
				show_validate_msg("#Score_add_input", "error","分数为数字");
				return false;
			}else{
				show_validate_msg("#Score_add_input", "success", "");
			}
			return true;
        }
    
    	//填空题的校验
	    function validatecompletion_addform(){
	    	var Content= $("#completion_add_input").val();
	        var Answer= $("#completionanswer_add_input").val();
	        var Score= $("#completionScore_add_input").val();
	        var reg=/^\s*$/g;
	        var regScore=/^[0-9]{1,2}$/;
	      //题干校验
			if(reg.test(Content)){
				show_validate_msg("#completion_add_input", "error","题目不为空");
				return false;
			}else{
				show_validate_msg("#completion_add_input", "success", "");
			}
	      //答案校验
			if(reg.test(Answer)){
				show_validate_msg("#completionanswer_add_input", "error","答案不为空");
				return false;
			}else{
				show_validate_msg("#completionanswer_add_input", "success", "");
			}
	      //分数值校验
			if(!regScore.test(Score)){
				show_validate_msg("#completionScore_add_input", "error","分数为数字");
				return false;
			}else{
				show_validate_msg("#completionScore_add_input", "success", "");
			}
			return true;	      
	    }

    	//批改试卷绑定事件
    	$("#marking_test_btn").click(function(){
    		url="markingTest.jsp";
    		window.location.href=url;
    	});
    
</script>
</html>