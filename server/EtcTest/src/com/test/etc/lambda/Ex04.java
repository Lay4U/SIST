package com.test.etc.lambda;

import java.util.Calendar;
import java.util.function.BiConsumer;
import java.util.function.Consumer;
import java.util.function.IntConsumer;
import java.util.function.IntSupplier;
import java.util.function.Supplier;

public class Ex04 {
	public static void main(String[] args) {
		// 함수형 인터페이스, Functional Interface
		// - 람다식과 함께 자바8부터 지원(JDK 1.8)
		// - 개발자가 직접 정의(*)
		// - JDK에서도 많은 수의 함수형 인터페이스를 제공(***)

		// 표준 API 함수형 인터페이스
		// - 추상 메소드 1개짜리 인터페이스
		// 1. Consumer: 매개변수O, 반환값X
//			- Consumer<T>
//			- BiConsumer<T, U>
		
		// 2. Supplier: 매개변수X, 반환값O
//			- Supplier<Integer>
		// 3. Function: 매개변수O, 반환값O, 매개변수를 반환값으로 변환 후 반환
		// 4. Operator: 매개변수O, 반환값O, 매개변수를 연산 후 결과를 반환, Function 하위버전
		// 5. Predicate: 매개변수O, 반환값O, 매개변수 논리 연산 후 결과 반환, Function 하위버전

//		m1();
		m2();

	}

	private static void m2() {
		//2. Supplier: 매개변수X, 반환값 O
		// - 반환값을 제공(공급)하는 역할
		Supplier<String> s1 = () -> { return "홍길동"; };
		System.out.println(s1.get());
		
		Supplier<Integer> s2 = () -> {
			Calendar c = Calendar.getInstance();
			return c.get(Calendar.DATE);
		};
		System.out.println(s2.get());
		
		Supplier<Double> s3 = () -> Math.random();
		System.out.println(s3.get());
		
		Supplier<User> s4 = () -> new User("홍길동", 20);
		System.out.println(s4.get());
		
		IntSupplier s5 = () -> 100;
		System.out.println(s5.getAsInt());
		
		
		
	}

	private static void m1() {
		// 1.Consumer: 매개변수O, 반환값 X
		// - 매개변수를 받아서 소비하는 일을 구현한다.
		// - acceptXXX() 메소드를 제공한다.

		MyConsumer c1 = (String str) -> {
			System.out.println("문자수: " + str.length());
		};
		MyConsumer c2 = str -> System.out.println("문자수: " + str.length());
		
		c1.accept("홍길동");
		c2.accept("안녕하세요.");
		
		Consumer<String> c3 = str -> System.out.println("문자수: " +str.length());
		c3.accept("홍길동");
		
		Consumer<Integer> c4 = n ->{
			for (int i=0; i<n; i++) {
				System.out.println(i);
			}
		};
		c4.accept(10);
		
		Consumer<User> c5 = user -> {
			System.out.println("유저 정보");
			System.out.println("이름: " + user.getName());
			System.out.println("나이: " + user.getAge());
			
		};
		c5.accept(new User("홍길동", 20));
		
		BiConsumer<String, Integer> bc1 = (name, age) -> System.out.printf("이름: %s, 나이: %d", name, age);
		bc1.accept("홍길동", 20);
		
		BiConsumer<Integer, Integer> bc2 = (n1, n2) -> System.out.println(n1 > n2 ? n1 : n2);
		bc2.accept(100, 200);
		
		Consumer<Integer> c6 = n -> System.out.println(n * n);
		IntConsumer c7 = n -> System.out.println(n * n);
		
		//프로그래밍 방식
		//1. 절차 지향형
		//2. 함수 지향형
		//3. 객체 지향형
		
	}

}

interface MyConsumer {
	void accept(String str);
}
