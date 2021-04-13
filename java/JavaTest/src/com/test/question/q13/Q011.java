package com.test.question.q13;

public class Q011 {
	public static void main(String[] args) {
		int cnt;
		String str = "";
		for (int i = 2; i <= 100; i++) {
			cnt = 0;

			for (int j = 2; j <= i; j++)
				if (i % j == 0) {
//					System.out.println("i " + " j ="+ i+ " " + j);
//					System.out.println("cnt : " + cnt );
					cnt++;
				}
			if (cnt == 1)
				str += i + ", ";
		}
		System.out.println(str.substring(0, str.length() - 2));
//		System.out.println(str);
	}
}