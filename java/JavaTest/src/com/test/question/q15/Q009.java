package com.test.question.q15;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Q009 {
	public static void main(String[] args) throws NumberFormatException, IOException {
//		int[] num1 = {1,2,3,4,5,6,7,8,9,10};
//		int[] res = new int[5];
//		
//		int cnt=0;
//		for(int i=0; i<5; i++) {
//			for(int j=0; j<2; j++) {
//				res[i] += num1[i*2+j]; 
//			}
//		}
//		for(int i=0; i<5; i++) {
//			System.out.println(res[i]);
//		}
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		System.out.print("배열의 길이 :");
		int N = Integer.parseInt(reader.readLine());
		int[] arr = new int[N];
		int[] res = new int[N / 2];

		for (int i = 0; i < arr.length; i++) {
			arr[i] = (int) (Math.random() * 9) + 1;
		}

		for (int i = 0; i < 5; i++) {
			for (int j = 0; j < 2; j++) {
				res[i] += arr[i * 2 + j];
			}
		}

		System.out.print("nums = [");
		String out = "";
		for (int i = 0; i < arr.length; i++) {
			out += arr[i] + ", ";
		}
		out = out.substring(0, out.length() - 2);
		out += "]";
		System.out.println(out);
		out = "result = [";
		for (int i = 0; i < res.length; i++) {
			out += res[i] + ", ";
		}
		out = out.substring(0, out.length() - 2);
		out += "]";
		System.out.println(out);

	}
}
