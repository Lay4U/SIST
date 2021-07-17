package com.test.card;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/card/addok.do")
public class AddOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String korname = req.getParameter("korname");
		String engname = req.getParameter("engname");
		String tel = req.getParameter("tel");
		String email = req.getParameter("email");
		String company = req.getParameter("company");
		String position = req.getParameter("position");
		
		CardDAO dao = new CardDAO();
		CardDTO dto = new CardDTO();
		
		dto.setKorname(korname);
		dto.setEngname(engname);
		dto.setTel(tel);
		dto.setEmail(email);
		dto.setCompany(company);
		dto.setPosition(position);
		
		int result = dao.add(dto);
		
		if(result == 1) {
			resp.sendRedirect("/jsp/card/list.do");
		}else {
			resp.sendRedirect("/jsp/card/add.do");
		}
		

	}

}
