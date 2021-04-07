package com.test.question.q6;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Q006 {
	public static void main(String[] args) throws NumberFormatException, IOException {
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));

		System.out.println("음식을 받길 원하는 시간");
		System.out.print("시 : ");
		int hour = Integer.parseInt(reader.readLine());
		System.out.print("분 : ");
		int minute = Integer.parseInt(reader.readLine());
		System.out.println();

		int jjajang = minute - 10 >= 0 ? minute - 10 : minute - 10 + 60;
		int chicken = minute - 18 >= 0 ? minute - 18 : minute - 18 + 60;
		int pizza = minute - 25 >= 0 ? minute - 25 : minute - 25 + 60;

		hour = minute >= 25 ? hour : --hour;

		System.out.printf("짜장면 : %02d시 %02d분\n", hour, jjajang);
		System.out.printf("치킨   : %02d시 %02d분\n", hour, chicken);
		System.out.printf("피자   : %02d시 %02d분\n", hour, pizza);
	}
}


//	짜장면은 10분 뒤에 도착 치킨은 18분 뒤에 도착 피자는 25분 뒤에 도착

