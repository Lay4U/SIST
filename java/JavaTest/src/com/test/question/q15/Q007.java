package com.test.question.q15;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Q007 {
	public static void main(String[] args) throws NumberFormatException, IOException {
		int N = 10;
		int[] arr = new int[N];
		for (int i = 0; i < N; i++) {
			arr[i] = (int) (Math.random() * 9) + 1;
		}
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));

		System.out.print("삽입 위치 : ");
		int idx = Integer.parseInt(reader.readLine());
		System.out.print("값 : ");
		int value = Integer.parseInt(reader.readLine());

		System.out.print("원본 : [");
		String res = "";
		for (int i : arr)
			res += i + ", ";
		res = res.substring(0, res.length() - 2);
		res += "]";
		System.out.print(res);
		System.out.println();

		insert(arr, idx, value);
//		for(int i : arr) {
//			System.out.println(i);
//		}

		System.out.print("결과 : [");
		res = "";
		for (int i = 0; i < N; i++) {
			res += arr[i] + ", ";
		}
		res = res.substring(0, res.length() - 2);
		res += "]";
		System.out.print(res);

	}

	private static void insert(int[] arr, int idx, int value) {
		for (int i = arr.length - 2; i >= idx; i--) {
			arr[i + 1] = arr[i];
		}
		arr[idx] = value;
	}
}
