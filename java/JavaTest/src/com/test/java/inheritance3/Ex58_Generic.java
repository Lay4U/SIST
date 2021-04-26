package com.test.java.inheritance3;

import java.awt.RenderingHints.Key;

public class Ex58_Generic {
	
	public static void main(String[] args) {
		
		//Ex58_Generic.java
		
		Item<String> item1 = new Item<String>();
		item1.c = "홍길동";
		System.out.println(item1.c.length());
		
		//Item<int> item4;
		Item<Integer> item2 = new Item<Integer>();
		item2.c = 10;
		System.out.println(item2.c * 2);
		
		Item<Boolean> item3 = new Item<Boolean>();
		item3.c = true;
		System.out.println(item3.c ? "참" : "거짓");
		
		
		
		Mouse<String> m1 = new Mouse<String>();
		m1.a = "문자열";
		m1.b = "홍길동";
		m1.c = "String";
		
		
		
		Keyboard<Boolean> k1 = new Keyboard<Boolean>();
		k1.a = true;
		k1.test(true);
		System.out.println(k1.get());
		
		
		Keyboard<Boolean> k2 = new Keyboard(); //사용하지 말것
		k2.a = false;
		
		
		Computer<String,Integer> c = new Computer<String,Integer>();
		
		c.set("홍길동", 20);
		
		System.out.println(c.getA());
		System.out.println(c.getB());
		
		
	}//main

}


//제네릭 클래스 선언하기
// - T: 타입 변수 -> 데이터를 저장하는 용도가 아니라, 자료형 자체를 저장하는 용도
//		ex) T = int
//		ex) T = String
//		ex) T = Random
class Item<T> {
	
	//멤버
	public int a;
	public String b;
	public T c; //Object 느낌 -> 뭐든지 담을 수 있는 자료형
	
}


class Mouse<T> {
	
	public T a;
	public T b;
	public T c;
	
}

class Keyboard<T> {
	
	public T a;
	
	public void test(T n) {
		//T m;//지역 변수를 사용할 수 없다. -> 겉으로 드러난 부분에만 사용을 권장
	}
	
	public T get() {
		return a;
	}
	
}


class Computer<T,U> {
	
	public T a;
	public U b;
	
	public void set(T a, U b) {
		this.a = a;
		this.b = b;
	}
	
	public T getA() {
		return this.a;
	}
	
	public U getB() {
		return this.b;
	}
	
}



























