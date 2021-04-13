package com.test.java;

public class Ex15_Method {
	
	public static void main(String[] args) {
		
		//Ex15_Method.java
		
		//public static 반환타입 메소드명(인자 리스트) {
		//	실행코드;
		//}
		
		//메소드 반환값
		// - 메소드 실행 후 돌려받은 데이터
		// - 누가 돌려받는지? > 메소드를 호출한 곳에서 반환값을 돌려받는다.
		
		int result = m1(); //메소드의 반환값을 받아서 콘솔에 출력!!!
		
		System.out.println(result);
		
		
		System.out.println(add(10, 20));
		
		//메소드 = 함수 -> 수학의 함수 정의   f(x) = y
		int n = add(30, 40);
		System.out.println(n);
		
		
		int age = 25;
		
		String result2 = check(age) ? "성인" : "미성년자";
		
		System.out.println(result2);
		
	}//main
	
	
	//public static int test() { //This method must return a result of type int
				
	//}
	
	//public static void test() {
		
	//	return 100;
	//}
	
	
	//메소드가 실행을 종료하고 호출된 곳으로 돌아가는 경우
	//1. 메소드의 끝(})을 만났을 때..
	//2. return문을 만났을 때..
	public static int test() {
		
		System.out.println("테스트1");
				
		return 100;
		
		//System.out.println("테스트2"); //Unreachable code
	}
	
	
	//나이에 따라 성인/미성년을 확인해주는 메소드
	public static boolean check(int age) {
		
		return age >= 19 ? true : false;
	}
	
	
	
	//반환값이 있는 메소드를 선언했다.
	public static int m1() {
		
		int num = 100;
		
		return num; //return문, 반환문
	}
	
	
	//void : 돌려줄 값이 없다.
	public static int add(int a, int b) {
		
		return a + b;
	}
	
	
	

}
















