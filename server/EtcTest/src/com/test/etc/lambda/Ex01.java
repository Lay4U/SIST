package com.test.etc.lambda;

public class Ex01 {
	public static void main(String[] args) {
		MyClass m1 = new MyClass();
		m1.test();
		
		MyInterface m2 = new MyClass();
		m2.test();
	}
}

interface MyInterface{
	void test();
}

class MyClass implements MyInterface{
	@Override
	public void test() {
		System.out.println("실명 클래스의 객체가 구현한 메소드");
	}
}

class OtherClass implements MyInterface{
	@Override 
	public void test() {
		System.out.println("구현");
	}
	public void print() {
		System.out.println("자체 구현한 메소드");
	}
}

