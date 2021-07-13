<%@page import="java.sql.Statement"%>
<%@page import="com.test.jsp.jdbc.DBUtil"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	//이 페이지가 할 일!!
	//1. 데이터 가져오기
	//2. DB -> insert 실행
	//3. 페이지 이동하기 -> list.jsp
	
	//폼페이지 -> (GET) -> [UTF-8] -> 수신페이지 -> 그대로 가져오기 OK
	//폼페이지 -> (POST) -> [ISO 8859-1] -> 수신페이지 -> 인코딩 변경
	request.setCharacterEncoding("UTF-8");
	
	//1.
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	String gender = request.getParameter("gender");
	String address = request.getParameter("address");
	int result=0;
	//System.out.println(name);
	
	//2
	Statement stat = null;
	Connection conn = null;
	try{
		conn = DBUtil.open();
		stat = conn.createStatement();
		
		String sql = String.format("insert into tblAddress values (seqAddress.nextVal, '%s', %s '%s', '%s')", name, age, gender, address);
		result = stat.executeUpdate(sql);
		
		
		stat.close();
		conn.close();
	}catch(Exception e){
		e.printStackTrace();
	}
	/* if (result == 1)
	response.sendRedirect("/jsp/jdbc/list.jsp");
	else
		response.sendRedirect("/jsp/jdbc/add.jsp"); */
%>
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

		
	</div>

	<script>
		<% if (result == 1){ %>
			alert('추가 성공');
			location.href = '/jsp/jdbc/list.jsp';
		<% } else { %>
			alert('추가 실패');
			history.back();
		<% } %>
	</script>
</body>
</html>






