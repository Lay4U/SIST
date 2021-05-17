import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Random;

public class Ex_Don_Know {
	/*
	 * List 인터페이스 Collection 인터페이스의 자식 순서가 있는 배열 순수배열, ArrayList, LinkedList -> 방번호
	 * 존재 -> 첨자(index)를 사용해서 요소를 관리 요소가 중복값을 가질 수 있다. Set 인터페이스 Collection 인터페이스의 자식
	 * 순서가 없는 배열 방번호 존재 X -> 첨자를 사용하지 않음 -> 순서가 없다. 요소가 중복값을 가질 수 없다.
	 */
	public static void main(String[] args) {
//		m1();
//		m2();
//		m3();
		m4();
		
	}

	private static void m4() {
		int a = 10;
		int b = 10;
		System.out.println(a == b);
		
		boolean f1 = true;
		boolean f2 = true;
		System.out.println(f1 == f2);
		
		//1. 문자열은 불변이다. (Immutable)
		//2. 모든 참조형 변수의 비교는 주소값을 비교한다.
		String s1 = "홍길동";
		String s2 = "홍길동";
		//절대로 하지 말것. 문자열 비교는 반드시 equals
		System.out.println(s1 == s2);
		System.out.println(s1.equals(s2));
		String s3 = "홍";
		s3 = s3 + "길동";
		System.out.println(s1 == s3);
		System.out.println(s1.equals(s3));
		
		Keyboard k1 = new Keyboard("K810", 200000);
		Keyboard k2 = new Keyboard("K810", 200000);
		Keyboard k3 = k1;
		Keyboard k4 = new Keyboard("K990", 350000);
		
		System.out.println(k1 == k2);
		System.out.println(k1.equals(k2));
		System.out.println(k1 == k3);
		System.out.println();
		
		System.out.println(k1.toString());
		System.out.println(k2.toString());

		System.out.println(k1.hashCode());
		System.out.println(k2.hashCode());
		System.out.println(k3.hashCode());
	}

	private static void m3() {
		/*단일값(원자값) 집합
		 * - String[]
		 * - int[]
		 * - HashSet<String>
		 * - HashSet<Integer>
		 */
		
		/*
		 * 복합값 집합 -> 객체 집합
		 *  - Student[]
		 *  - HashSet<Studnet>
		 */
		
		HashSet<Keyboard> set = new HashSet<Keyboard>();
		
		set.add(new Keyboard("K810", 200000));
		set.add(new Keyboard("K310", 50000));
		set.add(new Keyboard("K810", 200000)); // set인데 잘 들어감 literal 상수는 중복 X but, 객체에 들어가는 참조형 값은 중복 O
		
		//A와 C는 같은 키보드? 아니냐?
		// - 모든 참조형(객체)는 아무리 상태(멤버 변수의 값)가 동일해도 다른 객체로 취급한다.
		// - 쌍둥이 개념
		System.out.println(set);
	}

	private static void m2() {
		//로또 번호 만들기 -> 중복값 허용 X
		Random rnd = new Random();
		
		ArrayList<Integer>lotto = new ArrayList<Integer>();
		
		for(int i=0; i<6; i++) {
			int n = rnd.nextInt(45)+1;
			Boolean flag = false;
			for (int j =0; j<i; j++) {
				if( n == lotto.get(j)) {
					flag = true;
					break;
				}
			}
			if(flag) {
				i--;
			}else {
				
				lotto.add(n);
			}
		}
		
		Collections.sort(lotto);
		System.out.println(lotto);
		
		
		//set
		HashSet<Integer> lotto2 = new HashSet<Integer>();
		
		while(lotto2.size() < 6){
			int n = rnd.nextInt(45) + 1;
			lotto2.add(n);
		}
		
		System.out.println(lotto2);
		
	}

	private static void m1() {
		ArrayList<String> list = new ArrayList<String>();
		HashSet<String> set = new HashSet<String>();
		
		//요소추가
		list.add("사과");
		list.add("딸기");
		
		list.add("바나나");
		list.add("딸기"); //중복값 허용, 방번호가 달라서 구분 가능하기 때문에
		
		set.add("사과");
		set.add("딸기");
		
		set.add("바나나");
		set.add("딸기");	// 중복값 허용 안함. 방번호가 없어서 데이터로 구분이 안되면 아예 구분 불가능하기 때문에
		
		System.out.println(list.size());
		System.out.println(set.size());
		
		System.out.println(list);
		System.out.println(set);
		
		System.out.println();
		System.out.println();
		//요소 접근 / 탐색
//		System.out.println(list.get(0));
//		System.out.println(set.get(0)); 방번호와 관련된 모든 메서드 존재치 아니함
//		get, indexOf, lastIndexOf, remove(int)가 없다.
		
//		set-> Iterator 지원
		for(String item : list) {
			System.out.println(item);
		}
		System.out.println();
		Iterator<String> iter= set.iterator();
		while(iter.hasNext()){
			System.out.println(iter.next());
		}
		
	}
}

class Keyboard {
	private String model;
	private int price;
	

	public Keyboard(String model, int price) {
		this.model = model;
		this.price = price;
	}
	@Override
	public String toString() {
		return "keyboard [model=" + model + ", price=" + price + "]";
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	@Override
	public int hashCode() {
		return 100;
	}
	
	@Override
	public boolean equals(Object obj) {
		return this.hashCode() == obj.hashCode();
	}
	
}
