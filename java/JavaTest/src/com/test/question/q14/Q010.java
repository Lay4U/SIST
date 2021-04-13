package com.test.question.q14;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Q010 {
	public static void main(String[] args) throws IOException {
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
//		String str = "53216";
		System.out.print("금액(원) : ");
		String str = reader.readLine();

		int value = Integer.parseInt(str);
		int tmp = 0;
		for (int i = str.length(); i > 0; i--) {
//			System.out.println(value);
			tmp = value / (int) Math.pow(10, i - 1);
//			System.out.println(value % (int)Math.pow(10, i-1) );
			value = value % (int) Math.pow(10, i - 1);
//			System.out.println(tmp);
			printNum(tmp);
			if(tmp != 0)
				printWon(i);
		}
		System.out.println("원");
	}

	private static void printWon(int i) {
		switch(i) {
			case 5:
				System.out.print("만");
				break;
			case 4:
				System.out.print("천");
				break;
			case 3:
				System.out.print("백");
				break;
			case 2:
				System.out.print("십");
				break;
//			case 1:
//				System.out.print("만");
//				break;
		}
		
	}

	private static void printNum(int tmp) {
		switch (tmp) {
			case 1:
				System.out.print("일");
				break;
			case 2:
				System.out.print("이");
				break;
			case 3:
				System.out.print("삼");
				break;
			case 4:
				System.out.print("사");
				break;
			case 5:
				System.out.print("오");
				break;
			case 6:
				System.out.print("육");
				break;
			case 7:
				System.out.print("칠");
				break;
			case 8:
				System.out.print("팔");
				break;
			case 9:
				System.out.print("구");
				break;
		}
	}
}
