package com.test.myapp.board;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/board/list.do")
public class List extends HttpServlet {
	//GET or POST
	//	- 페이지를 요청 할 때 어느때 GET 요청이고 어느때 POST 요청인지?
	//	1. GET
	//		- 브라우저 주소창을 URL을 입력해서 요청할 때
	//		- <a> 이동 시
	//		- location.href 이동 시
	//		- resp.sendRedirect() 이동 시
	//		- <form method="GET">
	
	
	// 2. POST
	//		- <form method="POST">
	//		- 외엔 없다.
	
	/*
	 * 대부분(99%)의 <form>은 method="POST"를 사용한다.
	 * 예외로.. 전송 당시의 상태를 유지하고 싶을 때 method="GET"을 사용한다.
	 * (ex. 검색결과의 북마크) 검색할때만 GET을 쓰자.
	 */

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPostGet(req, resp);
	
	}

	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		doPostGet(req, resp);
	}


	private void doPostGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//list.do
		//1. 목록보기(게시판의 시작 페이지 역할)
		//	- select ..;
		//2. 검색결과보기(검색 버튼 눌러 호출)
		//	- select where ..
		
		
		String column = req.getParameter("column");
		String search = req.getParameter("search");
		String isSearch = "n";
		
		
//		System.out.println(column);
//		System.out.println(search);
		
		if((column != null && search != null) && (!column.equals("") && (!search.equals("")))) {
			isSearch = "y";
		}
			
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("column", column);
		map.put("search", search);
		map.put("isSearch", isSearch);
		
		
		//날짜 자르는 업무
		//1. SQL > 시분초 필요해서 선택 X
		//2. DAO > 순수 데이터 입출력만 전담 : 서블릿에서 시분초 필요해서 선택 X, DAO에서도 데이터 가공은 안한다. 데이터 가공(처리, 작업)은 서블릿에게 맡긴다.
		//3. Servlet > 선택 O > 데이터 가공 및 조작
		//4. JSP > 선택 X > 출력에만 전담
		
		//할일
		//1. DB작업 > DAO 위임 > select
		//2. ArrayList<BoardDTO> 반환
		//3. JSP 호출 + 2번 전달
		
		
		//1.
		BoardDAO dao = new BoardDAO();
		
		//2.
		ArrayList<BoardDTO> list = dao.list(map);
		
		//2.5
		for (BoardDTO dto : list) {
			//날짜 > 가공
			String regdate = dto.getRegdate();
			
			
			regdate = regdate.substring(0, 10);
			dto.setRegdate(regdate);
			
			String subject = dto.getSubject();
			
			
			subject = subject.replace("<script", "&lt;script").replace("</script>", "&lt;/sciprt&gt;");
			dto.setSubject(subject);
			
			
			//제목 길면 자르기
			if (subject.length() > 38) {
				subject = subject.substring(0, 38) + "..";
				dto.setSubject(subject);
			}
			
			//제목으로 검색중이면 검색어를 부각시키기
			//"자유 게시판입니다." -> 검색(게시판) -> "자유 <span style="color:tomato;background-color:yellow;>게시판</span>입니다.
			if (isSearch.equals("y") && column.equals("subject")) {
				subject = subject.replace(search, "<span style='color:tomato;background-color:yellow;'>" + search + "</span>");
				dto.setSubject(subject);
			}
		}
		
		//새로고침에 의한 조회수 증가 방지 티켓
		
		HttpSession session = req.getSession();
		session.setAttribute("read", "n");
		
		//3.
		req.setAttribute("list", list);
		req.setAttribute("map", map); //*****
		
		

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/board/list.jsp");
		dispatcher.forward(req, resp);
	}

}
/*
댓글 쓰기
1. 별도 테이블
	- tblComment
2. JSP 페이지(X)
3. Servlet(O)
	- AddComment.java
	- DelComment.java
	- COmmentDTO.java
	- CommentDAO.java > BoardDAO.java 사용
	
*/