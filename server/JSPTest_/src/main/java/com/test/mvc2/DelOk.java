package com.test.mvc2;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.jsp.jdbc.DBUtil;

public class DelOk  extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//아래 두줄 항상 하는 코드 -> 외우고있어라
		//1. POST -> 인코딩 처리
		//2. 데이터 가져오기
		//3. DB 작업 -> delete
		//4. JSP 호출하기 + 결과 출력
		req.setCharacterEncoding("UTF-8");
		String seq = req.getParameter("seq");
		
		Connection conn = null;
		Statement stat = null;
		int result = -1;
		try {
			conn = DBUtil.open();
			stat = conn.createStatement();
			String sql = "delete from tblAddress where seq = "+seq;
			result = stat.executeUpdate(sql);
			
			if(result > 0 ) {
				resp.sendRedirect("/jsp/list.do");
			} else {
				PrintWriter wt = resp.getWriter();
				wt.print("<script>");
				wt.print("history.back()");
				wt.print("</script>");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("WEB-INF/views/address/delok.jsp");
		dispatcher.forward(req, resp);
		
	}

}
