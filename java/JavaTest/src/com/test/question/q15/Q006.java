package com.test.question.q15;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Q006 {
	public static void main(String[] args) throws NumberFormatException, IOException {
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		System.out.print("숫자의 범위(1~N) : ");
		int range = Integer.parseInt(reader.readLine());
		System.out.print("숫자의 개수 : ");
		int N = Integer.parseInt(reader.readLine());

		int[] rand = new int[N];

//		int[] rand = {1, 1, 2, 3, 4}; 
//		for(int i=0; i<N; i++) {
//			rand[i] = (int) (Math.random() * 9) + 1;
//		}

		int tmp = 0;
		int cnt = 0;
		for (int i = 0; i < N; i++) {
			tmp = (int) (Math.random() * range) + 1;
			for (int j = 0; j < N; j++) {
				if (rand[j] == tmp)
					cnt++;
				if (j == N - 1 && cnt == 0) {
					rand[i] = tmp;
//					j++;
					break;
				} else if (j == N - 1 && cnt != 0) {
					j = 0;
					tmp = (int) (Math.random() * range) + 1;
					cnt = 0;
				}
			}
			cnt = 0;
		}
//		for(int i : rand)
//			System.out.println(i);
		String str = "[";
		for (int i : rand)
			str += i + ", ";
		str = str.substring(0, str.length() - 2);
		str += "]";
		System.out.println(str);
	}
}
