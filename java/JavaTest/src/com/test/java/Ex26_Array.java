package com.test.java;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Calendar;

public class Ex26_Array {
	
	public static void main(String[] args) throws NumberFormatException, IOException {
		
		//Ex26_Array.java
		
		//배열, Array
		// - 문자열 유사(문자 배열, char array)
		// - 같은 성격의 데이터 + 같은 자료형 -> 모아놓은 집합
		// - 참조형(Reference Type)
		
		//m1();
		//m2();
		//m3();
		//m4();
		m5();
		
		//자료구조, 알고리즘
		//자료구조 -> 배열(연습 + 제어문)
		
	}

	private static void m5() throws NumberFormatException, IOException {
		
		//배열의 성질
		// - 배열의 길이가 불변(Immutable)이다. > 한번 만들어진 배열의 방 갯수는 수정이 불가능하다. > 방을 더 만들거나, 있는 방을 삭제할 수 없다. > 배열에 들어갈 데이터의 갯수를 미리 충분히 예측해서 최대값의 근접한 길이로 잡는다.(조금 더 크게)
		
		int[] num = new int[350];
		
		//추후에 변경 불가!!!!
		
		
		// - 자바의 배열은 동적할당이 가능하다. > 자바 배열의 길이는 런타임에서 결정할 수 있다.
		//int[] list = new int[5]; //정적할당
		
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		
		System.out.print("숫자: ");
		int n = Integer.parseInt(reader.readLine());
		
		int[] list = new int[n]; //동적할당
		
		System.out.println(list.length);
		
		
		
	}

	private static void m4() {
		
		//배열 + 여러 자료형
		
		//정수 배열(byte, short, int, long)
		byte[] list1 = new byte[3];
		list1[0] = 10;
		System.out.println(list1[0]);
		
		
		//실수형 배열(float, double)
		double[] list2 = new double[3];
		list2[0] = 3.14;
		System.out.println(list2[0]);
		
		
		//문자형 배열(char)
		char[] list3 = new char[3];
		list3[0] = 'A';
		System.out.println(list3[0]);
		
		
		//논리형 배열(boolean)
		boolean[] list4 = new boolean[3];
		list4[0] = true;
		System.out.println(list4[0]);
		
		
		//참조형 타입 배열(**********************)
		// - 문자열은 참조형에 속하지만 사용법은 값형과 동일하다.
		String[] list5 = new String[3];
		list5[0] = "홍길동";
		System.out.println(list5[0]);
		
		
		//모든 자료형으로 배열을 생성할 수 있다.
		Calendar[] list6 = new Calendar[3];
		list6[0] = Calendar.getInstance();
		System.out.printf("%tF\n", list6[0]);
		
		
	}

	private static void m3() {
		
		//요구사항] int 숫자 -> 1~10까지 저장
		
		int[] num = new int[10];
		//int num2[] = new int[10];
		
		//배열안의 방 10개 -> 숫자 대입
		//배열 탐색
		for (int i=0; i<num.length; i++) {
			num[i] = i + 1;
		}
		
		//출력
		System.out.println(num[0]);
		System.out.println(num[1]);
		System.out.println(num[2]);
		
		System.out.println(num[9]); //length - 1
		
		//java.lang.ArrayIndexOutOfBoundsException: Index 10 out of bounds for length 10
		//System.out.println(num[10]); //존재안함
		
		
		for (int i=0; i<num.length; i++) {
			System.out.printf("num[%d] = %d\n", i, num[i]);
		}
		
	}

	private static void m2() {
		
		//배열 사용
		//m1() -> 개선 -> m2()
		
		//요구사항] 학생 3명 > 국어 점수 > 총점, 평균
		//수정사항] 학생 수 증가 > 500명 > 10000명
		
		//1. 배열 만들기(선언하기)
		// - 자료형[] 배열명 = new 자료형[길이];
		
		int[] kor = new int[10000]; //이득 발생
		
		kor[0] = 100; //경우에 따라 이득 발생
		kor[1] = 90;
		kor[2] = 80;
		//..
		kor[499] = 100;
		
		//int total = kor[0] + kor[1] + kor[2];
		int total = 0;
		
		for (int i=0; i<kor.length; i++) {
			total += kor[i];
		}
		
		double avg = (double)total / kor.length;
		
		System.out.printf("총점: %d점, 평균: %.1f점\n", total, avg);		
		
		
	}

	private static void m1() {
		
		//요구사항] 학생 3명 > 국어 점수 > 총점, 평균
		//수정사항] 학생 수 증가 > 500명
		int kor1;
		int kor2;
		int kor3;
		//+497
		
		kor1 = 100;
		kor2 = 90;
		kor3 = 80;
		//+497
		
		int total = kor1 + kor2 + kor3; // +497
		double avg = total / 3.0; //3 -> 500
		
		System.out.printf("총점: %d점, 평균: %.1f점\n", total, avg);
		
	}

}






















