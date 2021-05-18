package com.test.question.q15.review;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Q008 {

	public static void main(String[] args) throws NumberFormatException, IOException {
		
		//delete
		
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		
		System.out.print("삭제 위치: ");
		
		int index = Integer.parseInt(reader.readLine());
		
		int[] nums = new int[5];
		
		for (int i=0; i< nums.length; i++) {
			
			nums[i] = (int)(Math.random()*10)+1; //1~10 숫자 랜덤
		}
		
		output(nums);
		
		delete(nums,index);
		
		output(nums);
		
	}//main
	
	
	public static void delete(int[] nums, int index) {
		
		for(int i=index+1; i<=nums.length-1; i++) { //사람기준 보정 > int i=index;
			
			nums[i-1]=nums[i]; //이거말고 다른방법이 또 있나?
			
		}
		
		nums[nums.length-1] = 0;//일반적으로 0을 넣나? 0을 안넣으면 난수 대입됨. 오류 방지위해 0을 넣자.
	}
	
	public static void output(int[] nums) {
		for(int i=0;i<nums.length;i++) {
			System.out.printf("%d ", nums[i]);
		}
		System.out.println();
	}
	
	
}