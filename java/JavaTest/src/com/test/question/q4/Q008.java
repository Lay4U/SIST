package com.test.question.q4;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Q008 {
	public static void main(String[] args) throws NumberFormatException, IOException {
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		System.out.print("맑은 날 : ");
		int sunnyDay = Integer.parseInt(reader.readLine());
		System.out.print("흐린 날 : ");
		int cloudyDay = Integer.parseInt(reader.readLine());

		int totalApple = getApple(sunnyDay, cloudyDay);
		System.out.println("사과가 총 " + totalApple + "개 열렸습니다.");
	}

	public static int getApple(int num1, int num2) {
		int treeHeight = 5 * num1 + 2 * num2;
		return (treeHeight - 100) / 10;
	}
}
