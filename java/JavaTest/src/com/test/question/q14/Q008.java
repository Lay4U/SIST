package com.test.question.q14;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Q008 {
	public static void main(String[] args) throws IOException {
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		System.out.print("단어 : ");
		String str = reader.readLine(); // 조건) 2글자, 첫 글자는 대문자일때
		//두글자 이상이면... 배열로 idx값 받고... 해당 idx마다 띄어쓰기를하려면 replace? 는 쓰면안되는데..
		//substring으로 나누는것이 최선인가?
		// TODO 여러 단어 입력 받을 시 처리 구현
		int idx = 0;
		for (int i = 1; i < str.length(); i++) {
			//str.charAt(i)가 'A'~'Z'인지 비교하는것보다 간단하게 구현
			if (Character.isUpperCase(str.charAt(i))) {
				idx = i;
			}
		}
		String str1 = str.substring(0, idx);
		String str2 = str.substring(idx);
		System.out.println(str1 + " " + str2);

	}
}
