package com.test.question.q14;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Q003 {
	public static void main(String[] args) throws IOException {
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		System.out.print("숫자를 입력하세요 : ");
		String str = reader.readLine();
//		String str = "314";
		String output = "";
		int sum = 0;
		for (int i = 0; i < str.length(); i++) {
			output += str.substring(i, i + 1) + " + ";
			sum += Integer.parseInt(str.substring(i, i + 1));
		}
		System.out.println(output.substring(0, output.length() - 2) + "= " + sum);
	}
}

//String에서 한글자씩 가져오는 방법 생각해보기
//package com.test.question.q14;
//
//public class Q003 {
//	public static void main(String[] args) {
//		String str = "314";
////		int cast = Integer.parseInt(str);
////		int sum = 0;
//		System.out.println(str.charAt(0));
//		System.out.println((int)str.charAt(0) + (int)str.charAt(1));
//
////		for(int i=0; i<str.length(); i++) {
////			sum += Integer.parseInt(str.charAt(i));
////		}
////		System.out.println(sum);
//	}
//}
