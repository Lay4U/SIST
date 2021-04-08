package com.test.question.q11;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Q002 {
	public static void main(String[] args) throws NumberFormatException, IOException {
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		System.out.print("점수 : ");
		int score = Integer.parseInt(reader.readLine());

		if (score >= 0 && score <= 100) {
			if (score >= 90) {
				System.out.printf("입력한 %d점은 성적 %c입니다.\n", score, 'A');
			}
			else if (score >= 80) {
				System.out.printf("입력한 %d점은 성적 %c입니다.\n", score, 'B');
			}
			else if (score >= 70) {
				System.out.printf("입력한 %d점은 성적 %c입니다.\n", score, 'C');
			}
			else if (score >= 60) {
				System.out.printf("입력한 %d점은 성적 %c입니다.\n", score, 'D');
			} else {
				System.out.printf("입력한 %d점은 성적 %c입니다.\n", score, 'F');
			}
		} else {
			System.out.println("잘못된 점수를 입력하셨습니다.\n");
		}
	}
}
