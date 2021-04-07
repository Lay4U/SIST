package com.test.question.q6;

import java.util.Calendar;

public class Q001 {
	public static void main(String[] args) {
		nowTime();
		System.out.println();
		Time_AMPM();
	}

	public static void nowTime() {
		Calendar now = Calendar.getInstance();
		System.out.printf("현재 시각 : %02d시 %02d분 %02d초\n", now.get(Calendar.HOUR_OF_DAY), now.get(Calendar.MINUTE),
				now.get(Calendar.SECOND));
	}

	public static void Time_AMPM() {
		Calendar now = Calendar.getInstance();
		String amPm = now.get(Calendar.AM_PM) == 0 ? "오전" : "오후";
		System.out.printf("현재 시각 : %s %02d시 %02d분 %02d초\n", amPm, now.get(Calendar.HOUR_OF_DAY) % 12,
				now.get(Calendar.MINUTE), now.get(Calendar.SECOND));
	}

}
