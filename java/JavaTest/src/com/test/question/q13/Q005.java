package com.test.question.q13;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Q005 {
	public static void main(String[] args) throws NumberFormatException, IOException {
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		System.out.print("행의 갯수 : ");
		int N = Integer.parseInt(reader.readLine());

		for (int i = 1; i <= N; i++) {
			for (int j = i; j < N; j++) {
				System.out.print(" ");
			}
			for (int j = 0; j < (i * 2) / 2; j++) {
				System.out.printf("%c", 97 + j);
			}
			for (int j = N - i; j < N; j++) {
				System.out.printf("%c", 96 + N - j);
			}
			System.out.println();
		}
	}
}
//
//public class Q005 {
//	public static void main(String[] args) {
//		for (int i = 1; i <= 5; i++) {
//			for (int j = i; j < 5; j++) {
//				System.out.print(" ");
//			}
////			for(int j=10-(i*2); j<10;j++) {
//			for (int j = 0; j < (i * 2) / 2; j++) {
//				System.out.printf("%c", 97 + j);
//			}
////			for(int j=4; j> 4-i; j--) {
////				System.out.printf("%c", 101-j);
////			}
//			for (int j = 5 - i; j < 5; j++) {
//				System.out.printf("%c", 101 - j);
//			}
//			System.out.println();
//		}
//	}
//}
