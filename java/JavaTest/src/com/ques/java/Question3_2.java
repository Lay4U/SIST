package com.ques.java;

public class Question3_2 {
	public static void main(String[] args) {
	String  date1="2020-01-01",
			date2="2020-01-01",
			date3="2020-01-02",
			date4="2020-01-03",
			date5="2020-01-03";
	
	String  item1 = "카페라테",
			item2 = "돼지불백",
			item3 = "마트 장본것들",
			item4 = "교통 카드 충전",
			item5 = "편의점";
	
	int     amount1 = 4800,
			amount2 = 8500,
			amount3 = 125840,
			amount4 = 45000,
			amount5 = 16200;
	
	System.out.println("[날짜]\t\t[내역]\t\t      [금액]");
	System.out.println("--------------------------------------------");
	System.out.printf("%s\t%s\t%,10d원\n", date1, item1, amount1);
	System.out.printf("%s\t%s\t%,10d원\n", date2, item2, amount2);
	System.out.printf("%s\t%s\t%,10d원\n", date3, item3, amount3);
	System.out.printf("%s\t%s\t%,10d원\n", date4, item4, amount4);
	System.out.printf("%s\t%s\t\t%,10d원\n", date5, item5, amount5);
	}
}
