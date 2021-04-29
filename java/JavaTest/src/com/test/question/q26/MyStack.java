package com.test.question.q26;

import java.util.Arrays;

public class MyStack {
	private String[] list;
	private int index;

	public MyStack() {
		list = new String[4];
		index = 0;
	}

	public void push(String value) {
		if (this.index == list.length) //doubling에 넘기냐? 여기서 검사를 하느냐?
										//push할때 무조건 doubling으로 가는것보다는 이러한 조건을 만족할때 doubling으로 간다는것을 명확하게 표현
			doubling();					//한줄 일때는 {}를 안써도 됨.
		
		this.list[this.index] = value;
		this.index++;
	}

	private void doubling() {
//		if (this.list.length == 0)
//			this.list = Arrays.copyOf(this.list, 4);
//		else
		this.list = Arrays.copyOf(this.list, this.list.length * 2);
	}

	public String pop() {
		return this.list[--this.index];
	}

	public int size() {
		return this.index;
	}

	public String peek() {
		return this.list[index - 1];
	}

	public void clear() {
		this.index = 0;
	}

	public void trimToSize() {
//		String[] t = new String[this.index];
//		for (int i = 0; i < t.length; i++) 
//			t[i] = new String();
//		

		this.list = Arrays.copyOf(this.list, this.index);
	}
}
