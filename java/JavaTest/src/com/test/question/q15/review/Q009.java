package com.test.question.q15.review;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

//난수로 채워진 배열에서 첫번째 방부터 연속으로 2개씩 더한 결과를 출력 
public class Q009 {
	public static void main(String[] args) throws NumberFormatException, IOException {
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		System.out.print("배열의 길이 :");
		int length = Integer.parseInt(reader.readLine());
		
		int[] nums = new int[length];
		
		for(int i = 0; i<nums.length; i++) { // 1~10 난수 생성 
			nums[i] = (int)(Math.random()*10)+1;
		}
		
		System.out.print("nums = [ ");//["로
		outputResult(nums);
		System.out.println();
		
		int[] result = new int[5];			   //reuslt nums  result nums
		for(int i =0; i< result.length; i++) { // (0-0,1)   (1-2, 3)  (2-4,5)  (3 - 6,7)   (4- 8,9) 
			result[i] = nums[i*2] + nums[i*2+1];
		}
		
//		for (int i = 0; i < 5; i++) { 다른 방법
//			for (int j = 0; j < 2; j++) {
//				res[i] += arr[i * 2 + j];
//			}
//		}
		
		System.out.print("result = [ "); //["로
		outputResult(result);
		
		
		
	}//main 

	

	private static void outputResult(int[] result) {
		for(int i = 0; i < result.length; i++) {
			if(i == result.length-1) {
				System.out.printf("%d ]", result[i]); //%d]로
			} else {
				System.out.printf("%d , ", result[i]);//%d,로
			}
		}
	}
	private static void outputNums(int[] nums) {
		for(int i = 0; i < nums.length; i++) {
			if(i == nums.length-1) {
				System.out.printf("%d ]", nums[i]);
			} else {
				System.out.printf("%d ,", nums[i]);
			}
		}
	}// outputNums는 동일한 기능, 동일한 매개변수를 받으므로 삭제하고 outputResult하나만 사용하자.
}