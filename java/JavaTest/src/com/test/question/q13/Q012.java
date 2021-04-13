package com.test.question.q13;

public class Q012 {
	public static void main(String[] args) {

		String str = "";
		for (int i = 1; i <= 100; i++) {
			int sum = 0;
			for (int j = 1; j <= i; j++) {
				if (i % j == 0) {
					sum += j;
				}
			}

			if (sum - i == i) {
				str += i + " = [";
				for (int j = 1; j <= i; j++) {
					if (i % j == 0 && i != j) {
						str += j + ", ";
					}
				}
				str = str.substring(0, str.length() - 2);
				str += "]";
//					System.out.println(i);
				System.out.println(str);
				str = "";
			}

		}
	}
}