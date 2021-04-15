package com.test.question.q15;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Q002 {
	public static void main(String[] args) throws NumberFormatException, IOException {
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		int N = 0;
		System.out.print("학생 수 :");
		N = Integer.parseInt(reader.readLine());

		String[] student = new String[N];

		for (int i = 0; i < N; i++) {
			System.out.print("학생명 : ");
			student[i] = reader.readLine();
		}
		System.out.println();
		System.out.println("입력한 학생은 총 " + N + "명입니다.");
		int cnt = 1;
		for (int i = N - 1; i >= 0; i--) {
			System.out.printf("%d. %s\n", cnt, student[i]);
			cnt++;
		}

	}
}
