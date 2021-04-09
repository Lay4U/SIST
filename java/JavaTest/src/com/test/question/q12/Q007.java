package com.test.question.q12;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Q007 {
	public static void main(String[] args) throws NumberFormatException, IOException {
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		System.out.print("종료할 숫자를 입력하세요 : ");
		int numExit = Integer.parseInt(reader.readLine());
		int sum = 0;
		String str = "";
		for (int i = 1;; i++) {
			if (sum + i < numExit) {
				str += i + " + ";
				sum += i;
			} else {
//				System.out.print("\b\b  "); //eclipse에서 한글 깨짐 오류 +를 삭제해야 하는데 못하고 있다. string의 substring이용
				break;
			}

		}
		System.out.print(str.substring(0, str.length() - 3));
		System.out.printf(" = %d", sum);
	}
}
