package com.ques.java;

public class Question2 {
	public static void main(String[] args) {
		String h = "홍길동", a = "아무개", ha = "하하하";
		int hKor = 80, hEng = 90, hMath = 95;
		int aKor = 76, aEng = 86, aMath = 79;
		int haKor = 89, haEng = 92, haMath = 85;

		System.out.println("[학생]\t[국어]\t[영어]\t[수학]\t[평균]");
		System.out.println("--------------------------------------");
		System.out.printf("%s\t  %d\t  %d\t  %d\t  %d\n", h, hKor, hEng, hMath, (hKor + hEng + hMath) / 3);
		System.out.printf("%s\t  %d\t  %d\t  %d\t  %d\n", a, aKor, aEng, aMath, (aKor + aEng + aMath) / 3);
		System.out.printf("%s\t  %d\t  %d\t  %d\t  %d\n", ha, haKor, haEng, haMath, (haKor + haEng + haMath) / 3);
	}
}
