package com.test.mvc2;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Del  extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//아래 두줄 항상 하는 코드 -> 외우고있어라
		//1. 데이터 가져오기(삭제할 번호)
		//2. JSP 호출하기 + 삭제할 번호 넘기기
		String seq = req.getParameter("seq");
		req.setAttribute("seq", seq);
		RequestDispatcher dispatcher = req.getRequestDispatcher("WEB-INF/views/address/del.jsp");
		dispatcher.forward(req, resp);
		
	}

}