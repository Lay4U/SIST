package com.test.review.q3_4;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Q4_2 {
	public static void main(String[] args) throws IOException {
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		System.out.print("이름 : ");
		String name = reader.readLine();	//이 쯤에서 개행 하는게 가독성이 높아질거 같다.
		name = getName(name);
		System.out.printf("고객 : %s\n", name); // name에 getName(name)을 받지 않고 printf에서 getName(name)을 바로 호출하는게 좋지 않을까? 
	}

	public static String getName(String name) {
		return name + "님";
	}
}

/* 
 *	 
 */

