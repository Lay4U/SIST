package com.test.review.q3_4;

public class Q5_3 {

	public static void main(String[] args) {

		int count = positive(10);

		System.out.printf("양수 : %d개\n", count);

		count = positive(10, 20);

		System.out.printf("양수 : %d개\n", count);

		count = positive(10, 20, -30);

		System.out.printf("양수 : %d개\n", count);

		count = positive(10, 20, 40, -30);

		System.out.printf("양수 : %d개\n", count);

		count = positive(10, 20, -30, 40, 50);

		System.out.printf("양수 : %d개\n", count);

	}// main

	public static int result(int n) {
		int temp = n >= 0 ? 1 : 0;
		return temp;
	}

	public static int positive(int n1) {

		return result(n1);

	}

	public static int positive(int n1, int n2) {

		return result(n1) + result(n2);

	}

	public static int positive(int n1, int n2, int n3) {

		return result(n1) + result(n2) + result(n3);
	}

	public static int positive(int n1, int n2, int n3, int n4) {

		return result(n1) + result(n2) + result(n3) + result(n4);
	}

	public static int positive(int n1, int n2, int n3, int n4, int n5) {

		return result(n1) + result(n2) + result(n3) + result(n4) + result(n5);
	}
//	public static int positive(int n1, int n2, int n3, int n4, int n5) {
//		int cnt = 0;
//		cnt = (n1 > 0) ? ++cnt : cnt;
//		cnt = (n2 > 0) ? ++cnt : cnt;
//		cnt = (n3 > 0) ? ++cnt : cnt;
//		cnt = (n4 > 0) ? ++cnt : cnt;
//		cnt = (n5 > 0) ? ++cnt : cnt;
//		return cnt;
//	}
//		이렇게 작성하면 가독성이 높아지지 않을까?

}// class
/*
 * 함수 스택이 2번 쌓인다. -> 성능에 저하가 오지 않을까?
 * 
 * 
 */
