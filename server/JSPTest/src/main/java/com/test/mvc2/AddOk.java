package com.test.mvc2;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.jsp.jdbc.DBUtil;

public class AddOk extends HttpServlet {

	//POST -> doPost()
	//GET -> doGet()
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 할일
		// 1. 데이터가 넘어오고있다.
		// POST로 넘어왔으니까 데이터 인코딩 처리
		// 2. 데이터 가져오기
		// 3. DB에 저장하기위해 가져왔으니 insert하자
		// 4. JSP 호출하기 + 결과 출력
		
		//1. encoding
		req.setCharacterEncoding("UTF-8");
		
		//2. get data
		String name = req.getParameter("name");
		String age = req.getParameter("age");
		String gender = req.getParameter("gender");
		String address = req.getParameter("address");
		
		//3. insert to DB
		Connection conn = null;
		PreparedStatement stat = null;
		int result = -1; //result 변수가 절대로 가질 수 없는 값.
		
		try {
			String sql = "insert into tblAddress(seq, name, age, gender, address) "
					+ "values(seqAddress.nextVal, ?, ?, ?, ?)";
			
			conn = DBUtil.open();
			stat = conn.prepareStatement(sql);
			
			stat.setString(1, name);
			stat.setString(2, age);
			stat.setString(3, gender);
			stat.setString(4, address);
			
			result = stat.executeUpdate(); //적용된 행의 개수. 1(성공) 0(실패)
			
										   
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//** 출력할 내용이 거의 없는 경우엔
		//	JSP와 짝을 맺지 않고, Servlet 혼자 일을 마무리 하는 경우도 종종 있따.
		// result값이 1이면 정상으로 0이면 뒤로가기 하는 행동밖에 없다.
		// JSP의 역할이 거의 없으므로 Servlet에서 처리
		
		if (result == 1) {
			resp.sendRedirect("/jsp/list.do");
		}else {
//			resp.sendRedirect("/jsp/add.do");
			PrintWriter writer = resp.getWriter();
			writer.print("<script>");
			writer.print("history.back();");
			writer.print("</script>");
			writer.close();
//			AddOk의 경우 한줄의 자바스크립트로 끝나므로 이렇게 하는게 효율적
		}
		
		//4. 호출하면서 result(결과) 보내기
		//req.setAttribute("result", result);
		
		
		// 아래 두줄 항상 하는 코드 -> 외우고있어라
		//RequestDispatcher dispatcher = req.getRequestDispatcher("WEB-INF/views/address/addok.jsp");
		//dispatcher.forward(req, resp);

	}

}