package com.test.mvc2;

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
		//http://localhost:8090/jsp/list.do
		// -> list.jsp
		
		//1. DB 작업 -> select
		//2. ResultSet
		//3. JSP 호출하기 + ResultSet
		
		//아래 두줄 항상 하는 코드 -> 외우고있어라
		
		Connection conn = null;
		Statement stat = null;
		ResultSet rs = null;	
		ArrayList<HashMap<String,String>> list = new ArrayList<HashMap<String, String>>();	
		try {
			conn = DBUtil.open();
			stat = conn.createStatement();
			
			String sql = "select * from tblAddress order by seq desc";
			
			rs = stat.executeQuery(sql);
			//결과 테이블 -> 행 + 열로 이루어진 구조 -> 2차원 배열
			
			while (rs.next()) {
				//레코드 1줄 -> HashMap 1개
				HashMap<String, String> map = new HashMap<String, String>();
				
				//*****
				map.put("seq", rs.getString("seq"));
				map.put("name", rs.getString("name"));
				map.put("age", rs.getString("age"));
				map.put("gender", rs.getString("gender"));
				map.put("address", rs.getString("address"));
				
				list.add(map);
			}
			//list(ArrayList)안에 행이 들어있고
			//map 안에 행에 해당하는 열이 들어있다.
			//ResultSet의 모든 내용을 ArrayList<HashMap>에 복사했다. list == rs
			
			
			
//			rs결과 값을 탐색하기 위해 여기서 닫으면 안되고, jsp에서 닫아야함. -> MVC패턴을깨는데?
//			rs값을 ArrayList<HashMap<String,String>>변수에 저장
			rs.close();
			stat.close();
			conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//ResultSet을 직접 전달하지 않고, ArrayList에 담아서 전달하는 이유
		//1. MVC 디자인 패턴을 구현하기 위해서(**********************)
		//2. JSTL을 사용하기 위해서
		//	- JSTL이 ArrayList는 forEach로 탐색이 가능하지만,
		//	- ResultSet은 탐색할 수가 없다. -> Java를 직접 쓰지 않기 위해
		
		
		//jsp에게 전달하기 위해 rs를 복사한 list(ArrayList<HashMap>)를 넘긴다. -> 화면에 출력하기 위해
		req.setAttribute("list", list);
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("WEB-INF/views/address/list.jsp");
		dispatcher.forward(req, resp);
		
		
		
	}
	

}
