package com.test.question.q4;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Q004 {
	public static void main(String[] args) throws NumberFormatException, IOException {

		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		System.out.print("첫번째 숫자: ");
		int num1 = Integer.parseInt(reader.readLine());
		System.out.print("두번째 숫자: ");
		int num2 = Integer.parseInt(reader.readLine());

		int result = add(num1, num2);
		System.out.printf("%d + %d = %d\n", num1, num2, result);
		result = add(num1, num1);
		System.out.printf("%d + %d = %d\n", num1, num2, result);
		System.out.println();
		
		result = subtract(num1, num2);
		System.out.printf("%d - %d = %d\n", num1, num2, result);
		System.out.println();
		
		result = multiply(num1, num2);
		System.out.printf("%d * %d = %d\n", num1, num2, result);
		result = multiply(num1, num1);
		System.out.printf("%d * %d = %d\n", num1, num1, result);
		System.out.println();
		
		double res;
		res = divide(num1, num2);
		System.out.printf("%d / %d = %.1f\n", num1, num2, res);
		res = divide(num2, num1);
		System.out.printf("%d / %d = %.1f\n", num2, num1, res);
		System.out.println();
		
		result = mod(num1, num2);
		System.out.printf("%d %% %d = %d\n", num1, num2, result);
		result = mod(num2, num1);
		System.out.printf("%d %% %d = %d\n", num2, num1, result);
		System.out.println();
	}
	//return을 숫자로 던지는데 출력양식을 return된 값만으로 구성할 수 없다.
	//함수의 기능에 맞게 연산기능만 넣는ㄷ.
	public static int add(int num1, int num2) {
		return num1 + num2;
	}

	public static int subtract(int num1, int num2) {
		return num1 - num2;
	}

	public static int multiply(int num1, int num2) {
		return num1 * num2;
	}

	public static double divide(int num1, int num2) {
		return (double) num1 / num2;
	}

	public static int mod(int num1, int num2) {
		return num1 % num2;
	}
}
