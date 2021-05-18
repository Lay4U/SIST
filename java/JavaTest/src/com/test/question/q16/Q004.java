package com.test.question.q16;

public class Q004 {
	public static void main(String[] args) {
		int n = 5;
		int[][] arr = new int[n][n];
		int cnt=1;
		
		for(int i=0; i<arr.length; i++) {
			for(int j=0; j<5-i; j++) {
				arr[i][j] = cnt++;
			}
		}//exit for
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
