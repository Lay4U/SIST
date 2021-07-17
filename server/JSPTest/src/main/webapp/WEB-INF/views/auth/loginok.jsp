<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<%@ include file="/inc/asset.jsp" %>

<style>
	
</style>

</head>
<body>
	<div class="container">
		<h1 class="page-header"></h1>		
		로그인 성공 유무 : ${id}
	</div>	
	<script>
		<c:if test="${not empty id}">
		location.href = '/jsp/auth/index.do';
		</c:if>
		
		<c:if test="${empty id}">
		history.back();
		</c:if>
		
		
	</script>
</body>
</html>















