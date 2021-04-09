package com.test.question.q12;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Q013 {
	public static void main(String[] args) throws NumberFormatException, IOException {

		while(true)
		{
			System.out.println("=======================");
			System.out.println("         자판기        ");
			System.out.println("=======================");
			System.out.println("1. 콜라         : 700원");
			System.out.println("2. 사이다       : 600원");
			System.out.println("3. 비타500      : 500원");
			System.out.println("-----------------------");
			
			BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
			System.out.print("금액 투입(원) : ");
			int inputMoney = Integer.parseInt(reader.readLine());
			System.out.println("-----------------------");
			System.out.print("음료 선택(번호) : ");
			int choice = Integer.parseInt(reader.readLine());
			
			if(choice <=0 || choice >3)
				System.out.println("잘못 입력하셨습니다.");
			
			if(choice == 1) {
				System.out.println("+콜라를 제공합니다.");
				System.out.printf("+잔돈 %,d을(를) 제공합니다.\n", inputMoney-700);
			}
			else if(choice == 2) {
				System.out.println("+사이다를 제공합니다.");
				System.out.printf("+잔돈 %,d을(를) 제공합니다.\n", inputMoney-600);
			}
			else if(choice == 3) {
				System.out.println("+비타500을 제공합니다.");
				System.out.printf("+잔돈 %,d을(를) 제공합니다.\n", inputMoney-500);
			}
			System.out.println();
			System.out.println("계속하시려면 엔터를 입력하세요.");
			String str = reader.readLine();

			if(!str.equals(""))
				break;
		}
		
		
	}
}
