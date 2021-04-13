package com.test.java;

import java.io.IOException;

public class Ex09_Input {
	
	public static void main(String[] args) throws IOException {
		
		
		//System.out.printf("출력: %c\n", 'H');
		//System.out.printf("출력: %c\n", 70);
		
		
		
		//Ex09_Input.java
		
		/*
		
		콘솔 입력
		
		1. System.in.read() 메소드
		- 입력한 문자의 코드값을 반환
		- 1바이트 입력만 받는다.(한글은 입력 불가능)
		- read() 실행 1번당 1개의 문자만 읽는다.
		
		2. BufferedReader 클래스
		
		3. Scanner 클래스
		
		
		*/
		
		//요구사항] 사용자에게 문자 1개를 (키보드) 입력받아서 그대로 화면에 출력하시오.
		//입력: A
		//출력: 입력하신 문자는 'A'입니다.
		
		System.out.print("문자 입력: ");
		
		//사용자에게 키보드 입력을 해주세요..
		// - 언제 입력할지 예측할 수 가 없기 때문에.. 이 구문에서 잠시 프로그램이 멈춤 상태가 된다.
		// - 입력 대기 상태 or Block 걸렸다.
		// - 입력 끝났다는 의사 표시를 엔터로 한다.
		
		
		//Win+R(run)
		// - notepad.exe
		// - mspaint.exe
		// - explorer.exe
		// - iexplore.exe
		// - msedge.exe
		// - wordpad
		// - calc
		// - cmd
		
		
		//read() -> 입력한 문자의 문자 코드값을 반환한다.
		//A(65) ~ Z(90)
		//a(97) ~ z(122)
		//0(48) ~ 9(57)
		
		//01000001
		int data = System.in.read();
		
		//65 -> A
		System.out.printf("입력하신 문자는 '%d'입니다.\n", data);
		System.out.printf("입력하신 문자는 '%c'입니다.\n", data);
		
		data = System.in.read();
		System.out.printf("입력하신 문자는 '%d'입니다.\n", data);
		System.out.printf("입력하신 문자는 '%c'입니다.\n", data);
		
		data = System.in.read();
		System.out.printf("입력하신 문자는 '%d'입니다.\n", data);
		System.out.printf("입력하신 문자는 '%c'입니다.\n", data);
		
		data = System.in.read();
		System.out.printf("입력하신 문자는 '%d'입니다.\n", data);
		System.out.printf("입력하신 문자는 '%c'입니다.\n", data);
		
		data = System.in.read();
		System.out.printf("입력하신 문자는 '%d'입니다.\n", data);
		System.out.printf("입력하신 문자는 '%c'입니다.\n", data);
		
		
		System.out.println("프로그램 종료");
		
		
		
		
	}

}





























