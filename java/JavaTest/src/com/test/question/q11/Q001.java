package com.test.question.q11;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Q001 {
	public static void main(String[] args) throws NumberFormatException, IOException {
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));

		System.out.print("첫번째 숫자 : ");
		int num1 = Integer.parseInt(reader.readLine());

		System.out.print("두번째 숫자 : ");
		int num2 = Integer.parseInt(reader.readLine());

		if (num1 > Integer.MIN_VALUE && num1 < Integer.MAX_VALUE 
				&& num2 > Integer.MIN_VALUE && num2 < Integer.MAX_VALUE) {
			if (num1 > num2) {
				System.out.printf("큰수는 %,d이고 , 작은수는 %,d입니다.\n", num1, num2);
				System.out.printf("입력한 두 숫자는 %d의 차이가 납니다.\n", num1 - num2);
			} else if (num1 < num2) {
				System.out.printf("큰수는 %,d이고 , 작은수는 %,d입니다.\n", num2, num1);
				System.out.printf("입력한 두 숫자는 %d의 차이가 납니다.\n", num2 - num1);
			} else
				System.out.println("두 수는 서로 같습니다.\n");
		} else
			System.out.println("잘못된 입력입니다.\n");
	}
}
