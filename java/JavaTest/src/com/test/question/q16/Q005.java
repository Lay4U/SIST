package com.test.question.q16;

public class Q005 {
	public static void main(String[] args) {
		int n = 5;
		int[][] arr = new int[n][n];
		int cnt = 1;
		for (int i = 0; i <= arr.length / 2; i++) {
			for (int j = arr.length / 2 - i; j <= i + 2; j++) { //210 == arr.length(5) / 2 - i 210
				// i=0일때 j는 2, i=1일때 j는 123, i=2일때 j는 01234
				arr[i][j] = cnt++;
				System.out.printf("%d %d\n", i, j);
			}
		} // exit for
		int ctrl = arr.length / 2 + 1; 
		for (int i = arr.length / 2 + 1; i < arr.length; i++) {
//			for(int j=i-2, ctrl=arr.length/2+1; j<=ctrl;j++) {
			for (int j = i - 2; j <= ctrl; j++) {
				// i=3 j=123, i=4 j=2
				arr[i][j] = cnt++;
//				System.out.printf("%d %d\n", i, j);
			}
			ctrl--;
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