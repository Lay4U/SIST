package com.test.question.q13;

public class Q008 {
	public static void main(String[] args) {
		int sum = 0;
		int j = 0;
		for (int i = 1; i < 100; i += 10) {
			for (j = i; j < i + 10; j++) {
				sum += j;
			}
			System.out.printf("%d ~ %d : %d\n", i, j-1, sum);
			sum = 0;
		}
	}
}
