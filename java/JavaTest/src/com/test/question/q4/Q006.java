package com.test.question.q4;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Q006 {
	public static void main(String[] args) throws NumberFormatException, IOException {
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		System.out.print("국어 : ");
		int korScore = Integer.parseInt(reader.readLine());
		System.out.print("영어 : ");
		int engScore = Integer.parseInt(reader.readLine());
		System.out.print("수학 : ");
		int mathScore = Integer.parseInt(reader.readLine());

		String tmp = test(korScore, engScore, mathScore);
		System.out.println(tmp + "입니다.");
	}

	public static String test(int num1, int num2, int num3) {
		int score = (num1 + num2 + num3) / 3;
		String res = score >= 60 ? "합격" : "불합격";
		return res;
	}
}
