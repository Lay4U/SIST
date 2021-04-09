package com.test.question.q12;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Q012 {
	public static void main(String[] args) throws NumberFormatException, IOException {
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		String str = "";
		for(int i=0; i<10; i++) {
			System.out.print("숫자 : ");
			int num = Integer.parseInt(reader.readLine());
			switch(num) {
				case 1:
					str+="일";
					break;
				case 2:
					str+="이";
					break;
				case 3:
					str+="삼";
					break;
				case 4:
					str+="사";
					break;
				case 5:
					str+="오";
					break;
				case 6:
					str+="육";
					break;
				case 7:
					str+="칠";
					break;
				case 8:
					str+="팔";
					break;
				case 9:
					str+="구";
					break;
			}
		}
		System.out.println("결과 : "+str);
	}
}
