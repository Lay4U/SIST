package com.test.mvc;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.jsp.jdbc.DBUtil;

public class List extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Connection conn = null;
		Statement stat =null;
		ResultSet rs = null;
		ArrayList<HashMap<String, String>> list = new ArrayList<HashMap<String, String>>();
		
		try {
			conn = DBUtil.open();
			stat = conn.createStatement();
			String sql = "select * from tblAddress order by seq desc";
			rs = stat.executeQuery(sql);
			
			while(rs.next()){
				HashMap<String,String> map = new HashMap<String, String>();
				map.put("seq", rs.getString("seq"));
				map.put("name", rs.getString("name"));
				map.put("age", rs.getString("age"));
				map.put("gender", rs.getString("gender"));
				map.put("address", rs.getString("address"));
				
				list.add(map);
			}
			
			rs.close();
			stat.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		req.setAttribute("list", list);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/address/list.jsp");
		dispatcher.forward(req, resp);
	}

}
