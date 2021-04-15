package com.test.question.q16;

public class Q008 {
	public static void main(String[] args) {
//		(0,0)

//		(0,1)
//		(1,0)

//		(0,2)
//		(1,1)
//		(2,0)

//		(0,3)
//		(1,2)
//		(2,1)
//		(3,0)

//		(0,4)
//		(1,3)
//		(2,2)
//		(3,1)
//		(4,0)
		int n = 5;
		int cnt = 1;
		int[][] arr = new int[n][n];
		for (int i = 0; i < arr.length; i++) {
			for (int j = 0; j <= i; j++) {
				System.out.println(j + " " + (i - j));
				arr[j][i - j] = cnt++;
			}
		}
		System.out.println();
		System.out.println();
//		(1,4)
//		(2,3)
//		(3,2)
//		(4,1)
//		
//		(2,4)
//		(3,3)
//		(4,2)
//		
//		(3,4)
//		(4,3)
		for (int i = 1; i < arr.length - arr.length / 2 +1 ; i++) {
			for(int j=i, k=arr.length-1;j<arr.length; j++, k--) {
				System.out.println(j + " " + (k));
				arr[j][k]= cnt++; 
			}
			System.out.println();
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
