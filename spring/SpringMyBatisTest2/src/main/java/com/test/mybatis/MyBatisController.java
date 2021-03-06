package com.test.mybatis;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MyBatisController {
	
	//MyBatisController -> (의존 주입) -> MyBatisDAO 생성 -> (의존 주입) -> SqlSessionTemplate 객체 생성 -> (의존 주입) -> SqlSessionFactoryBean 객체 생성 -> (의존 주입) -> BasicDataSource 객체 생성
	
	
	@Autowired
	private MyBatisDAO dao;
	
	@RequestMapping(value = "/test.action", method = { RequestMethod.GET })
	public String test(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
		

		return "result";
	}
	
	@RequestMapping(value = "/m1.action", method = { RequestMethod.GET })
	public String m1(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
		MyBatisDTO dto = new MyBatisDTO();
		dto.setSeq("3");
		dto.setName("아무개");
		dto.setMemo("메모입니다.");
		dto.setCategory("MyBatis");
		
		
		//반환값이 없는 쿼리
		int result = dao.add(dto);
		
		req.setAttribute("result", result);

		return "result";
	}
}
