package com.test.question.q16;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Q010 {

	public static void main(String[] args) throws NumberFormatException, IOException {
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		System.out.print("홀수 입력 : ");
		int n = Integer.parseInt(reader.readLine());
//		int n = 3;
		int arr[][] = new int[n][n];
//		int row = (int) (Math.random() * n);
//		int col = (int) (Math.random() * n);
		int row = 0;
		int col = n / 2;
		// row, col 을 0,n/2로 하면 완성되지만 난수로하면 대각선 오류

//		System.out.println(row + " " + col);
// (0,0)->(2,1) (0,1) -> (2, 2)
		for (int cnt = 1; cnt <= n * n; cnt++) {
//			System.out.println(row + " " + col);
			arr[row][col] = cnt;

			if (cnt % n == 0) {
				row++;
			} else {
				row--;
				col++;
			}

			if (row < 0)
				row = n - 1;
			if (row >= n)
				row = 0;
			if (col < 0)
				col = n - 1;
			if (col >= n)
				col = 0;

//			output(arr);
//			System.out.println(row + " " + col);
//			System.out.println();
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
