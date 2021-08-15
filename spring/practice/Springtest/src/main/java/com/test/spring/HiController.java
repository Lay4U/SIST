package com.test.spring;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HiController {
	@RequestMapping(value="/hi.action")
	public String test(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
		aaa();
		bbb();
		
		req.setAttribute("num", 100);
		return "hi";
		
		
		
	}
	
	public void aaa() {
		
	}
	public void bbb() {
		
	}
}
