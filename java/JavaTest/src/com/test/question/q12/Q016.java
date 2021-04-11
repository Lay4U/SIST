package com.test.question.q12;

// 1 + 1 + 2 + 3 + 5 + 8
public class Q016 {
	public static void main(String[] args) {
		int n1 = 0;
		int n2 = 1;
		int n3 = 0;
		int sum = 1;
		String str = "1 + ";
		for (int i = 0; i < 100; i++) {

			n3 = n1 + n2;
			n1 = n2;
			n2 = n3;
			sum += n3;
			if (n3 > 100) {
				sum -= n3;
				break;
			}
			str+=n3 + " + ";
		}
		System.out.println(str.substring(0, str.length()-3) + " = " + sum);
	}
}
