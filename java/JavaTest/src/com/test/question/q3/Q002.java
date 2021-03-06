package com.test.question.q3;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Q002 {
	public static void main(String[] args) throws NumberFormatException, IOException {
		System.out.print("첫번째 숫자 : ");
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		int firstNumber = Integer.parseInt(reader.readLine());
		System.out.print("두번째 숫자 : ");
		int secondNumber = Integer.parseInt(reader.readLine());
		System.out.println();
		System.out.printf("%d + %d = %,d\n", firstNumber, secondNumber, firstNumber + secondNumber);
		System.out.printf("%d - %d = %,d\n", firstNumber, secondNumber, firstNumber - secondNumber);
		System.out.printf("%d * %d = %,d\n", firstNumber, secondNumber, firstNumber * secondNumber);
		System.out.printf("%d / %d = %.1f\n", firstNumber, secondNumber, (double) firstNumber / secondNumber);
		System.out.printf("%d %% %d = %,d\n", firstNumber, secondNumber, firstNumber % secondNumber);
	}
}
