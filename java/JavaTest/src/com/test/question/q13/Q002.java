package com.test.question.q13;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Q002 {
	public static void main(String[] args) throws NumberFormatException, IOException {
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		System.out.print("행의 갯수 : ");
		int N = Integer.parseInt(reader.readLine());
		for (int i = 0; i < N; i++) {
			for (int j = i; j < N-1; j++) {
				System.out.print(" ");
			}
			for (int j = N-1 - i; j < N; j++) {
				System.out.print("*");
			}
			System.out.println();
		}
	}
}
