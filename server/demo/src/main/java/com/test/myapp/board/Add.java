package com.test.myapp.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//@WebServlet(name = "helloServlet", value = "/hello-servlet")
@WebServlet("/board/add.do")
public class Add extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//현재 할 일 없음 > 나중에 생김

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/board/add.jsp");
		dispatcher.forward(req, resp);
	}

}

