package com.test.spring;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//스프링
// - XML 위주의 설정 -> 어노테이션 위주의 설정
//

@Controller
public class HiController {

    //요청 메소드(doGet, doPost, handleRequest)
    //ModelandView를 만든것과 같음.
    @RequestMapping(value="/hi.action")
    public String test(HttpServletRequest req, HttpServletResponse resp, HttpSession session){

        aaa();
        bbb();

        // DB 작업 -> 결과 -> 출력
        // req랑 resp 어떻게 얻어와야????
        // 매개변수로 받아오면됨...ㄷㄷ
        req.setAttribute("num",100);


        //JSP 호출하기
        return "hi"; // "/WEB-INF/views/hi.jsp""
    }

    public void aaa(){

    }

    public void bbb(){

    }
}
