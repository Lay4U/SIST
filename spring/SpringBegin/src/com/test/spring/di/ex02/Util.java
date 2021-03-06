package com.test.spring.di.ex02;

import java.util.Scanner;

public class Util {
	
	private Scanner scan;
	
	//********************************************************************
	//본인이 필요한 의존객체(Scanner)를 직접 생성하지 않고
	//외부로부터 전달받아서 사용하는 형태
	// > 의존 객체를 주입받았다.(*****) > 의존 주입(DI, Dependency Injection)
	
	//의존 주입 도구
	//1. 생성자 사용
	//2. Setter 사용
	
	public Util(Scanner scan) { //외부에서 만들어 전달해준 Scanner를 사용하기 위해 초기화
		this.scan = scan;
	}
	public Util() {
		//None..
	}
	
	public void setScan(Scanner scan) {
		this.scan = scan;
	}
	
	public String getName() {
		
		//Util 객체는 Scanner 객체를 의존한다. 
		// - 의존 객체 Scanner를 누가 생성했는가? > Util 객체가 생성했다. > 왜? > 필요하니까!!!
		
		//DI 디자인 패턴
		// - 의존 객체를 생성하는 주체를 본인이 아니라 외부로 맡기는 패턴
		
		//Scanner scan = new Scanner(System.in); //의존 객체를 직접 만드는 코드 사라짐(************)
		
		System.out.print("이름: ");
		
		String name = scan.nextLine();
		
		return name;		
	}

}
























