package com.test.question.q15.review;

public class Q004 {
//1~20 사이 난수 담고 있는 배열 생성하고 최대값과 최소값 출력
	public static void main(String[] args) {

	int[] num = new int[20];
	
	int max = 0;// int max = Integer.MIN_VALUE; 가능	//배열의 첫번째값
	int min = 21;// int min = Integer.MAX_VALUE; 가능	//배열의 첫번째값
	System.out.print("원본: ");
	
	for(int i=0; i<num.length; i++) { //구현방법을 2중포문으로 가능하다.
		num[i] += (int)(Math.random() * 20)+1;//1~20까지
	   
		if(num[i] > max) {
			max = num[i];
		}
		if(num[i] < min) {
			min = num[i];
		}		
		
		if(num[i] == num[19]) {// (i == 19)일때로
			System.out.printf("%d \n", num[i]);
		} else {
			System.out.printf("%d, ", num[i]);
		}
	
	}//for문	
	 	
	 System.out.println("최대값: " + max);	
	 System.out.println("최소값: " + min);	
		
	}

}

//4번 2번째방법
//package com.test.question.q15;
//
//public class q {
//
//	public static void main(String[] args) {
//		
//		int[] nums = new int[20];
//		
//		for(int i=0; i<nums.length; i++) {
//			
//			int random = (int)(Math.random()*20)+1;
//			
//			nums[i] = random;
//			
//		}// 랜덤으로 난수 받기
//		
//		output(nums); //배열 출력 
//		
//		System.out.println();
//		
//		int max = 0;
//		
//		for(int i=0; i<nums.length;i++) {
//			
//			if(i==0) {// 처음 비교
//				if(nums[i]<=nums[i+1]) {
//					max = nums[i+1];
//				} else {
//					max = nums[i];
//				}
//			} else {
//				if(nums[i]<=max) {
//					max = max;
//				}else {
//					max = nums[i];
//				}
//			}
//			
//		}
//		
//		System.out.printf("최대값 : %d\n",max);
//
//		
//		int min =0;
//		
//		for(int i=0; i<nums.length; i++) {
//			
//			if(i == 0) {
//				if(nums[i]<=nums[i+1]) {
//					min = nums[i];
//				} else {
//					min = nums[i+1];
//				}
//			} else {
//				if(nums[i]<= min) {
//					min = nums[i];
//				} else {
//					min = min;
//				}
//			}
//		}
//		System.out.printf("최소값 : %d\n", min);
//		
//		
//	}//main
//
//	public static void output(int [] nums) {
//		
//		for (int i=0; i<nums.length;i++) {
//
//			if(i == nums.length-1) {
//				System.out.printf("%d",nums[i]);
//			} else {
//			System.out.printf("%d, ",nums[i]);
//			}
//			
//		}
//		
//		System.out.println();
//	}
//	
//	
//}