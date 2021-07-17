<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.test.jsp.jdbc.DBUtil"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//할일
	//1. 데이터 가져오기(request.getParameter())
	//2. DB 작업 -> insert
	//3. 페이지 이동하기 -> todo_list.jsp
	
	request.setCharacterEncoding("UTF-8");
	
	
	
	
	
	int seq = 0;
	String todo = request.getParameter("todo");
	int complete = 0;
	//Date now = new java.sql.Date(System.currentTimeMillis()); // 현재시간을 가져와 Date형으로 저장한다
	//java.sql.Date now = new java.sql.Date(new java.util.Date().getTime());
	//Date now_d = new Date(System.currentTimeMillis());
	//String now = now_d.toString();
	String now = "sysdate";
	int result=-1;
	
	
	Connection conn = null;
	PreparedStatement stat = null;
	
	System.out.println(todo);
	System.out.println(complete);
	// seq, todo, complete, regdate
	try{
		
		String sql ="insert into tblTodo values(seqTodo.nextVal,?,?,sysdate)";
		conn = DBUtil.open();
		stat = conn.prepareStatement(sql);
		
		stat.setString(1, todo);
		stat.setInt(2, complete);
		//stat.setDate(4, now);
		//stat.setString(4, now);
		

		
		result = stat.executeUpdate();
		
		stat.close();
		conn.close();
		
	}catch(Exception e){
		System.out.println(e);
	}
	
	if (result == 1) {
		response.sendRedirect("/jsp/todo/todo_list.jsp");
	} else {
		response.sendRedirect("/jsp/todo/todo_add.jsp");
	} 
%>
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
	<!-- todo_addok.jsp -->

</body>
</html>















