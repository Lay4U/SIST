<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<%@ include file="/inc/asset.jsp"%>

<style>
	.container { width: 600px; }
	
</style>
</head>
<body>
	<div class="container">
		<h1 class="page-header">AddressBook</h1>
		<div class="confrim">
			<div class="alert alert-danger">정말 삭제하시겠습니까?</div>
			<input type="button" value="삭제하기" class="btn btn-default"
			onclick="location.href='/jsp/jdbc/delok.jsp';">
			<input type="button" value="목록보기" class="btn btn-default"
			onclick="location.href='/jsp/jdbc/list.jsp';">
		</div>

		
	</div>

	<script>
		
	</script>
</body>
</html>






