package com.test.question.q16;

public class Q006 {
	public static void main(String[] args) {
		int n = 5;
		int[][] arr = new int[n][n];
		int cnt = 1;
		int sum = 0;
		for (int i = 0; i < arr.length - 1; i++) {
			for (int j = 0; j < arr[i].length - 1; j++) {
				arr[i][j] = cnt++;
			}
		}
//		for (int i = 0; i < arr.length - 1; i++) 
//			for (int j = 0; j < arr.length - 1; j++)
//				System.out.println(arr[i][j]);
		int j=0;
		for(int i=0; i<arr.length-1;i++) {
			for(j=0; j<arr[i].length-1; j++) {
				sum+=arr[i][j];
				if(j==arr.length-2) {
					arr[i][j+1] = sum;
					sum=0;
				}
			}
		}
		for(int i=0; i<arr.length-1;i++) {
			for(j=0; j<arr[i].length-1; j++) {
				sum+=arr[j][i];
				if(j==arr.length-2) {
					arr[j+1][i] = sum;
					sum=0;
				}
			}
		}
		for(int i=0; i<arr.length-1;i++) {
			sum += arr[arr.length-1][i];
		}
		arr[arr.length-1][arr.length-1]= sum; 
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
