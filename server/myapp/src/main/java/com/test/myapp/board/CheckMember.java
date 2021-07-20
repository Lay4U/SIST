package com.test.myapp.board;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CheckMember {

	public void check(HttpServletRequest req, HttpServletResponse resp) {
		
		try {
			HttpSession session = req.getSession();
			
			resp.setCharacterEncoding("UTF-8");
			if(session.getAttribute("id") == null || session.getAttribute("id").toString().equals("")) {
				PrintWriter writer = resp.getWriter();
				writer.print("<html><head><meta charset='utf-8'></head><body><script>");
				writer.print("alert('로그인 후 사용이 가능합니다.');");
				writer.print("location.href='/myapp/index.do';");
				writer.print("</sciprt></html>");
				
				writer.close();
				
			}	
		} catch (Exception e) {
			e.printStackTrace();
		}
		
			
	}
	
}
