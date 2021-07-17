package com.test.card;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/card/list.do")
public class List extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//1. DB 작업 > 위임 > select
		//2. 결과 반환 > 출력 > JSP 호출하기
		
		//1.
		CardDAO dao = new CardDAO();
		
		//ResultSet rs = dao.list(); -> DB작업은 DAO에서만
		ArrayList<CardDTO> list = dao.list();
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/card/list.jsp");
		dispatcher.forward(req, resp);
	}
}
