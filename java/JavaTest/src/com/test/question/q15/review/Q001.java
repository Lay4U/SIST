package com.test.question.q15.review;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Q001 {
	
	public static void main(String[] args) throws NumberFormatException, IOException {
		
		int[] nums = new int[5];
		
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		
		for (int i=0; i<nums.length; i++) {
			System.out.print("숫자: "); //Integer~부분을 변수로 선언 가능
			nums[i] = Integer.parseInt(reader.readLine());
		}
		//여기서 한줄 띄어주기
		for (int i=nums.length-1; i>=0; i--) { 
		System.out.printf("nums[%d] = %d\n", i, nums[i]);//들여쓰기, String변수에 +=로 저장 가능.
		}
		

		
		
	}//main

}//class