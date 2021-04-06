package com.test.question.q5;

public class Q002 {
	public static void main(String[] args) {
		position("홍길동");
		System.out.println();
		position("홍길동", "유재석");
		System.out.println();
		position("홍길동", "유재석", "박명수");
		System.out.println();
		position("홍길동", "유재석", "박명수", "정형돈");
		System.out.println();
	}

	public static void position(String s1) {
		System.out.println("사원 : " + s1);
	}

	public static void position(String s1, String s2) {
		System.out.println("사원 : " + s1);
		System.out.println("대리 : " + s2);
	}

	public static void position(String s1, String s2, String s3) {
		System.out.println("사원 : " + s1);
		System.out.println("대리 : " + s2);
		System.out.println("과장 : " + s3);
	}

	public static void position(String s1, String s2, String s3, String s4) {
		System.out.println("사원 : " + s1);
		System.out.println("대리 : " + s2);
		System.out.println("과장 : " + s3);
		System.out.println("부장 : " + s4);
	}
	
	/*
	 * 
	 * 
	 */
}
