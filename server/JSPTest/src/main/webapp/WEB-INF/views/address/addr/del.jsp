<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<%@ include file="/inc/asset.jsp"%>

<style>
</style>
</head>
<body>
	<div class="container">
		<h1 class="page-header"></h1>
<div class="confrim">
			<div class="alert alert-danger">정말 삭제하시겠습니까?</div>
			<input type="button" value="삭제하기" class="btn btn-default"
			onclick="location.href='/jsp/delok.do={seq}';">
			
			<input type="button" value="목록보기" class="btn btn-default"
			onclick="location.href='/jsp/list.do';">
		</div>
		
	</div>

	<script>
		
	</script>
</body>
</html>






