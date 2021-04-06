package com.test.review.q3_4;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Q4_6 {

	public static void main(String[] args) throws NumberFormatException, IOException {

		BufferedReader reader = (new BufferedReader(new InputStreamReader(System.in)));

		System.out.print("국어 : ");

		int koreanScore = Integer.parseInt(reader.readLine());		//reader.readLine을 String으로 빼는게 좋을까? 이렇게 쓰는게 좋을까?

		System.out.print("영어 : ");

		int englishScore = Integer.parseInt(reader.readLine());

		System.out.print("수학 : ");

		int mathScore = Integer.parseInt(reader.readLine());

		String result = test(koreanScore, englishScore, mathScore);

		System.out.printf("%s입니다.", result);

	}// main

	public static String test(int n1, int n2, int n3) {

		String result = (n1 + n2 + n3) / 3 >= 60 ? "합격" : "불합격";

		String fail = n1 < 40 || n2 < 40 || n3 < 40 ? "불합격" : "합격";	// ||연산자 사이에 괄호를 쓰는게 가독성이 높아질까?

		String realResult = result.equals("합격") && fail.equals("합격") ? "합격" : "불합격"; // 문자열 비교 .equals() 로 사용해야 한다.

		return realResult;

	}


	

}// class