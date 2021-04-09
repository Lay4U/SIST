package com.test.question.q12;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Q019 {
	public static void main(String[] args) throws NumberFormatException, IOException {
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		System.out.print("첫번째 숫자 : ");
		int num1 = Integer.parseInt(reader.readLine());
		System.out.print("두번째 숫자 : ");
		int num2 = Integer.parseInt(reader.readLine());

		String str = "";
		System.out.printf("%d의 약수 : ", num1);
		for (int i = 1; i <= num1; i++)
			if (num1 % i == 0)
				str += i + ", ";
		System.out.print(str.substring(0, str.length() - 2));

		System.out.println();

		str = "";
		System.out.printf("%d의 약수 : ", num2);
		for (int i = 1; i <= num2; i++)
			if (num2 % i == 0)
				str += i + ", ";
		System.out.print(str.substring(0, str.length() - 2));

		System.out.println();

		str = "";
		System.out.printf("%d와 %d의 공약수 : ", num1, num2);
		for (int i = 1; i<= Math.max(num1, num2); i++)
			if(num1 % i == 0 && num2 % i == 0)
				str += i + ", ";
		System.out.print(str.substring(0, str.length() - 2));
	}
}
