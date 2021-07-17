//package com.test.mvc;
//
//import java.io.IOException;
//import java.util.HashMap;
//
//import javax.servlet.RequestDispatcher;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//@WebServlet("/address/edit.do")
//public class edit extends HttpServlet {
//
//	@Override
//	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		AddressDAO dao = new AddressDAO();
//		AddressDTO dto = new AddressDTO();
//		HashMap<String, String> map = new HashMap<String, String>();
//		
//		dto.setSeq(req.getParameter("seq"));
//		map = dao.getToEdit2(req.getParameter("seq"));
////		dao.getToEdit(req.getParameter("seq"));
//		System.out.println(map);
//		req.setAttribute("map", map);
//		
//		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/address/edit.jsp");
//		dispatcher.forward(req, resp);
//	}
//
//}


package com.test.mvc;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/address/edit.do")
public class Edit extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		AddressDAO dao = new AddressDAO();
		AddressDTO dto = new AddressDTO();
		dto.setSeq(req.getParameter("seq"));
		dto = dao.getToEdit(dto);
//		dao.getToEdit(req.getParameter("seq"));
		req.setAttribute("dto", dto);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/address/edit.jsp");
		dispatcher.forward(req, resp);
	}

}
