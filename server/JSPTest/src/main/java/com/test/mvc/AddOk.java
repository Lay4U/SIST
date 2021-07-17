package com.test.mvc;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/address/addok.do")
public class AddOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		AddressDAO dao = new AddressDAO();
		AddressDTO dto = new AddressDTO();
		
		dto.setAddress(req.getParameter("address"));
		dto.setAge(req.getParameter("age"));
		dto.setGender(req.getParameter("gender"));
		dto.setName(req.getParameter("name"));
		dto.setSeq(req.getParameter("seq"));
		
		int result = dao.add(dto);
		
		if (result == 1) {
			resp.sendRedirect("/jsp/address/list.do");
		}else {
			resp.sendRedirect("/jsp/address/add.do");
		}

	}

}
