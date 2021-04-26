package com.test.question.q25;

public class MyHashMap {

	private Entry[] list;
	private int index;

	public MyHashMap() {
		this.list = new Entry[4];
		this.index = 0;
	}

	public String toString() {
		String tmp = "";
		for (int i = 0; i < this.index; i++) {
			tmp += String.format("key: %s\tvalue: %s\n",
					this.list[i].key, this.list[i].value);
		}
		return tmp;
	}

	public String get(String key) {
		for (int i = 0; i < this.index; i++) {
			if (this.list[i].key.equals(key))
				return this.list[i].value;
		}
		return null;
	}

	public int size() {
		return this.index;
	}

	public void put(String key, String value) {
		for (int i = 0; i < this.index; i++) {
			if (this.list[i].key.equals(key)) { //key 받은것을 비교
				this.list[i].value = value;	//있으면 value에 저장
				return;						// 없으면 return;
			}
		}
		Entry e = new Entry();
		e.key = key;
		e.value = value;
		if (this.index >= this.list.length)
			checkIndex();

		this.list[this.index] = e;
		this.index++;
	}

	public void remove(String key) {
		int idx = 0;
		for (int i = 0; i < this.index; i++) {	//삭제할 위치를 찾기
			if (this.list[i].key.equals(key)) { //key랑 같은값 -> idx
				idx = i;
			}
		}

		for (int i = idx; i < this.index - 1; i++) {//idx시작 index까지 0->1번방 1->2번방....
			this.list[i].key = this.list[i + 1].key;
			this.list[i].value = this.list[i + 1].value;
		}
		this.index--;
	}

	private void checkIndex() {

		Entry[] t = new Entry[this.list.length * 2];
		//멤버변수로 key, value를 받으면
//		key *2;
//		value * 2;
		if (this.list.length == 0)
			t = new Entry[4];

		for (int i = 0; i < t.length; i++) {
			t[i] = new Entry();
		}

		for (int i = 0; i < this.list.length; i++) {
			t[i].key = this.list[i].key;
			t[i].value = this.list[i].value;
		}
		this.list = t;
	}
	
	public boolean containsKey(String key) {
		for (int i = 0; i < this.index; i++) {
			if (this.list[i].key.equals(key))
				return true;
		}

		return false;
	}

	public boolean containsValue(String value) {
		for (int i = 0; i < this.index; i++) {
			if (this.list[i].value.equals(value))
				return true;
		}

		return false;
	}

	public void clear() {
		this.index = 0;
		this.list = new Entry[0];
	}

}

class Entry {
	public String key;
	public String value;

	public Entry() {
		this.key = "";
		this.value = "";
	}
}
