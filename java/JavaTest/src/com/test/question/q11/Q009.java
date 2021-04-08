package com.test.question.q11;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Q009 {
	public static void main(String[] args) throws NumberFormatException, IOException {
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		System.out.print("년도 입력 : ");
		int year = Integer.parseInt(reader.readLine());

		if (year % 4 == 0 && year % 100 == 0 && year % 400 == 0)
			System.out.println("윤년");
		else
			System.out.println("평년");

//		if(year % 4 == 0) {
//			if(year % 100 == 0) {
//				if(year % 400 == 0) {
//					System.out.println("윤년");
//				}
//			}
//		}
//		if (year % 4 != 0) {
//			if (year % 100 != 0) {
//				if (year % 400 != 0) {
//					System.out.println("평년");
//				}
//			}
//		}
	}
}
