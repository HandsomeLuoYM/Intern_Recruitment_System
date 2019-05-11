<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>分页列表</title>
<% pageContext.setAttribute("APP_PATH", request.getContextPath()); %>
<!-- <link href="css/system.css"> -->
<!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js"></script>
</head>
<body>
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
				<button class="btn btn-primary">新增</button>
				<button class="btn btn-danger">删除</button>
			</div>
		</div>
		<!-- 表格数据 -->
		<div class="row">
			<div>
				<table class="table">
					<tr>
						<th>#id</th>
						<th>Name</th>
						<th>Age</th>
						<th>操作</th>
					</tr>
					<c:forEach items="${pageInfo.list }" var="person">
						<tr>
							<th>${person.id }</th>
							<th>${person.name }</th>
							<th>${person.age }</th>
							<th>
								<button class="btn btn-primary">编辑</button>
								<button class="btn btn-danger">删除</button>
							</th>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
		<!-- 分页信息 -->
		<div class="row">
			<!-- 分页文字信息 -->
			<div class="clo-md-6">当前${pageInfo.pageNum }页，总共${pageInfo.pages }页，总共${pageInfo.total }条记录
			</div>
			<!-- 分页条 -->
			<div class="clo-md-6">
				<nav aria-label="Page navigation">
					<ul class="pagination">
					    <c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
					        <c:if test="${page_Num == pageInfo.pageNum }">
						        <li class="active"><a href="#">${page_Num }</a></li>					        					            
					        </c:if>
					        <c:if test="${page_Num != pageInfo.pageNum }">
						        <li><a href="${APP_PATH }/personController/PagePerson?pn=${page_Num }">${page_Num }</a></li>					        					            
					        </c:if>
					    </c:forEach>
					</ul>
				</nav>
			</div>
		</div>
	</div>
</body>
</html>