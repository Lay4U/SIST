package com.test.question.q16;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Q010 {

	public static void main(String[] args) throws NumberFormatException, IOException {
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		System.out.print("홀수 입력 :");
		int n = Integer.parseInt(reader.readLine());
		int arr[][] = new int[n][n];
		int a = 1;
		int row = 0, col = n / 2;

		for (a = 1; a <= (n * n); a++) {
			arr[row][col] = a;
			if (a % n == 0) {
				row++;
			} else {
				row--;
				col--;
				if (row < 0)
					row = n - 1;
				else if (col < 0)
					col = n - 1;
			}
		}
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
