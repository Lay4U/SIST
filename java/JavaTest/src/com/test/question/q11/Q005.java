package com.test.question.q11;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Q005 {
	public static void main(String[] args) throws NumberFormatException, IOException {
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		System.out.print("첫번째 숫자 : ");
		int num1 = Integer.parseInt(reader.readLine());
		System.out.print("두번째 숫자 : ");
		int num2 = Integer.parseInt(reader.readLine());
		System.out.print("연산자 : ");
		String oper = reader.readLine();
		System.out.println();

		if (oper.equals("+")) {
			System.out.printf("%d + %d = %d\n", num1, num2, num1 + num2);
		} else if (oper.equals("-")) {
			System.out.printf("%d %c %d = %d\n", num1, oper.charAt(0), num2, num1 - num2);
		} else if (oper.equals("*")) {
			System.out.printf("%d * %d = %d\n", num1, num2, num1 * num2);
		} else if (oper.equals("/")) {
			System.out.printf("%d / %d = %.1f\n", num1, num2, (double) num1 / num2);
		} else if (oper.equals("%")) {
			System.out.printf("%d %% %d = %d\n", num1, num2, num1 % num2);
		} else
			System.out.println("유효하지 않은 연산자입니다. +, -, *, /, %만 지원합니다.");

	}
}
