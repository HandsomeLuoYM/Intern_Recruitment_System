<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录界面</title>
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
	<div id="login_interface">
		<form class="form-horizontal" align="center" >
			<div class="form-group"
				style="display: flex; align-items: center; justify-content: center; margin-top: 50px;">
				<label for="inputEmail3" class="col-sm-2 control-label"
					style="width: 80px;">账号</label>
				<div style="width: 250px;">
					<input type="text" class="form-control" id="AccountNumber"
						placeholder="账号" style="width: auto; margin-right: 0px;">
					<span class="help-block"></span>
				</div>
			</div>
			<div class="form-group"
				style="display: flex; align-items: center; justify-content: center;">
				<label for="inputPassword3" class="col-sm-2 control-label"
					style="width: 80px;">密码</label>
				<div style="width: 250px;">
					<input type="password" class="form-control" id="PassWord"
						placeholder="密码" style="width: auto;"><span class="help-block"></span>
				</div>
			</div>
		</form>		
		<div class="form-group"
			style="display: flex; align-items: center; justify-content: center;">
			<div align="center">
				<button type="submit" class="btn btn-default" id="login_btn">登录</button>
				<button type="submit" class="btn btn-default">
					<a href="http://localhost:8080/maven-ssm-web/registe.jsp">注册</a>
				</button>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	

	$("#login_btn").click(function(){
	//发送ajax请求提交表单数据给服务器
	if(!validate_form()){
		return false;
	};
	$.ajax({
		url:"${APP_PATH}/userController/login",
		type:"POST",
		data:"AccountNumber="+ $("#AccountNumber").val()+"&"+
			 "password="+ $("#PassWord").val(),
	    success:function(result){
	    	if(result.extend.type=="error"){
	 		    $("#AccountNumber").val(result.extend.AccountNumber);
	 		    $("#PassWord").val(result.extend.PassWord);
	 			show_validate_msg("#PassWord", "error","密码错误");
	    	}else {
	    		if(result.extend.user.isAdmin==1){
	    			url="index.jsp?id="+result.extend.user.id;
		    		window.location.href=url;
	    		}else if(result.extend.user.isAdmin==2){
	    			url = "showperson.jsp?id="+result.extend.user.id;//此处拼接内容
		    		window.location.href=url;
	    		}else if(result.extend.user.isAdmin==3){
	    			url = "proposition.jsp?id="+result.extend.user.id;//此处拼接内容
	    			window.location.href=url;
	    		}else if(result.extend.user.isAdmin==4){
	    			url = "Interviewer.jsp?id="+result.extend.user.id;//此处拼接内容
	    			window.location.href=url;
	    		}else{
	    			url = "generalAdministrator.jsp?id="+result.extend.user.id;//此处拼接内容
	    			window.location.href=url;
	    		}
	    	}
	    }
	});
});

//检验账号是否是6位数字
function validate_form() {
	var account = $("#AccountNumber").val();
	var PassWord = $("#PassWord").val();
	var regaccount = /^[0-9]{6}$/;
	if(!regaccount.test(account)){
		show_validate_msg("#AccountNumber", "error","账号为6位数");
	}else{
		show_validate_msg("#AccountNumber", "success", "");		
	}
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
</script>
</body>
</html>