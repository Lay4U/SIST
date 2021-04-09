package com.test.question.q12;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Q009 {
	public static void main(String[] args) throws NumberFormatException, IOException {
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		System.out.println("컴퓨터가 1~10 사이의 숫자를 1개 생각했습니다.");
		int num;
		int cnt = 0;
		int randNum = (int) (Math.random() * 10 + 1);
		for(;;) { //while(true)
			System.out.print("숫자 : ");
			num = Integer.parseInt(reader.readLine());

			cnt++;
			if (num == randNum) {
				System.out.println("정답입니다.");
				break;
			}
			System.out.println("틀렸습니다.");
			System.out.println();
		}

		System.out.println("컴퓨터가 생각한 숫자는 " + randNum + "입니다.");
		System.out.println("정답을 맞추는데 시도한 횟수는 " + cnt + "회 입니다.");
		System.out.println();
		System.out.println("프로그램을 종료합니다.");
	}
}
