package com.test.question.q16;

public class Q001 {
	public static void main(String[] args) {
		int N = 5;
		int[][] arr = new int[N][N];
		int cnt = 1;
		for (int i = 0; i < arr.length; i++) {
			if (i % 2 == 0) {
				for (int j = 0; j < arr.length; j++) {
					arr[i][j] = cnt;
					cnt++;
				}
			} else if (i % 2 == 1) {
				for (int j = arr.length - 1; j >= 0; j--) {
					arr[i][j] = cnt;
					cnt++;
				}
			}
		} // exit for
		output(arr);
	}

	private static void output(int[][] arr) {
		for (int i = 0; i < arr.length; i++) {
			for (int j = 0; j < arr.length; j++) {
				System.out.printf("%3d ", arr[i][j]);
			}
			System.out.println();
		}
	}
}
