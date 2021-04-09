package com.test.question.q12;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Q006 {
	public static void main(String[] args) throws NumberFormatException, IOException {
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		System.out.print("시작 숫자를 입력하세요 : ");
		int startNum = Integer.parseInt(reader.readLine());
		System.out.print("종료 숫자를 입력하세요 : ");
		int endNum = Integer.parseInt(reader.readLine());

		int sum = 0;
		for (int i = startNum; i <= endNum; i++) {
			if (i == endNum)
				System.out.printf("%,d ", i);
			else {
				if (i % 2 == 0) {
					System.out.printf("%,d + ", i);
					sum += i;
				} else if (i % 2 == 1) {
					System.out.printf("%,d - ", i);
					sum -= i;
				}
			}
		}
		System.out.printf("= %,d\n", sum);
	}
}
