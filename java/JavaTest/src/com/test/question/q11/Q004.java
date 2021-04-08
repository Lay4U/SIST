package com.test.question.q11;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Q004 {
	public static void main(String[] args) throws NumberFormatException, IOException {
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		System.out.print("근무 년수 : ");
		int workYear = Integer.parseInt(reader.readLine());

		if (workYear < 5) {
			System.out.println("당신은 초급 개발자 입니다.");
			System.out.println("앞으로 " + (5 - workYear) + "년 더 근무하면 중급 개발자가 됩니다.");
		} else if (workYear < 10) {
			System.out.println("당신은 중급 개발자 입니다.");
			System.out.println("당신은 " + (workYear - 4) + "년 전까지 초급 개발자였습니다.");
			System.out.println("앞으로 " + (10 - workYear) + "년 더 근무하면 중급 개발자가 됩니다.");
		} else if (workYear >= 10) {
			System.out.println("당신은 고급 개발자 입니다.");
			System.out.println("당신은 " + (workYear - 9) + "년 전까지 중급 개발자였습니다.");
		} else {
			System.out.println("잘못된 입력입니다.");
		}
	}
}
