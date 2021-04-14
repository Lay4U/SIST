package com.test.question.q15;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Q008 {
	public static void main(String[] args) throws NumberFormatException, IOException {
		int N = 5;
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		System.out.print("삭제 위치 : ");
		int idx = Integer.parseInt(reader.readLine());

		int[] arr = new int[5];
		for (int i = 0; i < 5; i++) {
			arr[i] = (int) (Math.random() * 9) + 1;
		}

		System.out.print("원본 : [");
		String res = "";
		for (int i : arr)
			res += i + ", ";
		res = res.substring(0, res.length() - 2);
		res += "]";
		System.out.print(res);
		System.out.println();

		delete(arr, idx);

		System.out.print("결과 : [");
		res = "";
		for (int i = 0; i < N; i++) {
			res += arr[i] + ", ";
		}
		res = res.substring(0, res.length() - 2);
		res += "]";
		System.out.print(res);

	}

	private static void delete(int[] arr, int idx) {
		for (int i = idx; i < arr.length - 1; i++)
			arr[i] = arr[i + 1];
		arr[arr.length - 1] = 0;
	}
}
