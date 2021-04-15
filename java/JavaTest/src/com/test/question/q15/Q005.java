package com.test.question.q15;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Q005 {
	public static void main(String[] args) throws NumberFormatException, IOException {
		int N = 20;
		int[] randNum = new int[N];

		for (int i = 0; i < N; i++) {
			randNum[i] = (int) (Math.random() * 19) + 1;
		}

		int min;
		int max;
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		System.out.print("최대 범위 : "); // TODO? 최대, 최소값 포함? 미포함? 현재는 포함으로 구현함.
		max = Integer.parseInt(reader.readLine());
		System.out.print("최소 범위 : ");
		min = Integer.parseInt(reader.readLine());

		System.out.print("원본 : ");
		String res = "";
		for (int i : randNum)
			res += i + ", ";
		res = res.substring(0, res.length() - 2);
		System.out.print(res);
		System.out.println();

		System.out.println(min + " " + max);
		System.out.print("결과 : ");
		res = "";
		for (int i = 0; i < N; i++) {
			if (randNum[i] >= min && randNum[i] <= max)
				res += randNum[i] + ", ";
		}
		res = res.substring(0, res.length() - 2);
		System.out.print(res);
		System.out.println();
	}
}
