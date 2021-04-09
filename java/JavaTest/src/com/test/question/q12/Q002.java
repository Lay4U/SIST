package com.test.question.q12;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Q002 {
	public static void main(String[] args) throws NumberFormatException, IOException {
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		System.out.print("시작 숫자 : ");
		int startNum = Integer.parseInt(reader.readLine());
		System.out.print("종료 숫자 : ");
		int endNum = Integer.parseInt(reader.readLine());
		System.out.print("증가치 : ");
		int increment = Integer.parseInt(reader.readLine());

		for (int i = startNum; i <= endNum; i += increment) {
			System.out.println(i);
		}
	}
}
