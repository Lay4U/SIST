package com.test.java;

import java.util.Calendar;

public class Ex19_DateTime {
	public static void main(String[] args) {
		// 날짜, 시간, 자료형
		Calendar now = Calendar.getInstance();
		Calendar birthday = Calendar.getInstance();
		birthday.set(1995, 4, 12, 15, 30, 50);

		long nowTick = now.getTimeInMillis();
		long birthTick = birthday.getTimeInMillis();

		System.out.println((nowTick - birthTick) / 1000 / 60 / 60 / 24);
		
	}

	private static void m1() {
		// TODO Auto-generated method stub

	}
}
