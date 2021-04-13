package com.test.java;

public class Ex23_for {
	
	public static void main(String[] args) {
		
		//Ex23_for.java
		//for문
		// - 중첩
		// - for문안에 또 다른 for문
		
		//m1();
		//m2();
		//m3();
		m4();
		
	}//main

	private static void m4() {
		
		//별찍기 -> 루프 연습
		for (int i=0; i<5; i++) { //행 출력(증감)
			for (int j=0; j<5; j++) { //열 출력(증감)
				System.out.print("*");
			}
			System.out.println();
		}
		System.out.println();
		
		
		
		for (int i=0; i<5; i++) { 
			for (int j=0; j<=i; j++) {
				System.out.print("*");
			}
			System.out.println();
		}
		System.out.println();
		
		
		
		for (int i=0; i<5; i++) {
			for (int j=i; j<5; j++) {
				System.out.print("*");
			}
			System.out.println();
		}
		System.out.println();
		
		
		for (int i=0; i<5; i++) {
			for (int j=0; j<(4-i); j++) {
			}
			for (int j=0; j<=i; j++) {
				System.out.print("*");
			}
			System.out.println();
		}
		System.out.println();
		
		
	}

	private static void m3() {
		
		//1. 루프 변수 제어
		//2. 분기문 개입
		for (int i=0; i<10; i++) {
			for (int j=0; j<10; j++) {
				
				if (i == 5) {
					//자신이 직접 포함된 제어문만 탈출한다.(j for 탈출)
					//break;
					continue;
				}
				
				System.out.printf("i: %d, j: %d\n", i, j); //몇번?
			}
		}
		
	}

	private static void m2() {

		//2중 for문 -> 구구단(2단~9단)
		
		for (int dan=2; dan<10; dan++) {
		
			//int dan = 2;
			
			for (int i=1; i<10; i++) {
				System.out.printf("%d x %d = %2d\n", dan, i, dan * i);			
			}
			System.out.println();
			
		}
		
		
	}

	private static void m1() {
		
		//2중 for문
		// - 바깥쪽 회전수 x 안쪽 회전수
		for (int i=0; i<10; i++) { //대회전
			for (int j=0; j<10; j++) { //소회전
				//System.out.println("실행문"); //실행횟수?
				System.out.printf("i: %d, j: %d\n", i, j);
			}
		}
		System.out.println();
		
		for (int i=0; i<100; i++) {
			//System.out.println("실행코드");
			System.out.printf("i: %d\n", i);
		}
		System.out.println();
		System.out.println();
		
		
		//우리 주변에 2중 for문의 루프 변수 변화값을 볼 수 있는 사례
		//A. 시계(시침, 초침)
		for (int i=0; i<24; i++) { //시침
			for (int j=0; j<60; j++) { //분침
				System.out.printf("%02d:%02d\n", i, j);				
			}
		}
		System.out.println();
		System.out.println();
		
		//B. 강의실(6개) + 학생(30명)
		// -> 전부 체크
		for (int i=1; i<=6; i++) { //강의실
			for (int j=1; j<=30; j++) { //학생
				System.out.printf("%d강의실 %d번 학생\n", i, j);
			}
		}
		System.out.println();
		System.out.println();
		
		
		//C. 아파트 110동 -> 15층 -> 5세대(1호~5호)
		for (int i=1; i<=15; i++) { //층
			for (int j=1; j<=5; j++) { //세대(호)
				
				System.out.printf("%d층 %d호\n", i, j);
				
			}			
		}
		System.out.println();
		System.out.println();
		
		
		//3중 for문 10 x 10 x 10 = 1000회 실행
		for (int i=5; i<12; i++) { //7
			for (int j=3; j<5; j+=2) { //1
				for (int k=2; k<8; k+=3) { //2
					System.out.println("실행문");
				}
			}
		}
		System.out.println();
		
		
		//for문 -> 1~3중 for문
		for (int i=0; i<24; i++) { //시침
			for (int j=0; j<60; j++) { //분침
				for (int k=0; k<60; k++) {
					System.out.printf("%02d:%02d:%02d\n", i, j, k);
				}
			}
		}
		
		
		
	}//m1

}





























