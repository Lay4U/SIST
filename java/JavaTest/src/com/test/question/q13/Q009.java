package com.test.question.q13;

public class Q009 {
	public static void main(String[] args) {
		String str = "";
		int sum = 0;
		for (int i = 0, output = 1;; i++) {
			if (output + i + 1 > 100) {
				break;
			}
			output += i;
			str += output + " + ";
			sum += output;

		}
		System.out.println(str.substring(0, str.length() - 2) + "= " + sum);
	}
}
