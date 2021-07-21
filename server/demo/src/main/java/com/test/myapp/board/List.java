package com.test.myapp.board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
//@WebServlet(name = "helloServlet", value = "/hello-servlet")
@WebServlet(name = "listServlet", value="/board/list")
@WebServlet("/board/list.do")
public class List extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


		//1.
		BoardDAO dao = new BoardDAO();
		
		//2.
		ArrayList<BoardDTO> list = dao.list();
		
		//2.5
		for (BoardDTO dto : list) {
			//날짜 > 가공
			String regdate = dto.getRegdate();
			
			
			regdate = regdate.substring(0, 10);
			dto.setRegdate(regdate);
			
			String subject = dto.getSubject();
			
			
			subject = subject.replace("<script", "&lt;script").replace("</script>", "&lt;/sciprt&gt;");
			dto.setSubject(subject);
			
			
			if (subject.length() > 38) {
				subject = subject.substring(0, 38) + "..";
				dto.setSubject(subject);
			}
		}
		
		//새로고침에 의한 조회수 증가 방지 티켓
		
		HttpSession session = req.getSession();
		session.setAttribute("read", "n");
		
		//3.
		req.setAttribute("list", list);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/board/list.jsp");
		dispatcher.forward(req, resp);
	}

}
