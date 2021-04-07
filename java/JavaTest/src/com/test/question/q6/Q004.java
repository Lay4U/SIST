package com.test.question.q6;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Calendar;

public class Q004 {
	public static void main(String[] args) throws IOException {
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		System.out.print("남자 이름 : ");
		String nameBoy = reader.readLine();

		System.out.print("여자 이름 : ");
		String nameGirl = reader.readLine();

		System.out.print("만난날 (년) : ");
		int yearMeet = Integer.parseInt(reader.readLine());

		System.out.print("만난날 (월) : ");
		int yearMonth = Integer.parseInt(reader.readLine());

		System.out.print("만난날 (일) : ");
		int yearDay = Integer.parseInt(reader.readLine());
		System.out.println();

		//////////////////////////////////////////////////// 구분
		Calendar now = Calendar.getInstance();
		now.set(yearMeet, yearMonth, yearDay);

		System.out.printf("'%s'과(와) '%s'의 기념일\n", nameBoy, nameGirl);

		now.add(Calendar.DATE, 100 - 1);
		System.out.printf("100일  : %tF\n", now);

		now.add(Calendar.DATE, 100 - 1);
		System.out.printf("200일  : %tF\n", now);

		now.add(Calendar.DATE, 100 - 1);
		System.out.printf("300일  : %tF\n", now);

		now.add(Calendar.DATE, 200 - 1);
		System.out.printf("500일  : %tF\n", now);

		now.add(Calendar.DATE, 500 - 1);
		System.out.printf("1000일 : %tF\n", now);

	}
}
