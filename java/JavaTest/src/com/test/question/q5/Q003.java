package com.test.question.q5;

public class Q003 {
	public static void main(String[] args) {
		int count = positive(10);
		System.out.println("양수 : " + count + "개");
		count = positive(10, 20);
		System.out.println("양수 : " + count + "개");
		count = positive(10, 20, -30);
		System.out.println("양수 : " + count + "개");
		count = positive(10, 20, -30, 40);
		System.out.println("양수 : " + count + "개");
		count = positive(10, 20, -30, 40, 50);
		System.out.println("양수 : " + count + "개");
	}

	public static int positive(int n1) {
		int cnt = 0;
		cnt = (n1 > 0) ? ++cnt : cnt;
		return cnt;
	}

	public static int positive(int n1, int n2) {
		int cnt = 0;
		cnt = (n1 > 0) ? ++cnt : cnt;
		cnt = (n2 > 0) ? ++cnt : cnt;
		return cnt;
	}

	public static int positive(int n1, int n2, int n3) {
		int cnt = 0;
		cnt = (n1 > 0) ? ++cnt : cnt;
		cnt = (n2 > 0) ? ++cnt : cnt;
		cnt = (n3 > 0) ? ++cnt : cnt;
		return cnt;
	}

	public static int positive(int n1, int n2, int n3, int n4) {
		int cnt = 0;
		cnt = (n1 > 0) ? ++cnt : cnt;
		cnt = (n2 > 0) ? ++cnt : cnt;
		cnt = (n3 > 0) ? ++cnt : cnt;
		cnt = (n4 > 0) ? ++cnt : cnt;
		return cnt;
	}

	public static int positive(int n1, int n2, int n3, int n4, int n5) {
		int cnt = 0;
		cnt = (n1 > 0) ? ++cnt : cnt;
		cnt = (n2 > 0) ? ++cnt : cnt;
		cnt = (n3 > 0) ? ++cnt : cnt;
		cnt = (n4 > 0) ? ++cnt : cnt;
		cnt = (n5 > 0) ? ++cnt : cnt;
		return cnt;
	}

}
