package com.test.question.q3;

import java.io.IOException;

public class Q006 {
	public static void main(String[] args) throws IOException {
		System.out.print("소문자 입력 : ");
		int inputAlphabet = System.in.read();
		System.out.println();

		System.out.printf("소문자 '%c'의 대문자는 '%c'입니다.", inputAlphabet, inputAlphabet - 32);
	}
}
