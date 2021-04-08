package com.test.question.q11;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Calendar;

public class Q010 {
	public static void main(String[] args) throws NumberFormatException, IOException {
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		System.out.print("년 : ");
		int year = Integer.parseInt(reader.readLine());
		System.out.print("월 : ");
		int month = Integer.parseInt(reader.readLine());
		System.out.print("일 : ");
		int day = Integer.parseInt(reader.readLine());

		Calendar someDay = Calendar.getInstance();
		someDay.set(year, month - 1, day);
		int dayWeek = someDay.get(Calendar.DAY_OF_WEEK);
		// 금6 토7 일1 월2 화3 수4 목5

		if (dayWeek != Calendar.SATURDAY && dayWeek != Calendar.SUNDAY) {
			System.out.println("입력하신 날짜는 '평일' 입니다.");
			System.out.println("해당 주의 토요일로 이동합니다.");
			someDay.add(Calendar.DATE, 7 - dayWeek);
			System.out.printf("이동한 날짜는 '%tF' 입니다.", someDay);
		} else {
			System.out.println("입력하신 날짜는 '휴일' 입니다.");
			System.out.println("결과가 없습니다.");
		}
	}
}
