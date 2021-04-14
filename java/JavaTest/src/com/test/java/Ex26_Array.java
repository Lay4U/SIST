package com.test.java;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Calendar;
import java.util.Iterator;

import javax.lang.model.element.ExecutableElement;

import com.ques.java.Question3;

public class Ex26_Array {

	public static void main(String[] args) throws NumberFormatException, IOException {

		// Ex26_Array.java

		// 배열, Array
		// - 문자열 유사(문자 배열, char array)
		// - 같은 성격의 데이터 + 같은 자료형 -> 모아놓은 집합
		// - 참조형(Reference Type)

		// m1();
		// m2();
		// m3();
		// m4();
		// m5();
		// m6();
		// m7();
		// m8();
		// m9();
		// m10();
		// m11();
		m12();
		// 자료구조, 알고리즘
		// 자료구조 -> 배열(연습 + 제어문)

	}

	private static void m12() {

		/*
		 * 04.14기준 1~2주 이후 프로젝트 시작 주제: 자유 프로젝트 -> 면접볼때 소스보지않음 주제, 외관 7~80% 알고리즘, 코드의질 ->
		 * 평가 제외 ==> 쇼핑몰보다 자재관리 시스템이 더 좋은 프로젝트이다. bad : 쇼핑몰, 블로그, 일기장 good : 자재관리시스템,
		 * 행정, 복지관리시스템등 사무적이고 전문적인 주제가 좋다. 1. 회의 2. 데이터 확보 -> 10000개가 되어야 원론적으로 맞지만,
		 * 현실적으로 힘들면 5개만 구현한다. 3. 구현 + 완성 4. 시연 + MBTI?
		 * 
		 * 있을법하게 뻥치면서라도 일단 UI에는 기능하는것처럼 보여야함 회원 -> 100명, 게시판 -> 100~1000개 Dummy data를
		 * programming 가능.
		 * 
		 */

		// 프로젝트 적용
		// - 데이터 만들기
		// - 회원 정보 * 100명

		// 회원 정보
		// 이름 : 문자열
		// 나이 : 숫자
		// 성별 : 숫자(1.남자, 2.여자)
		// 주소 : 문자열

		// Math.random() + 배열 -> Dummy data generate possible

		int count = 100;
		String[] name = new String[count];
		int[] age = new int[count];
		int[] gender = new int[count];
		String[] address = new String[count];

		// 기초 데이터 -> 임의의 회원 정보를 생성하기 위한 기반 데이터

		// First Name
		String[] n1 = { "김", "이", "박", "최", "정", "한", "유", "조", "임", "왕" };

		// last name
		String[] n2 = { "대", "은", "장", "미", "준", "우", "나", "혜", "운", "인", "영", "수", "인", "호", "환", "혁", "현", "희", "준",
				"원", "형", "래" };

		// address
		String[] a1 = { "서울시", "인천시", "부산시", "광주시", "대전시" };
		String[] a2 = { "동대문구", "서대문구", "중구", "남구", "북구" };
		String[] a3 = { "역삼동", "대치동", "성내동", "논현동", "염재동" };

//		n1[임의의 방번호];
//		System.out.println(n1[(int)(Math.random() * n1.length])
//		+n2[(int)(Math.random() * n2.length])
//		+n3[(int)(Math.random() * n3.length]));

		for (int i = 0; i < count; i++) {
			name[i] = n1[(int) (Math.random() * n1.length)] + n2[(int) (Math.random() * n2.length)]
					+ n2[(int) (Math.random() * n2.length)];

			age[i] = (int) (Math.random() * 41) + 19; // 0~40 -> 19~59

			gender[i] = (int) (Math.random() * 2) + 1; // 0~1 -> 1~2

			address[i] = a1[(int) (Math.random() * a1.length)] + " " + a2[(int) (Math.random() * a2.length)] + " "
					+ a3[(int) (Math.random() * a2.length)] + " " + ((int) (Math.random() * 330 + 1)) + "번지";

		}

		for (int i = 0; i < count; i++) {
			System.out.printf("[%s] %d세, %s, %s\n", name[i], age[i], gender[i] == 1 ? "남자" : "여자", address[i]);
		}
	}

	private static void m11() {
		// 배열 초기화 리스트, 배열 초기자(Initializer)
		int[] num1 = new int[5];

		for (int i = 0; i < num1.length; i++) {
			num1[i] = (i + 1) * 100;
		}

		for (int n : num1) {
			System.out.println(n);
		}

		int[] num2 = new int[5]; // 152, 45, 36, 98, 354;
		// pattern이 없으므로 for문 안됨
		num2[0] = 152;
		num2[1] = 45;
		num2[2] = 36;
		num2[3] = 98;
		num2[4] = 354;
		System.out.println();
		System.out.println();
		int[] num3 = new int[] { 152, 45, 36, 98, 354 }; // Initializer
		for (int n : num3) {
			System.out.println(n);
		}
		int[] num4 = { 152, 45, 36, 98, 354 }; // Initializer(자주 사용)
		String[] name = { "홍길동", "아무개", "하하하" };

	}

	private static void m10() {
		// value vs reference
		int n;
		String s;
		n = 0;
		s = null;
		System.out.println(n);
		System.out.println(s);
		// 지역 변수는 초기화 하지 않으면 사용 불가능
		// 초기화해야할 값이 정해지진 않았지만 일단 초기화를 해야 하는 경우
		// null or ""로 초기화 가능
		// reference는 null 초기화 가능
		// primitive는 null 초기화 불가능
		// int는 null 불가능, Integer는 null 가능
		System.out.println();
		System.out.println();
		System.out.println();

		int[] num = new int[5];
		for (int temp : num)
			System.out.println(temp);
		// 배열의 특징중 하나
		// 배열은 방을 만들면 개발자의 의도와 상관없이 모든 방이 특정값으로 초기화 된다.(생성자에의해)
		// 어떤값으로 초기화? 정수 -> 0 실수 -> 0.0 문자 -> '\0'(null 문자, ASCII==0) 논리 -> false
		// 참조형 배열 -> null로 초기화
	}

	private static void m9() {
		String[] name = new String[5];
		name[0] = "홍길동";
		name[1] = "아무개";
		name[2] = "유재석";
		name[3] = "강호동";
		name[4] = "신동엽";
		// 배열 탐색 -> for문을 사용 배열의 요소 접근
		for (int i = 0; i < name.length; i++) {
			System.out.println(name[i]);
		}
		System.out.println();

		// 제어문 -> 또 다른 for문(Enhanced for Statement)
		// - 배열이나 컬렉션을 대상으로만 사용이 가능하다.
		// iterator를 지원하는 자료형에 한해서만
		// 루프 변수가 없다. > 안정성 높음
		// 배열의 모든 요소를 순차적으로 자동 탐색 > 다른 방식으로는 탐색 불가능
		// for보다 성능이 좋다.
		// 읽기 전용 반복문 : 요소 값을 수정할 수 없다. -> 요소의 값을 수정하면 안된다.
//		for(자료형 변수 : 집합) {
//			ExecutableElement code
//		}
		for (String s : name) {
			System.out.println(s);
			s = "고객: " + name;
		}
		System.out.println();

		for (String temp : name) {
			System.out.println(temp);
		}

		System.out.println();
		System.out.println();
		System.out.println();
		int[] num = new int[10];

		for (int i = 0; i < num.length; i++) {
			num[i] = (int) (Math.random() * 100) + 1;
		}

		for (int n : num) {
			System.out.println(n);
		}
	}

	private static void m8() {
		// 배열 복사

	}

	private static void m7() {
		// 배열 복사
		// Value vs Reference Copy

		int[] num1 = new int[3];
		ouput(num1);
	}

	private static void ouput(int[] num) {
		for (int i = 0; i < num.length; i++)
			System.out.printf("%d  ", num[i]);
		System.out.println();
	}

	private static void m6() {

		int[] num2 = new int[3];

		num2[0] = 100;
		num2[2] = 300;
	}

	private static void m5() throws NumberFormatException, IOException {

		// 배열의 성질
		// - 배열의 길이가 불변(Immutable)이다. > 한번 만들어진 배열의 방 갯수는 수정이 불가능하다. > 방을 더 만들거나, 있는 방을
		// 삭제할 수 없다. > 배열에 들어갈 데이터의 갯수를 미리 충분히 예측해서 최대값의 근접한 길이로 잡는다.(조금 더 크게)

		int[] num = new int[350];

		// 추후에 변경 불가!!!!

		// - 자바의 배열은 동적할당이 가능하다. > 자바 배열의 길이는 런타임에서 결정할 수 있다.
		// int[] list = new int[5]; //정적할당

		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));

		System.out.print("숫자: ");
		int n = Integer.parseInt(reader.readLine());

		int[] list = new int[n]; // 동적할당

		System.out.println(list.length);

	}

	private static void m4() {

		// 배열 + 여러 자료형

		// 정수 배열(byte, short, int, long)
		byte[] list1 = new byte[3];
		list1[0] = 10;
		System.out.println(list1[0]);

		// 실수형 배열(float, double)
		double[] list2 = new double[3];
		list2[0] = 3.14;
		System.out.println(list2[0]);

		// 문자형 배열(char)
		char[] list3 = new char[3];
		list3[0] = 'A';
		System.out.println(list3[0]);

		// 논리형 배열(boolean)
		boolean[] list4 = new boolean[3];
		list4[0] = true;
		System.out.println(list4[0]);

		// 참조형 타입 배열(**********************)
		// - 문자열은 참조형에 속하지만 사용법은 값형과 동일하다.
		String[] list5 = new String[3];
		list5[0] = "홍길동";
		System.out.println(list5[0]);

		// 모든 자료형으로 배열을 생성할 수 있다.
		Calendar[] list6 = new Calendar[3];
		list6[0] = Calendar.getInstance();
		System.out.printf("%tF\n", list6[0]);

	}

	private static void m3() {

		// 요구사항] int 숫자 -> 1~10까지 저장

		int[] num = new int[10];
		// int num2[] = new int[10];

		// 배열안의 방 10개 -> 숫자 대입
		// 배열 탐색
		for (int i = 0; i < num.length; i++) {
			num[i] = i + 1;
		}

		// 출력
		System.out.println(num[0]);
		System.out.println(num[1]);
		System.out.println(num[2]);

		System.out.println(num[9]); // length - 1

		// java.lang.ArrayIndexOutOfBoundsException: Index 10 out of bounds for length
		// 10
		// System.out.println(num[10]); //존재안함

		for (int i = 0; i < num.length; i++) {
			System.out.printf("num[%d] = %d\n", i, num[i]);
		}

	}

	private static void m2() {

		// 배열 사용
		// m1() -> 개선 -> m2()

		// 요구사항] 학생 3명 > 국어 점수 > 총점, 평균
		// 수정사항] 학생 수 증가 > 500명 > 10000명

		// 1. 배열 만들기(선언하기)
		// - 자료형[] 배열명 = new 자료형[길이];

		int[] kor = new int[10000]; // 이득 발생

		kor[0] = 100; // 경우에 따라 이득 발생
		kor[1] = 90;
		kor[2] = 80;
		// ..
		kor[499] = 100;

		// int total = kor[0] + kor[1] + kor[2];
		int total = 0;

		for (int i = 0; i < kor.length; i++) {
			total += kor[i];
		}

		double avg = (double) total / kor.length;

		System.out.printf("총점: %d점, 평균: %.1f점\n", total, avg);

	}

	private static void m1() {

		// 요구사항] 학생 3명 > 국어 점수 > 총점, 평균
		// 수정사항] 학생 수 증가 > 500명
		int kor1;
		int kor2;
		int kor3;
		// +497

		kor1 = 100;
		kor2 = 90;
		kor3 = 80;
		// +497

		int total = kor1 + kor2 + kor3; // +497
		double avg = total / 3.0; // 3 -> 500

		System.out.printf("총점: %d점, 평균: %.1f점\n", total, avg);

	}

}
