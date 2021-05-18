package com.test.question.q26;

public class MainClass {
	public static void main(String[] args) {
		MyStack stack = new MyStack();
		
		stack.push("빨강");
		stack.push("노랑");
		stack.push("파랑");
		stack.push("주황");
		stack.push("검정");
		
		System.out.println(stack.pop());
		System.out.println(stack.pop());
		System.out.println(stack.pop());
		System.out.println();
		
		System.out.println(stack.size());
		System.out.println();
		
		System.out.println(stack.peek());
		System.out.println(stack.peek());
		System.out.println(stack.size());
		System.out.println();
		
		stack.trimToSize();
		System.out.println(stack.size());
		System.out.println();
		
		stack.clear();
		System.out.println(stack.size());
	}
}
