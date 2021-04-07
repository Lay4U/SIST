package com.test.question.q6;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Calendar;

public class Q003 {
	public static void main(String[] args) throws NumberFormatException, IOException {
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		System.out.print("태어난 년도 : ");
		int birthYear = Integer.parseInt(reader.readLine());

		Calendar now = Calendar.getInstance();
		int age = now.get(Calendar.YEAR) - birthYear + 1;
		System.out.println("나이 : " + age + "세");
	}
}
