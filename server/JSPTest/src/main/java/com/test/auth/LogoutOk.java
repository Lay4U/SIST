package com.test.auth;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/auth/logoutok.do")
public class LogoutOk extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();
		
//		session.setAttribute("id", id);
//		session.removeAttribute("id");
//		session.removeAttribute("name");
//		session.removeAttribute("lv");
//		session.removeAttribute("regdate");
		session.invalidate();

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/auth/logoutok.jsp");
		dispatcher.forward(req, resp);
	}

}
