package com.test.spring.aop;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Main {
	public static void main(String[] args) {
//		Memo memo = new Memo();
		
		ApplicationContext context = new ClassPathXmlApplicationContext(".\\com\\test\\spring\\aop\\memo.xml");
		
		Memo memo = (Memo)context.getBean("memo");
		
		//1. 주업무 실행 - 메모 쓰기
		try {
			memo.memberadd("메모");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//2. 주업무 실행 - 메모 수정
		memo.memberedit(10, "메모");
		
		//3. 주업무 실행 - 메모 삭제
		memo.memberdel(10);
		
		//4. 주업무 실행 - 메모 읽기
		memo.read(5);
		
		//5. 주업무 실행 - 메모 검색
		memo.search("길동");
		memo.search("호호");
		
	}
}
