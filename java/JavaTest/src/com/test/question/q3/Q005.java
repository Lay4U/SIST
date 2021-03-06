package com.test.question.q3;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Q005 {
	public static void main(String[] args) throws NumberFormatException, IOException {
		System.out.print("한달 수입 금액(원) : ");
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		int income = Integer.parseInt(reader.readLine());
		System.out.println();

		final double taxRate = 0.033;
		int tax = (int) (income * taxRate);
		System.out.printf("세후 금액(원) : %,d원\n", income - tax);
		System.out.printf("세금(원) : %,d원\n", tax);
	}
}
