package com.test.question.q3;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Q007 {
	public static void main(String[] args) throws NumberFormatException, IOException {
		// ℃
		System.out.print("섭씨(°C) : ");
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		double Celsius = Double.parseDouble(reader.readLine());
		System.out.println();

		double fahrenheit = Celsius * 1.8 + 32;
		System.out.printf("섭씨 %.1f°C는 화씨 %.1f°F입니다.\n", Celsius, fahrenheit);

	}
}
