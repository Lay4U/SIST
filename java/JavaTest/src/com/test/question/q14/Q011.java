package com.test.question.q14;

public class Q011 {
	public static void main(String[] args) {
		String str = "0000저는 홍길동입니다. 제 나이는 20살입니다. 몸무게는 72kg입니다. 전화번호는 010-2848-9372입니다.";
		int sum = 0;
		
		for(int i=0; i<str.length(); i++) {
			int idx = str.charAt(i);
//			System.out.print(idx+" ");
			if(idx >= '0' && idx <= '9') {//0:48 9:57
				sum += idx - 48;
//				System.out.println(idx);
//				System.out.printf("%c", idx);
			}
				
		}

		System.out.println(sum);
	}
}
