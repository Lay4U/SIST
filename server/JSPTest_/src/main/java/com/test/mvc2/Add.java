package com.test.mvc2;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Add  extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//이 Add라는 서블릿은 할 일이 없다.
		
		//아래 두줄 항상 하는 코드 -> 외우고있어라
		RequestDispatcher dispatcher = req.getRequestDispatcher("WEB-INF/views/address/add.jsp");
		dispatcher.forward(req, resp);
		
	}

}
