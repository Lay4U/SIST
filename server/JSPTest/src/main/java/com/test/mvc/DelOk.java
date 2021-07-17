package com.test.mvc;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/address/delok.do")
public class DelOk extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		AddressDAO dao = new AddressDAO();
		AddressDTO dto = new AddressDTO();
		
		String seq = req.getParameter("seq");
		int result = dao.delete(seq);
		
		req.setAttribute("result", result);
		

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/address/delok.jsp");
		dispatcher.forward(req, resp);
	}

}
