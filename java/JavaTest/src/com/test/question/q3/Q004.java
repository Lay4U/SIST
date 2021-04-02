package com.test.question.q3;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Q004 {
	public static void main(String[] args) throws NumberFormatException, IOException {
		System.out.print("사용자가 페달을 밟은 횟수 : ");
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		int numberOfPedal = Integer.parseInt(reader.readLine());
		System.out.println();

		final double RADIUS = 0.3302;	//	1inch : 0.0254m = 26inch : 0.6604m 
//		final double PI = 3.141592;
		// 지름 -> 2 * 파이 * r
		double circumference = 2 * Math.PI * RADIUS;
		System.out.printf("사용자가 총 %,d회 페달을 밟아 자전거가 총 %,.0fm를 달렸습니다.\n", numberOfPedal, numberOfPedal * circumference);
	}
}
