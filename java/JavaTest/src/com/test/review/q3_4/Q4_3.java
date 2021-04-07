package com.test.review.q3_4;
import java.io.*;
//숫자 1개를 입력받아 4자리로 출력하는 메소드 선언하고 호출 
public class Q4_3 {
	public static void digit(int num) {
//		if(num>0 && num <10)
//			System.out.printf("000"+"%d\n", num);
//		else if (num >= 10 && num <100)
//			System.out.printf("00"+"%d\n", num);
//		else if (num >=100 && num <1000)
//			System.out.printf("0"+"%d\n", num);
//		else 
//			System.out.printf("%d\n", num);
	System.out.printf("%04d\n", num);
	}
	public static void main(String[] args) throws IOException {
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		System.out.print("숫자 입력 :");
		String str = reader.readLine();	//여기에서 개행하면 가독성 높아질듯
		int num = Integer.parseInt(str);
		digit(num);

//		digit(1);
//		digit(99);
//		digit(123);
//		digit(1000);
		}}
/*
 * 지금 화면 보여요? 의견주세요 ㅎㅎ
 * 1. 주석이 많다. => 로직 정리 Googling 하느라 코드가 지저분 해졌음
 * 2. main이 먼저? digit이 먼저? 어떤 함수가 먼저 나와야 좋을까?
 * 
 * 
 */

		
		