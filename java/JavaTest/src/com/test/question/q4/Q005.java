package com.test.question.q4;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Q005 {
	public static void main(String[] args) throws NumberFormatException, IOException {
		System.out.print("숫자 : ");
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		int num = Integer.parseInt(reader.readLine());
		System.out.println("입력하신 숫자 " + num + "는(은) \'" + getNumber(num) + "\'입니다");

	}

	public static String getNumber(int num) {
		String str = (num % 2 == 0) ? "짝수" : "홀수";
//		return "입력하신 숫자 " + num +"은(는) \'"+str+"\'입니다";		//		함수 기능에 문자열 포함 X main에서 처리하도록

		return str;
	}
}
