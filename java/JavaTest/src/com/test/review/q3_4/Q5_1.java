package com.test.review.q3_4;

public class Q5_1 {

	public static void main(String[] args) {

		sum(10);
		sum(10, 20);
		sum(10, 20, 30);
		sum(10, 20, 30, 40);
		sum(10, 20, 30, 40, 50);

	}

	public static void sum(int num1) {

		System.out.printf("%d = %d\n", num1, num1);
	}

	public static void sum(int num1, int num2) {

		System.out.printf("%d + %d = %d\n", num1, num2, num1);
	}

	public static void sum(int num1, int num2, int num3) {

		System.out.printf("%d + %d + %d = %d\n", num1, num2, num3, num1);
	}

	public static void sum(int num1, int num2, int num3, int num4) {

		System.out.printf("%d + %d + %d + %d = %d\n", num1, num2, num3, num4, num1);
	}

	public static void sum(int num1, int num2, int num3, int num4, int num5) {

		System.out.printf("%d + %d + %d + %d + %d= %d\n", num1, num2, num3, num4, num5, num1); // 개행
	} // 개행
	
}

/*
 * num이 좋을까 n이 좋을까?
 * 비슷한 내용 반복을 ... 어떻게 반복 없이 할 수 있을까?
 * 배열을 사용하면 가독성이 높아질거 같다.
 * 
 * 
 */