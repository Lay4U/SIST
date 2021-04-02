package com.test.question.q3;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Q001 {
	public static void main(String[] args) throws NumberFormatException, IOException {
		System.out.print("태어난 년도 : ");
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		int birthYear = Integer.parseInt(reader.readLine());
		System.out.println();

		System.out.println("나이 : " + (2021 - birthYear + 1) + "세");
	}
}
