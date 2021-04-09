package com.test.question.q12;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Q010 {
	public static void main(String[] args) throws NumberFormatException, IOException {
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		System.out.print("최대 숫자를 입력하세요 : ");
		int numExit = Integer.parseInt(reader.readLine());

		int sum = 0;
		String str = "";
		while (true) {

			System.out.print("숫자 : ");
			int n = Integer.parseInt(reader.readLine());

			if (n % 2 == 0) {
//				System.out.printf("%d + ", n);
				str += n + " + ";
				sum += n;
			} else {
//				System.out.printf("%d - ", n);
				str += n + " - ";
				sum -= n;
			}

			if (sum > numExit)
				break;
		}
		str = str.substring(0, str.length() - 3);
		System.out.println(str + " = " + sum);
	}
}
