package com.test.question.q14;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Q012 {
	public static void main(String[] args) throws IOException {
//		String input = " 10 % 2 ";
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		String input = reader.readLine();

		input = input.trim().replace(" ", "");
//		System.out.println(input);
		int idx = 0;
		char op = 0;
		
		//아래 문장 switch는 불가능?
		if (input.indexOf("+") > -1) {
			idx = input.indexOf("+");
			op = input.charAt(idx);
		} else if (input.indexOf("-") > -1) {
			idx = input.indexOf("-");
			op = input.charAt(idx);
		} else if (input.indexOf("*") > -1) {
			idx = input.indexOf("*");
			op = input.charAt(idx);
		} else if (input.indexOf("/") > -1) {
			idx = input.indexOf("/");
			op = input.charAt(idx);
		} else if (input.indexOf("%") > -1) {
			idx = input.indexOf("%");
			op = input.charAt(idx);
		} else {
			System.out.println("지원하지 않는 연산입니다.");
		}

//		System.out.println(input.substring(0, idx));
//		System.out.println(input.substring(idx + 1));
		int num1 = Integer.parseInt(input.substring(0, idx));
		int num2 = Integer.parseInt(input.substring(idx + 1));
		switch (op) {
			case '+':
				System.out.printf("%d + %d = %d", num1, num2, num1 + num2);
				break;
			case '-':
				System.out.printf("%d - %d = %d", num1, num2, num1 - num2);
				break;
			case '*':
				System.out.printf("%d * %d = %d", num1, num2, num1 * num2);
				break;
			case '/':
				System.out.printf("%d / %d = %.1f", num1, num2, (double) num1 / num2);
				break;
			case '%':
				System.out.printf("%d %% %d = %d", num1, num2, num1 % num2);
				break;
		}
	}
}
