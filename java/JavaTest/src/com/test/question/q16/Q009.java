package com.test.question.q16;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Q009 {

	public static void main(String[] args) throws NumberFormatException, IOException {
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		System.out.print("행렬의 수(NxN) n : ");
		int n = Integer.parseInt(reader.readLine());

		int[][] spiralArray = new int[n][n];
		int numConcentric = (int) Math.ceil((n) / 2.0);

		int j;
		int wallLen = n;
		int currNum = 1;

		for (int i = 0; i < numConcentric; i++) {
			// 위
			for (j = 0; j < wallLen; j++) {
				spiralArray[i][i + j] = currNum++;
//				System.out.println(i + " " + (i + j));
			}

			// 오른쪽
			for (j = 1; j < wallLen; j++) {
				spiralArray[i + j][n - 1 - i] = currNum++;
//				System.out.println((i+j) + " " + (n-1-i));
			}

			// 아래
			for (j = wallLen - 2; j > -1; j--) {
				spiralArray[n - 1 - i][i + j] = currNum++;
//				System.out.println((n-1-i) + " " + (i + j));
			}

			// 왼쪽
			for (j = wallLen - 2; j > 0; j--) {
				spiralArray[i + j][i] = currNum++;
//				System.out.println((i+j) + " " + i);
			}
			wallLen -= 2;
		}
		output(spiralArray);
	}

	private static void output(int[][] arr) {
		for (int i = 0; i < arr.length; i++) {
			for (int j = 0; j < arr.length; j++) {
				System.out.printf("%3d ", arr[i][j]);
			}
			System.out.println();
		}
	}
//	(0, 0)
//	(0, 1)
//	(0, 2)
//	(0, 3)
//	(0, 4)
//	(1, 4)
//	(2, 4)
//	(3, 4)
//	(4, 4)
//	(4, 3)
//	(4, 2)
//	(4, 1)
//	(4, 0)
//	(3, 0)
//	(2, 0)
//	(1, 0)
//	(1, 1)
//	(1, 2)
//	(1, 3)
//	(2, 3)
//	(3, 3)
//	(3, 2)
//	(3, 1)
//	(2, 1)
//	(2, 2)

}