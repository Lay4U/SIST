package com.test.question.q15.review;

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
			tmp = (int) (Math.random() * range) + 1; //난수
			for (int j = 0; j < N; j++) {
				if (rand[j] == tmp) //==중복된 값이 있다
					cnt++; //cnt로 중복여부 판단.
				if (j == N - 1 && cnt == 0) { //중복된 값이 없다 
					rand[i] = tmp;
//					j++;// 2번째 for문을 빠져나가기 위해서
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