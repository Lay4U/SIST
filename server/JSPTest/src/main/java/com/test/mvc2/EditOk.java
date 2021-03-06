package com.test.mvc2;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.jsp.jdbc.DBUtil;

public class EditOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 1. POST -> 인코딩 처리
		// 2. 데이터 가져오기
		// 3. DB 작업 -> update
		// 4. JSP 호출하기 + 결과 출력

		// 1.
		req.setCharacterEncoding("UTF-8");

		// 2.
		String seq = req.getParameter("seq");
		String name = req.getParameter("name");
		String age = req.getParameter("age");
		String gender = req.getParameter("gender");
		String address = req.getParameter("address");

		// 3.
		Connection conn = null;
		PreparedStatement stat = null;
		int result = -1;

		try {

			String sql = "update tblAddress set name = ?, age = ?, gender = ?, address = ? where seq = ?";

			conn = DBUtil.open();
			stat = conn.prepareStatement(sql);

			stat.setString(1, name);
			stat.setString(2, age);
			stat.setString(3, gender);
			stat.setString(4, address);
			stat.setString(5, seq);

			result = stat.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}

		// 4.
		req.setAttribute("result", result);
		System.out.println(result);


		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/address/editok.jsp");
		dispatcher.forward(req, resp);

	}

}