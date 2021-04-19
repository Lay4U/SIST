package com.test.question.q16;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Q005 {
	public static void main(String[] args) throws NumberFormatException, IOException {
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		System.out.print("n ? :");
		int n = Integer.parseInt(reader.readLine());
//		int n = 11;
		int[][] arr = new int[n][n];
		int cnt = 1;
		for (int i = 0; i <= arr.length / 2; i++) {
			for (int j = arr.length / 2 - i; j <= i + arr.length / 2; j++) { // 210 == arr.length(5) / 2 - i 210
				// i=0일때 j는 2, i=1일때 j는 123, i=2일때 j는 01234
				arr[i][j] = cnt++;
				System.out.printf("%d %d\n", i, j);
			}
		} // exit for

//		i	j
//		4 	1,2,3,4,5
//		5 	2,3,4,
//		6 	3
//		3 ->3-i 
//		5-> 6-i
//		7-> 9-i
//		9-> 12-i
//		11-> 15-i
//		int ctrl = arr.length / 2 + 1; 
		for (int i = arr.length / 2 + 1; i < arr.length; i++) {
//			for(int j=i-2, ctrl=arr.length/2+1; j<=ctrl;j++) {
			for (int j = i - arr.length / 2; j < 3 * arr.length / 2 - i; j++) {
				arr[i][j] = cnt++;
//				System.out.printf("%d %d\n", i, j);
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
//package com.test.question.q16;
//
//public class Q005 {
//	public static void main(String[] args) {
//		int n = 7;
//		int[][] arr = new int[n][n];
//		int cnt = 1;
//		for (int i = 0; i <= arr.length / 2; i++) {
//			for (int j = arr.length / 2 - i; j <= i + 2; j++) { //210 == arr.length(5) / 2 - i 210
//				// i=0일때 j는 2, i=1일때 j는 123, i=2일때 j는 01234
//				arr[i][j] = cnt++;
//				System.out.printf("%d %d\n", i, j);
//			}
//		} // exit for
//		int ctrl = arr.length / 2 + 1; 
//		for (int i = arr.length / 2 + 1; i < arr.length; i++) {
////			for(int j=i-2, ctrl=arr.length/2+1; j<=ctrl;j++) {
//			for (int j = i - 2; j <= ctrl; j++) {
//				// i=3 j=123, i=4 j=2
//				arr[i][j] = cnt++;
////				System.out.printf("%d %d\n", i, j);
//			}
//			ctrl--;
//		}
//		output(arr);
//	}
//
//	private static void output(int[][] arr) {
//		for (int i = 0; i < arr.length; i++) {
//			for (int j = 0; j < arr.length; j++) {
//				System.out.printf("%3d ", arr[i][j]);
//			}
//			System.out.println();
//		}
//	}
//}