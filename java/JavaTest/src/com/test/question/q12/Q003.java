package com.test.question.q12;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Q003 {
	public static void main(String[] args) throws NumberFormatException, IOException {
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		System.out.print("숫자 : ");
		int inNum = Integer.parseInt(reader.readLine());
		int sum = 0;
		for (int i = 0; i <= inNum; i++)
			sum += i;
		System.out.printf("1 ~ %,d = %,d", inNum, sum);
	}
}
