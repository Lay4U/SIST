package com.test.spring;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//1. Controller 인터페이스 구현
public class HelloController implements Controller {

    //2. doGet(), doPost() 같은 역할의 메소드 -> handelRequest
    @Override
    public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {

        //3. 업무 구현

        //4. JSP 호출하기
        // - RequestDispatcher -> ModelAndView

        ModelAndView mv = new ModelAndView();
        mv.setViewName("hello"); //"hello" -> JSP 파일

        return mv;
    }
}
