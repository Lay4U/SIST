package com.test.question.q12;

//	1/1/1 to today get days 
public class Q008 {
	public static void main(String[] args) {
		int year = 2021;
		int month = 4;
		int day = 10;
		
		int getDaysfromAD = 0;
		for (int i = 1; i <= year - 1; i++) {
			if(i % 4 == 0 && i % 100 != 0 || i % 400 == 0)
				getDaysfromAD += 366;
			else
				getDaysfromAD += 365;
		}

//		System.out.println(getDaysfromAD);

		for(int i=1; i<month; i++) {
			switch(i) {
				case 1:
				case 3:
				case 5:
				case 7:
				case 8:
				case 10:
				case 12:
					getDaysfromAD+=31;
					break;
				
				case 4:
				case 6:
				case 9:
				case 11:
					getDaysfromAD+=30;
					break;
				
			}

		}
//		System.out.println(getDaysfromAD);
		boolean isLeapYear = false;
		if(year % 4 == 0 && year % 100 != 0 || year % 400 == 0)
				isLeapYear = true;
		if(isLeapYear && month>=2)
			getDaysfromAD+=29;
		else if(month >=2) 
			getDaysfromAD+=28;
		
		getDaysfromAD += day;
		
		System.out.printf("%d년 %d월 %d일은 %,d일째 되는 날입니다.\n", year, month, day, getDaysfromAD);
		//금:5(0) 토:6 일:7(0) 월:1 화:2 수:3 목:4
		System.out.println(getDaysfromAD%7);
		int dayOfWeek = getDaysfromAD % 7;
		switch(dayOfWeek) {
			case 1:
				System.out.println("오늘은 월요일 입니다.");
				break;
			case 2:
				System.out.println("오늘은 화요일 입니다.");
				break;
			case 3:
				System.out.println("오늘은 수요일 입니다.");
				break;
			case 4:
				System.out.println("오늘은 목요일 입니다.");
				break;
			case 5:
				System.out.println("오늘은 금요일 입니다.");
				break;
			case 6:
				System.out.println("오늘은 토요일 입니다.");
				break;
			case 7:
				System.out.println("오늘은 일요일 입니다.");
				break;
				
		}
		
		
	}
}
