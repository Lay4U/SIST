package com.test.question.q12;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Q011 {
	public static void main(String[] args) throws NumberFormatException, IOException {
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		System.out.print("최대 숫자 : ");
		int maxNum = Integer.parseInt(reader.readLine());
		
		if(String.valueOf(maxNum).length() > 3) {
			System.out.println("최대 3자리 까지만 허용됩니다.");
			return;
		}
		for (int i = 0; i < maxNum; i++) {
			String str = String.valueOf(i);
			Boolean flag = false;
			for (int j = 0; j < str.length(); j++) {
				char check = str.charAt(j);
				if (check == '3' || check == '6' || check == '9') { 
					System.out.print("짝");
					flag = true;
				}
				else if( j == str.length()-1 && !flag)
				{
					System.out.print(i);
				}
			}
			System.out.println();
		}
	}
}
