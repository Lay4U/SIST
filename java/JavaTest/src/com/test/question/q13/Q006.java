package com.test.question.q13;

public class Q006 {
	public static void main(String[] args) {
		for (int i = 0; i < 2; i++) {
			for (int j = 1; j <= 9; j++) {
				for (int k = 2 + (i * 4); k <= 5 + (i * 4); k++) {
					System.out.printf("%d x %d = %d\t", k, j, k * j);
				}
				System.out.println();
			}
			System.out.println();
		}
	}
}
//public class Q006 {
//	public static void main(String[] args) {
//		for (int i = 0; i < 2; i++) {
//			if (i == 0) {
//				for (int j = 1; j <= 9; j++) {
//					for (int k = 2; k <= 5; k++) {
//						System.out.printf("%d x %d = %d\t", k, j, k * j);
//					}
//					System.out.println();
//				}
//			}
//			if (i == 1) {
//				System.out.println();
//				for (int j = 1; j <= 9; j++) {
//					for (int k = 6; k <= 9; k++) {
//						System.out.printf("%d x %d = %d\t", k, j, k * j);
//					}
//					System.out.println();
//				}
//			}
//		}
//	}
//}
