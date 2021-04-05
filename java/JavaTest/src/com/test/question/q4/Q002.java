package com.test.question.q4;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Q002 {
	public static void main(String[] args) throws IOException {
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		System.out.print("이름 : ");
		String name = reader.readLine();
		name = getName(name);
		System.out.printf("고객 : %s\n", name);
	}

	public static String getName(String name) {
		return name + "님";
	}
}
