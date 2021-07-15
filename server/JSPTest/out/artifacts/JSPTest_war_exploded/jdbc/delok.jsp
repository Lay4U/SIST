<%@page import="com.test.jsp.jdbc.DBUtil"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
//할일
//1. 
//2. DB -> delete
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
		<%
		Connection conn = null;
		Statement stat = null;
		int result = -1;

		try {
			conn = DBUtil.open();
			stat = conn.createStatement();

			String sql = "delete from tblAddress where seq = " + seq;

			result = stat.executeUpdate(sql);

			stat.close();
			conn.close();
		} catch (Exception e) {
			System.out.println(e);
		}

		if (result == 1) {
			response.sendRedirect("/jsp/jdbc/list.jsp");
		} else {
			response.sendRedirect("/jsp/jdbc/del.jsp");
		}
		%>
	</div>

	<script>
		
	</script>
</body>
</html>






