package com.test.question.q11;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Q003 {
	public static void main(String[] args) throws IOException {
		System.out.print("문자 : ");
		char chr = (char) System.in.read();

		if (chr == 'f' || chr == 'F') {
			System.out.println("Father");
		} else if (chr == 'm' || chr == 'M') {
			System.out.println("Mother");
		} else if (chr == 's' || chr == 'S') {
			System.out.println("Sister");
		} else if (chr == 'b' || chr == 'B') {
			System.out.println("Brother");
		}
		else {
			System.out.println("처리할 수 없는 문자입니다.\n현재 f, m, s, b, F, M, S, B만 처리 가능합니다.");
		}

	}
}
