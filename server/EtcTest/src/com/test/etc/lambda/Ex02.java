package com.test.etc.lambda;

public class Ex02 {
	public static void main(String[] args) {
		TestClass t1 = new TestClass();
		t1.test();
		
		TestInterface t2 = new TestClass();
		t2.test();
		
		TestInterface t3 = new TestInterface() {
			
			@Override
			public void test() {
				System.out.println("익명 클래스의 객체가 구현한 메소드");
				
			}
		};
		t3.test();
		
		TestInterface t4 = () -> {
			System.out.println("익명 객체가 구현한 메소드");
		};
		t4.test();
		
	}
}

interface TestInterface{
	void test();
}

class TestClass implements TestInterface{
	@Override
	public void test() {
		System.out.println("실명 클래스의 객체가 구현한 메소드");
	}
}

