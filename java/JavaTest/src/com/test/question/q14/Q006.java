package com.test.question.q14;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Q006 {
	public static void main(String[] args) throws IOException {
//		String n = "931209-1234672"; // System.out.println(n.length());14
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		System.out.print("주민번호를 입력해주세요 : ");
		String n = reader.readLine();
		String n2 = "";
		long parse = 0;
		if (n.charAt(6) == '-') {
			n2 = n.replace("-", "");
			n2 = n2.substring(0, n2.length() - 1); //주민번호 마지막 자리수 없애기
			parse = Long.parseLong(n2); //숫자 931209123467
		}
		else if(n.indexOf("-") == -1) {
			n2 = n;
			n2 = n2.substring(0, n2.length() - 1);
			parse = Long.parseLong(n2);
		}else if (n.length() > 14)
			System.out.println("올바른 주민번호 형식이 아닙니다.");

		long mul = 234567892345L;
		int sum = 0;
		
		for (int i = 0; i < n2.length(); i++) {//
//			long a = parse % 10; //마지막자리수
//			long b = mul % 10;	//마지막자리수
			sum += (parse % 10) * (mul % 10);
			parse /= 10;
			mul /= 10;
		}
		
		sum %= 11;
		sum = 11 - sum;
		if (sum == 11)
			sum = 1;
		else if (sum == 10)
			sum = 0;


		long tmp = Long.valueOf(n.replace("-", ""));
		tmp %= 10;
//		System.out.println(sum);
		if (sum == tmp)
			System.out.println("올바른 주민등록 번호입니다.");
		else {
			System.out.println("올바르지 않은 주민등록 번호입니다.");
		}
	}
}
