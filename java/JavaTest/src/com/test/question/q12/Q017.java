package com.test.question.q12;

public class Q017 {
	public static void main(String[] args) {
		int cnt;
		String str = "";
		for (int i = 2; i <= 100; i++) {
			cnt = 0;
			for (int j = 2; j <= 100; j++)
//				if (i % j == 0 || i==j)
				if (i % j == 0) {
//					System.out.println(i+" "+j);
					cnt++;
				}
			if(cnt == 1)
				str+=i + ", ";
		}
		System.out.println(str.substring(0, str.length()-2));
	}
}
