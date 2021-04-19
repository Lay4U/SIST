package com.test.question.q20;

public class Main {
	public static void main(String[] args) throws Exception {
		Bugles snack = new Bugles();
		snack.setWeight(500);
		snack.setCreationTime("2021-04-01");
		System.out.println("가격 : " + snack.getPrice() + "원");
		System.out.println("유통 기한이 " + snack.getExpiration() + " 일 남았습니다.");
		snack.eat();
		System.out.println();
		
		Bugles snack2 = new Bugles();
		snack2.setWeight(300);
		snack2.setCreationTime("2021-04-13");
		System.out.println("가격 : " + snack2.getPrice() + "원");
		System.out.println("유통 기한이 " + snack2.getExpiration() + " 일 남았습니다.");
		snack.eat();
		System.out.println();
		
		
	}
}
