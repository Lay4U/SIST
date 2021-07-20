<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myapp</title>

<%@ include file="/inc/asset.jsp" %>

<style>
	
</style>

</head>
<body>
	<!-- board/list.jsp -->
	<%@ include file="/inc/header.jsp" %>
	
	<section class="main-section">
		
		<h1>Board <small>List</small></h1>
		
		<div class="btns">
	<button type="button" class="btn btn-primary"
	onclick="location.href='/myapp/board/add.do';">글쓰기</button>
	<button type="button" class="btn btn-primary"
	onclick="location.href='/myapp/board/add.do';">새로고침</button>

	</section>	
	
	<%@ include file="/inc/init.jsp" %>
	<script>
		
	</script>
</body>
</html>















