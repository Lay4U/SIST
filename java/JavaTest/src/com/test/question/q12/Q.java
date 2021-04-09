package com.test.question.q12;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Q {

	public static void main(String[] args) throws IOException {
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));

		System.out.printf("종료값: ");
		int end = Integer.parseInt(reader.readLine());

		int sum = 0;

		for (int i = 1;; i++) {

			sum += i;

			if (i == end || sum >= end) {

				System.out.printf("%d = %d", end, sum);

				break;

			} else {

				System.out.printf("%d + ", i);

			}
		} // for문

	}// main

} // 마지막에 결과값 오류!!!!!!