package com.test.question.q3;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Q003 {
	public static void main(String[] args) throws NumberFormatException, IOException {
		System.out.print("너비(cm) : ");
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		double width = Double.parseDouble(reader.readLine());
		System.out.print("높이(cm) : ");
		double height = Double.parseDouble(reader.readLine());
		System.out.println();

		System.out.printf("사각형의 넓이는 %.0f㎠ 입니다.\n", width * height);
		System.out.printf("사각형의 둘레는 %.0fcm 입니다.\n", width * 2 + height * 2);
	}
}
