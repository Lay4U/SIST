package com.test.question.q24;

import java.util.ArrayList;
import java.util.Arrays;

public class MyArrayList {
	private String[] list = new String[2];
	private int idx = 0;

	public void add(String s) {

		// 방이 남아있는지 체크?
		if (this.idx >= this.list.length) {
			checkIndex();
		}
		this.list[this.idx++] = s;

	}

	public String get(int index) {
//		ArrayList<String> arrayList = new ArrayList<String>();
//		arrayList.get(0); //return (E) elementData[index];
		
		if (this.list[index] != null)
			return this.list[index];
		else
			return "\0";
		
//		return "\0";
//		return "";
		
	}

	public int size() {
		return this.idx;
	}

	public void set(int index, String value) {
		this.list[index] = value;
	}

	public void remove(int index) {
		for (int i = index; i < this.idx; i++)
			this.list[i] = this.list[i + 1];
		this.idx--;
//		System.out.println(this.list);
	}

	public void add(int index, String value) {
		if (this.idx >= this.list.length + 1) {
			checkIndex();
		}
		for (int i = this.idx; i > index; i--)
			this.list[i] = this.list[i - 1];
		this.list[index] = value;
		this.idx++;
//		System.out.println(this.list);
	}

	public int indexOf(String value) {
		for (int i = 0; i < this.idx; i++) {
//			int t = this.list[i].indexOf(value); SYstem.out.println(t);
			if (this.list[i].indexOf(value) > -1)
				return this.list[i].indexOf(value);
			
		}
		return -1;
	}

	public int lastIndexOf(String value) {
		for (int i = 0; i < this.idx; i++)
			if (this.list[i].lastIndexOf(value) > -1)
				return this.list[i].lastIndexOf(value);

		return -1;
	}

	public void clear() {
		this.list = new String[0];
		this.idx = 0;
	}

	public void getAll() { //읽기를 이 메소드로 바꾸면 좋겠다. (배열 크기 100으로 잡으면 100줄이 공백으로생성)
		for (String s : this.list)
			System.out.println(s);
	}

	private void checkIndex() {
		String[] tmp = new String[this.list.length*2];
		for(int i=0; i<idx; i++) {
			tmp[i] = this.list[i]; 
		}
		
		if(this.list.length == 0)
			this.list = Arrays.copyOf(this.list, 2);
		else
			this.list = Arrays.copyOf(this.list, this.list.length * 2);
		//배열의 크기는 무조건 2배 이상으로 설정
		//null인 배열을 어떻게 처리하느냐?
		//실질적인 size에 맞게 다시 배열의 크기를 조정하거나
		//null그대로 두고 출력하는 method를 바꾸거나 하는 방법
		//요청사항대로 바꾸면 될것같다.
		
		//현재로서는 배열의 크기는 무조건 2배로 설정하고
		//list에 속해있는 배열의 크기(실질적인 데이터값이 들어있는 크기)
		//의 인덱스는 this.index로 for문 문제를 해결한다.
		//this.index는 add, remove에서 ++, --된다.
		
		//단 이경우 main의 println을 쓰게되면 만약 100칸짜리방에 5개의 데이터가 있으면
		//90줄의 빈공간이 생기게된다. 따라서 getAll과 같은 메소드가 필요하다.
		//혹은 방의 크기를 resize하는 방법이 필요하다.
	}

}
