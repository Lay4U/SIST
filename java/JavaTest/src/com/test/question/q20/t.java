package com.test.question.q20;

import java.util.Calendar;

public class t {
	public static void main(String[] args) {
		Calendar a = Calendar.getInstance();
		System.out.println(a);
		String b = "2021-04-16";
		String[] arr = b.split("-");
		for(int i=0; i<arr.length; i++) {
			System.out.println(arr[i]);
		}
		
		
	}
}
