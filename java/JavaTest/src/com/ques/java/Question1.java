package com.ques.java;

public class Question1 {
	public static void main(String[] args) {
		String name = "홍길동";
		int age = 20;
		String gender = "남자";
		String address = "서울시 강남구 역삼동";

		System.out.println("안녕하세요. 제 이름은 \'" + name + "\'입니다.");
		System.out.printf("나이는 %d살이고 %s입니다.\n", age, gender);
		System.out.printf("저는 '%s'에 살고 있습니다", address);

	}
}
