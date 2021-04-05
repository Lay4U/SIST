package com.test.question.q4;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Q003 {
	public static void main(String[] args) throws NumberFormatException, IOException {
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
//		System.out.println("000"+1);
		System.out.print("숫자 입력 : ");
		int getNum = Integer.parseInt(reader.readLine());
		digit(getNum);
		
//		for(int i=1; i<20000; i+=10)
//			digit(i);
		

	}

	public static void digit(int num) {		// 반환 없으므로 여기서 출력
		// if문을 모른다는 전제 하에
		int chipher = (num / 10 > 0) ? (num / 100 > 0) ? (num / 1000 > 0) ? 4 : 3 : 2 : 1;

//		System.out.println("chipher : " + chipher);


		String result = (chipher >= 1) ? (chipher >= 2) ? (chipher >= 3) ? (chipher == 4) ? 
						Integer.toString(num) : "0" + num : "00" + num : "000" + num : Integer.toString(num);
//		String result = (chipher >= 1) ? (chipher >=2) ? (chipher == 3) ?   "0"+num : "00"+num : "000"+num : Integer.toString(num); 
//		String result = (chipher >= 4) ? (chipher >=3) ? (chipher >= 2) ?   "000"+num : "00"+num : "0"+num : Integer.toString(num);
		System.out.println(num + " -> " + result);
	}
}
