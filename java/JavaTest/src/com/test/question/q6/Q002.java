package com.test.question.q6;

import java.util.Calendar;

public class Q002 {
	public static void main(String[] args) {
		Calendar now = Calendar.getInstance();
		now.add(Calendar.DATE, 100 - 1);
		System.out.printf("백일 : %tF\n", now);

//		now.add(Calendar.DATE, 265 - 1);
		// 윤년이 포함됐는지 안됐는지 모르므로 이렇게 짜지 말자

		// 리셋해서 다시
		now = Calendar.getInstance();
		now.add(Calendar.YEAR, 1);
		// 이게 맞는 코드이다.

		System.out.printf("첫돌 : %tF\n", now);

	}
}
