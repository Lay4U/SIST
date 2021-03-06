package com.test.mvc2;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.jsp.jdbc.DBUtil;

public class Edit extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//1. 데이터 가져오기(수정할 번호)
		//2. DB 작업 -> select(수정하기 전 데이터)
		//3. ResultSet -> HashMap 옮겨 담기
		//4. JSP 호출하기 + HashMap 넘기기
		
		String seq = req.getParameter("seq");
		
		Connection conn = null;
		PreparedStatement stat = null;
		ResultSet rs = null;
		HashMap<String,String> map = new HashMap<String,String>();
		
		try {

			String sql = "select * from tblAddress where seq = ?";
			
			conn = DBUtil.open();
			stat = conn.prepareStatement(sql);
			
			stat.setString(1, seq);
			
			rs = stat.executeQuery();
			
			
			if (rs.next()) {
				map.put("seq", rs.getString("seq"));
				map.put("name", rs.getString("name"));
				map.put("age", rs.getString("age"));
				map.put("gender", rs.getString("gender"));
				map.put("address", rs.getString("address"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		System.out.println(map);
		req.setAttribute("map", map);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/address/edit.jsp");
		dispatcher.forward(req, resp);
		
	}
	
}