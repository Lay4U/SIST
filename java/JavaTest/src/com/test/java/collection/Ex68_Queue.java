package com.test.java.collection;

import java.util.Arrays;

public class Ex68_Queue {
	
	public static void main(String[] args) {
		
		//Ex68_Queue.java
		
		MyQueue queue = new MyQueue();
		
		System.out.println(queue);
		
		queue.add("빨강");
		System.out.println(queue);
		
		queue.add("파랑");
		System.out.println(queue);
		
		System.out.println(queue.poll());
		System.out.println(queue);
		
		
		
		
	}//main

}

class MyQueue {
	
	private String[] list;
	private int index;
	
	public MyQueue() {
		this.list = new String[8];
		this.index = 0;
	}
	
	@Override
	public String toString() {
		
		return String.format("length: %d\nindex: %d\n%s\n"
								, this.list.length
								, this.index
								, Arrays.toString(this.list));
	}
	
	
	public void add(String value) {
		
		doubling();
		
		this.list[this.index] = value;
		this.index++;
		
	}

	private void doubling() {
		
		//100% 동일
		
	}
	
	
	public String poll() {
		
		//부정 전처리 - 잘못된 상황을 먼저 발견해서 업무 중지
		if (this.index == 0) {
			return null;
		}
	
		String temp = this.list[0]; //첫번째 공
		
		//좌측 시프트
		for (int i=0; i<this.index - 1; i++) {
			this.list[i] = this.list[i+1];
		}
		
		this.index--;
		
		return temp;	
		
		
		
		
//		if (this.index != 0) {
//			
//			//업무 블럭
//			
//			String temp = this.list[0]; //첫번째 공
//			
//			//좌측 시프트
//			for (int i=0; i<this.index - 1; i++) {
//				this.list[i] = this.list[i+1];
//			}
//			
//			this.index--;
//			
//			return temp;	
//		} else {
//			
//			//예외 블럭
//			return null;
//		}
	}
	
	
	
	public int size() {
		
		return this.index;
	}
	
	public String peek() {
		
		return this.list[0];
	}
	
	public void clear() {
		
		this.index = 0;
	}
	
}















































