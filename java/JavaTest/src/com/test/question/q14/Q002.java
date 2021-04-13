package com.test.question.q14;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Q002 {
	public static void main(String[] args) throws IOException {
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		System.out.print("이메일 : ");
		String email = reader.readLine();

		String id = "";
		String domain = "";
		if (email.indexOf("@") == -1) {
			System.out.println("올바른 이메일 형식을 입력해주세요");
			return;
		}
		id = email.substring(0, email.indexOf("@"));
		domain = email.substring(email.indexOf("@") + 1);

		System.out.println("아이디 : " + id);
		System.out.println("도메인 : " + domain);
	}
}
