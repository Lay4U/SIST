package com.test.java.collection;

public class Ex64_ArrayList {
	
	public static void main(String[] args) {
		
		//Ex64_ArrayList.java
		
		MyList list = new MyList();
		
		System.out.println(list);
		
		list.add(100);
		
		System.out.println(list);
		
		list.add(200);
		
		System.out.println(list);
		
		list.add(300);
		
		System.out.println(list);
		
		list.add(400);
		
		System.out.println(list);
		
		list.add(500);
		
		System.out.println(list);
		
		list.add(600);
		list.add(700);
		list.add(800);
		
		System.out.println(list);
		
		list.add(900);
		
		System.out.println(list);
		
		
		System.out.println("list.get(0): " + list.get(0));
		System.out.println("list.get(3): " + list.get(3));
		System.out.println("list.get(5): " + list.get(5));
		
		//for (int i=0; i<16; i++) {
		//	System.out.println(list.get(i));
		//}
		
		//System.out.println(list.get(20));
		
		
		
		System.out.println("size: " + list.size());
		
		
		list.set(0, 1000);
		
		System.out.println(list);
		
		list.set(8, 9000);
		
		System.out.println(list);
		
		System.out.println(list.size()); //9개 -> 배열의 길이 -> 9
		
		//사용자는 방이 9개까지만 있는걸로 알고 있음
		//list.set(14, 10000);
		
		//System.out.println(list);
		
		//list.set(1000, 20000);
		
		System.out.println("---------------------------");
		list.trimToSize();
		list.remove(4);
		System.out.println(list);
		System.out.println("---------------------------");
		
		
		list.add(1);
		System.out.println(list);
		
		
		list.add(5, 5);
		System.out.println(list);
		
		list.add(5, 5);
		list.add(5, 5);
		list.add(5, 5);
		list.add(5, 5);
		list.add(5, 5);
		list.add(5, 5);

		System.out.println(list);
		

		list.add(5, 5);
		System.out.println(list);
		
		
		list.clear();
		System.out.println(list); //개발 + 디버깅 -> 출력 결과는 개발자들만 열람
		
		//System.out.println(list.size());
		//System.out.println(list.get(0));
		
		
		list.add(100);
		list.add(200);
		
		System.out.println(list.size());
		
		for (int i=0; i<list.size(); i++) {
			System.out.println(list.get(i));
		}
		
		
		System.out.println();
		System.out.println();
		System.out.println();

		System.out.println(list);
		
		list.trimToSize();
		
		System.out.println(list);
		
	}

}


class MyList {
	
	private int[] list; //내부 배열
	private int index; //현재 데이터를 넣을 방의 위치
	
	public MyList() {
		
		this.list = new int[4]; //초기 배열 크기
		this.index = 0; //처음 넣은 방 번호
		
	}
	
	//추가하기(Append)
	public void add(int n) {
		
		//1. 방의 갯수 확인 -> 2배로 늘리기
		doubling();
		
		
		//2. 데이터 추가하기
		this.list[this.index] = n;
		this.index++;
		
	}

	private void doubling() {
		if (this.index >= this.list.length) {
			
			int[] temp = new int[this.list.length * 2]; //현재 크기의 2배
			
			//깊은 복사(짧은 배열 길이만큼 반복)
			for (int i=0; i<this.list.length; i++) {
				temp[i] = this.list[i]; //원래 배열의 방 -> 2배 배열의 방 -> 1:1 복사
			}
			
			this.list = temp; //배열 교체
			
		}
	}
	
	
	@Override
	public String toString() {
		
		//개발용 버전
		String temp = "[";
		
		for (int n : this.list) {
			temp += String.format("%4d,", n);
		}
		
		temp = temp.substring(0, temp.length()-1);
		
		temp += "]";
		
		return String.format("length: %d\nindex: %d\n%s\n"
							, this.list.length //실제 내부 배열의 길이
							, this.index //현재 방 번호
							, temp);
		
		//배포용 버전
//		String temp = "[";
//		
//		for (int i=0; i<this.index; i++) {
//			temp += String.format("%4d,", this.list[i]);
//		}
//		
//		temp = temp.substring(0, temp.length()-1);
//		
//		temp += "]";
//		
//		return temp;
	}
	
	
	
	//가져오기(get)
	public int get(int index) {
		
		//for문;;;
		
		//요청하는 방번호가 자신이 집어넣은 데이터 갯수 범위 내
		if (index >= 0 && index < this.index) {
			
			return this.list[index];
		} else {
			
			throw new IndexOutOfBoundsException(); //예외 던지기
		}
		
	}
	
	
	
	//현재 요소 갯수 반환
	// - 배열의 길이(X)
	// - 배열의 길이와 상관없이 넣은 데이터의 갯수(O)
	public int size() {
		
		return this.index;
	}
	
	
	//수정하기
	public void set(int index, int n) {
		
		if (index >= 0 && index < this.index) {
			
			this.list[index] = n;
		} else {
			
			throw new IndexOutOfBoundsException(); //예외 던지기
		}

	}
	
	
	//삭제하기
	public void remove(int index) {
		
		if (index >= 0 && index < this.index) {
			
			//좌측 시프트
			for (int i=index; i<this.index-1; i++) {
				this.list[i] = this.list[i+1];
			}
			
			this.index--;//요소가 하나 없어졌으니 그 다음 방 번호도 하나 감소
			
		} else {
			
			throw new IndexOutOfBoundsException(); //예외 던지기
		}
		
	}
	
	
	//추가하기(Insert)
	public void add(int index, int n) {
		
		if (index >= 0 && index < this.index) {
			
			//방의 갯수 확인 -> 2배로 늘리기
			doubling();
			
			//우측 시프트
			for (int i=this.index-1; i>=index; i--) {
				this.list[i+1] = this.list[i];
			}
			
			//비어있는 방에 새로운 값을 대입
			this.list[index] = n;
			
			this.index++; //값이 추가되었으니 방번호 증가
			
		} else {
			
			throw new IndexOutOfBoundsException(); //예외 던지기
		}
		
	}
	
	//---------------------------------------------------------------- 반드시 구현 업무!!!
	
	
	
	public int indexOf(int n) {
		
		for (int i=0; i<this.index; i++) {
			if (this.list[i] == n) {
				
				return i; //찾은 방번호 반환
			}
		}
		
		return -1;		
	}
	
	public int lastIndexOf(int n) {
		
		for (int i=this.index-1; i>=0; i--) {
			if (this.list[i] == n) {
				
				return i;
			}
		}
		
		return -1;		
	}
	
	
	public void clear() {
		
		//Case A.
		//for (int i=0; i<this.index; i++) {
		//	this.list[i] = 0;
		//}
		
		//Case B.
		//this.list = new int[4];
		
		//Case C.
		this.index = 0;
		
	}
	
	
	public boolean contains(int n) {
		
		for (int i=0; i<this.index; i++) {
			if (this.list[i] == n) {
				
				return true;
			}
		}
		
		return false;
		
	}
	
	
	
	//길어진 배열을 데이터 갯수만큼으로 줄이기
	public void trimToSize() {
		
		//현재 길이 -> size
		int[] temp = new int[this.index]; //현재 데이터 갯수만큼의 길이를 가지는 배열
		
		for (int i=0; i<temp.length; i++) {
			temp[i] = this.list[i];
		}
		
		this.list = temp; //짧은 배열로 바꾸기
		
	}
	
	
	
	//비었는지?
	public boolean isEmpty() {
		
		return this.index == 0 ? true : false;
	}
	
	
	
	
}













































































