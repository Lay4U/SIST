package com.test.etc.lambda;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;

public class Ex03 {
	public static void main(String[] args) {
		/*
		 * 람다식
		 * - 1회성 메소드를 만드는 기법
		 * - 익명 객체의 추상 메소드를 간편(간략)하게 표기하는 기법
		 * - 람다식(X) <- 목적(X), 도구(O) 
		 * - RedInterface를 구현 + 딱 1번만 > 그 안의 추상 메소드 color() 구현하는 것!!
		 * - RedInterface를 구현 + N번 > 실명 클래스 구현
		 */
		
		RedInterface r1 = new RedInterface() {
//			추상 메소드 구현(오버라이드)
			@Override
			public void color() {
				System.out.println("익명 객체를 통한 추상 메소드 구현");
			}

			@Override
			public void test() {
				// TODO Auto-generated method stub
				
			}
		};
		r1.color();
		
		//The target type of this expression must be a functional interface
		RedInterface r2 = () -> {
			System.out.println("익명 객체를 통한 추상 메소드 구현");
		};
		
		RedInterface r3 = () -> System.out.println("익명 객체를 통한 추상 메소드 구현");
		r3.color();
		
		YellowInterface y1 = (String c) -> System.out.println(c);
		y1.color("Yellow");
		
		YellowInterface y2 = c ->{
			if(c.equals("Yellow")) {
				System.out.println("노랑");
			} else if (c.equals("Red")) {
				System.out.println("빨강");
			}
		};
		y2.color("Yellow");
		
//		BlueInterfcae b1 = (c1, c2) -> {return c1 + c2;};
		BlueInterface b2 = (c1, c2) -> c1 + c2;
		 
//		System.out.println(b1.color("red", "blue"));
		System.out.println(b2.color("yellow", "blue"));
		
		//수업 내용에서 람다식을 사용할 만한 곳?
		//1. 배열의 정렬
		//2. 컬렉션의 정렬
		//3. 익명 객체 구현 시
		
		Integer[] nums = {10, 40, 20, 50, 30 };
		ArrayList<String> names = new ArrayList<String>();
		names.add("나나나");
		names.add("라라라");
		names.add("가가가");
		names.add("마마마");
		names.add("다다다");
		
		
		ArrayList<User> users = new ArrayList<User>();
		users.add(new User("김사장",50));
		users.add(new User("홍과장",38));
		users.add(new User("서대리",33));
		users.add(new User("윤차장",42));
		users.add(new User("정사원",29));
		
		Arrays.sort(nums);

//		Arrays.sort(nums, new Comparator<Integer>() {
//
//			@Override
//			public int compare(Integer o1, Integer o2) {
//				return o1 - o2;
//			}
//			
//		});
		Arrays.sort(nums, (o1, o2) -> o1-o2);
		System.out.println(Arrays.toString(nums));
		
		names.sort((n1, n2) -> n1.compareTo(n2));
		names.sort((n1, n2) -> n2.compareTo(n1));
		System.out.println(names);
		
		
		users.sort((u1, u2) -> u1.getAge() - u2.getAge());
		users.sort((u1, u2) -> u1.getName().compareTo(u2.getName()));
		System.out.println(users);
		
		
		
		
		
	}
}

class User {
	private String name;
	private int age;
	
	public User(String name, int age) {
		this.name = name;
		this.age = age;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String toString() {
		return String.format("%s[%d]", this.name, this.age);
	}

	
}

@FunctionalInterface
interface RedInterface{
	void color();
//	void test();
	
	
}
@FunctionalInterface
interface YellowInterface {
	void color(String c);
}
@FunctionalInterface
interface BlueInterface{
	String color(String c1, String c2);
}
/*

	인사말
	전체 일정이 Day1, Day2, Day3, Day4... 이렇게 존재합니다.
	사용자가 Day1를 클릭하면 Day1의 일정이 출력됩니다.
	Day2를 클릭하면 Day2의 일정이 출력됩니다.
	이렇게 각 날짜의 일정이 존재하는데요
	
	Day를 클릭하면 스케쥴 서블릿으로 넘어가서 일정 정보를 DB에서 받아와 일정을 넘겨줍니다.
	
	그래서 전체 일정을 클릭 한번에 추가하는 구현에 어려움이 있습니다..
	
	전체일정추가라는 버튼을 클릭하면 자바스크립트로 각 Day를 클릭하면 좋을거 같은데 서블릿을 갔다 오는 바람에 자바스크립트가 초기화되는 문제를 겪었습니다.
	
	각 버튼을 클릭해서 전체일정을 추가하는 방법을 어떻게 구현해야 할 지 궁금합니다.
	
	아래는 전체 코드입니다.

 */
