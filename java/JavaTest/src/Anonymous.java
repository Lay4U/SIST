import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;

public class Anonymous {
	public static void main(String[] args) {

//		m1();
//		m2();
//		m7();
//		m8();
		m9();
		
		
		
	}

	private static void m9() {
		ArrayList<String>name = new ArrayList<String>();
		
		name.add("홍길동");
		name.add("아무개");
		name.add("하하하하");
		name.add("호호호");
		name.add("후후");
		
		name.sort(new Comparator<String>() {

			@Override
			public int compare(String o1, String o2) {
//				return o1.compareTo(o2);
//				return o2.compareTo(o1);
				return o1.length() - o2.length();
			}
			
		});
		
		System.out.println(name);
	}

	private static void m8() {
		ArrayList<Integer>num= new ArrayList<Integer>();
		
		num.add(10);
		num.add(50);
		num.add(30);
		num.add(40);
		num.add(20);
		
		num.sort(new Comparator<Integer>() {

			@Override
			public int compare(Integer o1, Integer o2) {
				return o1 - o2;
			}
			
		});
		
		System.out.println(num);
	}

	private static void m7() {
		Integer[] num = {5, 3, 1, 4, 2};
		
//		Arrays.sort(num);
//		System.out.println(Arrays.toString(num));
//		Arrays.sort(num, Collections.reverseOrder());
//		sort(T[] a, Comparator<? super T> c) 
//		Arrays.sort(num, Collections.reverseOrder());
		Arrays.sort(num, Collections.reverseOrder());
		
		Arrays.sort(num, new MySort());
		Arrays.sort(num, new Comparator<Integer>() {

			@Override
			public int compare(Integer o1, Integer o2) {
				return o1 - o2;
			}
		});
		System.out.println(Arrays.toString(num));
	}

	private static void m2() {
		int[] num = {5,3,4,1,2};
		
		for(int i=0; i<num.length-1; i++) {
			for(int j=0; j<num.length-1-i; j++) {
				
			}
		}
		
	}

	private static void m1() {
		CCC c = new CCC();
		c.test();

		// interface상속한 객체는 되도록 인터페이스 변수를 만들어서 담아라
		
		// 객체를 많이만들면 상관없는데 객체를 적게(1~2개)일때 익명함수와 HashMap으로 클래스 갯수를 줄일수 있다.
		
		AAA c2 = new CCC();
		c2.test();

//		AAA c3 = new AAA(); // 추상메소드때문에 객체화 불가. 익명함수와 같은원리

		AAA c3 = new AAA() {

			@Override
			public void test() {
				//익명함수
			}
		};
		
		AAA c4 = new AAA() {

			@Override
			public void test() {
				//익명함수
			}
			
		};
		
		
		//데이터집합 ( Collections)
		HashMap<String,Integer>map = new HashMap<String, Integer>();
		map.put("kor", 100);
		map.put("eng", 90);
		map.put("math", 80);
		
		HashMap<String,Integer>map2 = new HashMap<String, Integer>();
		map2.put("ko", 100);
		map2.put("eng", 90);
		map2.put("math", 80);
		//행동집합
			//실명 클래스 : 객체화 횟수 X N개 + 클래스 선언 비용 O
			//익명 클래스 : 객체화 횟수 X 1개 + 클래스 선언 비용 X
		
		ArrayList<Integer> list = new ArrayList<Integer>();
		
		list.add(100);
		list.add(200);
		list.add(300);
		list.add(400);
		list.add(500);
		
		//대부분의 컬렉션은 toString() 오버라이드 되어있다.
		// 본인의 상태(데이터)를 문자열로 반환 -> 개발자 확인 용이
		System.out.println(list);
		System.out.println(list.toString());
		
		int[] num = {10,20,30,40,50};
		
		System.out.println(num.toString());
		System.out.println(Arrays.toString(num));
	}
	
	
}

interface AAA {
	public void test();
}

class CCC implements AAA {
	public void test() {
		System.out.println("인터페이스 구현 메소드");
	}
}

class DDD implements AAA{

	@Override
	public void test() {
		
	}
	
}

abstract class BBB{
	public abstract void test();
	private int a;
	public void aaa() {
		
	}
}

class MySort implements Comparator<Integer>{

	@Override
	public int compare(Integer o1, Integer o2) {
		//인자값 두개 우위 비교, 양수 0 음수를 반환
		return o1 - o2;
	}
	
}