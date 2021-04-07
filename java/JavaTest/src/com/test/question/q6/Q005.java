package com.test.question.q6;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Calendar;

public class Q005 {
	public static void main(String[] args) throws NumberFormatException, IOException {
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));

		System.out.print("아빠 생일 (년) : ");
		int yearDaddy = Integer.parseInt(reader.readLine());
		System.out.print("아빠 생일 (월) : ");
		int monthDaddy = Integer.parseInt(reader.readLine());
		System.out.print("아빠 생일 (일) : ");
		int dayDaddy = Integer.parseInt(reader.readLine());
		System.out.println();
		System.out.print("딸 생일 (년) : ");
		int yearDau = Integer.parseInt(reader.readLine());
		System.out.print("딸 생일 (월) : ");
		int monthDau = Integer.parseInt(reader.readLine());
		System.out.print("딸 생일 (일) : ");
		int dayDau = Integer.parseInt(reader.readLine());

		Calendar calDaddy = Calendar.getInstance();
		Calendar calDau = Calendar.getInstance();

		calDaddy.set(yearDaddy, monthDaddy, dayDaddy);
		calDau.set(yearDau, monthDau, dayDau);

		Calendar now = Calendar.getInstance();
		Long tickDaddy = now.getTimeInMillis() - calDaddy.getTimeInMillis();
		Long tickDau = now.getTimeInMillis() - calDau.getTimeInMillis();

		Long result = (tickDaddy - tickDau) / 1000 / 60 / 60 / 24;
		System.out.printf("아빠는 딸보다 %,d일을 더 살았습니다.", result);

	}

}