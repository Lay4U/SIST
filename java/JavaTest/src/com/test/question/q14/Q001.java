package com.test.question.q14;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Q001 {
	public static void main(String[] args) throws IOException {
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		System.out.print("문장 입력 : ");
		String str = reader.readLine();
		String res = "";
		for(int i=str.length()-1; i>=0 ; i--) {
			res += str.charAt(i);
		}
		System.out.println(res);
	}
}
