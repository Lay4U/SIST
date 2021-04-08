package com.test.question.q11;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Q007 {
	public static void main(String[] args) throws NumberFormatException, IOException {
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		System.out.print("숫자 입력 : ");
		int num1 = Integer.parseInt(reader.readLine());
		System.out.print("숫자 입력 : ");
		int num2 = Integer.parseInt(reader.readLine());
		System.out.print("숫자 입력 : ");
		int num3 = Integer.parseInt(reader.readLine());
		System.out.print("숫자 입력 : ");
		int num4 = Integer.parseInt(reader.readLine());
		System.out.print("숫자 입력 : ");
		int num5 = Integer.parseInt(reader.readLine());

		int numOdd = 0;
		int numEven = 0;

//		numOdd = num1 % 2 == 1 ? ++numOdd : numOdd;
//		numOdd = num2 % 2 == 1 ? ++numOdd : numOdd;
//		numOdd = num3 % 2 == 1 ? ++numOdd : numOdd;
//		numOdd = num4 % 2 == 1 ? ++numOdd : numOdd;
//		numOdd = num5 % 2 == 1 ? ++numOdd : numOdd;
//
//		numEven = num1 % 2 == 0 ? ++numEven : numEven;
//		numEven = num2 % 2 == 0 ? ++numEven : numEven;
//		numEven = num3 % 2 == 0 ? ++numEven : numEven;
//		numEven = num4 % 2 == 0 ? ++numEven : numEven;
//		numEven = num5 % 2 == 0 ? ++numEven : numEven;

		if (num1 % 2 == 0) {
			numEven++;
		} else {
			numOdd++;
		}
		
		if (num2 % 2 == 0) {
			numEven++;
		} else {
			numOdd++;
		}
		
		if (num3 % 2 == 0) {
			numEven++;
		} else {
			numOdd++;
		}
		
		if (num4 % 2 == 0) {
			numEven++;
		} else {
			numOdd++;
		}
		
		if (num5 % 2 == 0) {
			numEven++;
		} else {
			numOdd++;
		}
		
		System.out.printf("짝수는 %d개 홀수는 %d개 입력했습니다.\n", numEven, numOdd);
		if(numEven > numOdd) {
			System.out.printf("짝수가 홀수보다 %d개 더 많습니다.\n", numEven - numOdd);
		} else if(numEven < numOdd) {
			System.out.printf("홀수가 짝수보다 %d개 더 많습니다.", numOdd - numEven);
		}
		// 추가조건은 enum 활용하자...
	}
}

//접근방법 및 장단점 얘기해서 정리
