package com.test.review.q3_4;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Q4_7 {
	public static void main(String[] args) throws IllegalArgumentException, IOException {
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		System.out.print("역의 개수 : ");
		int numStation = Integer.parseInt(reader.readLine());
		System.out.print("환승 횟수 : ");
		int numTransfer = Integer.parseInt(reader.readLine());
		System.out.println("숫자 하나를 입력해주세요.  1.평상, 2.출근, 3.퇴근 4.생략");
		int distinguish = Integer.parseInt(reader.readLine());

		int totalTime;
		totalTime = distinguish == 4 ? getTime(numStation, numTransfer) : getTime(numStation, numTransfer, distinguish);

		System.out.println("총 소요 시간은 " + totalTime + "분입니다.");

	}

	public static int getTime(int num1, int num2) {
		int betweenStation = num1 * 2;
		int transfer = num2 * 3;

		return betweenStation + transfer;
	}

	public static int getTime(int num1, int num2, int num3) {
		int betweenStation = num1 * 2;
		int transfer = 0;

		if (num3 == 1)
			transfer = num2 * 3;
		else if (num3 == 2)
			transfer = num2 * 4;
		else if (num3 == 3)
			transfer = num2 * 5;

//		int transfer2 = num3 == 3 ? num3 == 2 ? num3 == 1 ? num2 * 5 : num2 * 4 : num2 * 3 : transfer;
//		위와 아래중 어떤 코드가 좋을까?

//	   public static int getTime(int station, int transfer) {
//		      
//		      return 2 * station + 3 * transfer;
//		      
//		   }
//		   public static int getTimorning(int station, int transfer) {
//		      
//		      return 2 * station + 4 * transfer;
//		      
//		   }
//		   public static int getTimeevening(int station, int transfer) {
//		   
//		      return 2 * station + 5 * transfer;
//		   
//		}
//		이렇게 메소드를 여러개 만들어서 구현할 수도 있다.

		return betweenStation + transfer;
	}
}
