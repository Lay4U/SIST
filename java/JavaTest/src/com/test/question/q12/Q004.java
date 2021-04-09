package com.test.question.q12;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Q004 {
	public static void main(String[] args) throws NumberFormatException, IOException {
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		System.out.print("입력하실 숫자의 개수 : ");
		int sizeNum = Integer.parseInt(reader.readLine());
//		int[] num = new int[sizeNum];
//
//		for (int i = 0; i < sizeNum; i++) {
//			System.out.print("숫자 : ");
//			num[i] = Integer.parseInt(reader.readLine());
//		}
//
//		int sumEven = 0;
//		int sumOdd = 0;
//		for (int i = 0; i < sizeNum; i++) {
//			if (num[i] % 2 == 0)
//				sumEven += num[i];
//			else
//				sumOdd += num[i];
//		}
		int sumEven =0;
		int sumOdd = 0;
		int num = 0;
		for(int i=0; i<sizeNum; i++) {
			System.out.print("숫자 : ");
			num = Integer.parseInt(reader.readLine());
			
			if(num % 2 == 0)
				sumEven += num;
			else
				sumOdd += num;
		}
		System.out.printf("짝수의 합 : %,d\n", sumEven);
		System.out.printf("홀수의 합 : %,d\n", sumOdd);

	}
}
