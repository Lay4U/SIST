package com.test.myapp.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/board/addok.do")
public class AddOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//ok jsp는 필요없이 자바에서 처리 후 리다이렉트
		
		//할일
		//1. 데이터 가져오기
		//2. DB 작업 > DAO 위임 > insert
		//3. 결과 > 후처리
		
//		req.setCharacterEncoding("UTF-8"); Encoding Filter등록해서필요없음
		
		//1. 
		String subject = req.getParameter("subject");
		String content = req.getParameter("content");
		String tag = req.getParameter("tag");
		
		//2.
		BoardDAO dao = new BoardDAO();
		BoardDTO dto = new BoardDTO();
		
		HttpSession session = req.getSession();
		
		dto.setId(session.getAttribute("id").toString());
		dto.setSubject(subject);
		dto.setContent(content);
		dto.setTag(tag);
		
		int result = dao.add(dto);
		
		//id를 넘기는 방법(세션에 존재하는) 위에 방법이 제일 좋음.
		//메서드를 뜯어 고쳐야 돼서 설계가 잘못됨.
		//dto만 주고받을수 있도록
//		int result = dao.add(dto, req);
//		int result = dao.add(dto, session);
		
		if(result==1) {
			resp.sendRedirect("/myapp/board/list.do");
		} else {
			resp.sendRedirect("/myapp/board/add.do");
		}
		
		
		
	}

}
