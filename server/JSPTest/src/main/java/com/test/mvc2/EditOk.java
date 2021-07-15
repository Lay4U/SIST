package com.test.mvc2;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.jsp.jdbc.DBUtil;

public class EditOk   extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//EditOk.java
		//1. POST -> 인코딩 처리
		//2. 데이터 가져오기
		//3. DB 작업 -> update
		//4. JSP 호출하기 + 결과 출력
		req.setCharacterEncoding("UTF-8");
		
		
		String name = req.getParameter("name");
		String age = req.getParameter("age");
		String gender= req.getParameter("gender");
		String address = req.getParameter("address");
		String seq = req.getParameter("seq");
		
		System.out.println(seq);
		System.out.println(name);
		System.out.println(age);
		System.out.println(gender);
		System.out.println(address);
		
		System.out.println("");
		Connection conn = null;
//		PreparedStatement stat = null;
		Statement stat = null;
		int result=-1;
		try {
//			String sql = "update tblAddress set name = ?, age = ?, gender = ?, address = ? where seq =?";
			
			conn = DBUtil.open();
			stat = conn.createStatement();
//			stat = conn.prepareStatement(sql);
//			stat.setString(0, name);
//			stat.setString(1, age);
//			stat.setString(2, gender);
//			stat.setString(3, address);
//			stat.setString(4, seq);
//			System.out.println(stat);
			String sql = String.format("update tblAddress set name = '%s', age = %s, gender = '%s', address = '%s'"
					+ " where seq = %s", name, age, gender, address, seq);
			result=stat.executeUpdate(sql);
			
			conn.close();
			stat.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(result != 0)
		resp.sendRedirect("/jsp/list.do");
		else {
			PrintWriter writer = resp.getWriter();		
			writer.print("<script>");
			writer.print("history.back()");
			writer.print("</script>");
		}
			
		
		//RequestDispatcher dispatcher = req.getRequestDispatcher("WEB-INF/views/address/editok.jsp");
//		dispatcher.forward(req, resp);
		
	}

}