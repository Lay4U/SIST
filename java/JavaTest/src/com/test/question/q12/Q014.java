package com.test.question.q12;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Q014 {
	public static void main(String[] args) throws NumberFormatException, IOException {
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		System.out.print("9자리 숫자 입력 : ");
		int input = Integer.parseInt(reader.readLine());
		int inputLen = String.valueOf(input).length();

		int sumEven = 0;
		int sumOdd = 0;
		for (int i = 1; i <= inputLen; i++) {
			int tmp = (int) (input / Math.pow(10, inputLen - i)); // i자리수
			input -= tmp * Math.pow(10, inputLen - i);
//			System.out.println(tmp);
			if (tmp % 2 == 0)
				sumEven += tmp;
			else
				sumOdd += tmp;
		}
		System.out.println("짝수의 합 : " + sumEven);
		System.out.println("홀수의 합 : " + sumOdd);
	}
}
