package com.test.question.q15;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Q001 {
	public static void main(String[] args) throws NumberFormatException, IOException {
		int[] N = new int[5];
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));

		for (int i = 0; i < N.length; i++) {
			System.out.print("숫자 : ");
			N[i] = Integer.parseInt(reader.readLine());
		}
		System.out.println();
		for (int i = N.length - 1; i >= 0; i--) {
			System.out.printf("num[%d] = %d\n", i, N[i]);
		}
	}
}
