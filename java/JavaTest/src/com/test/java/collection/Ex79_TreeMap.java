package com.test.java.collection;

import java.util.TreeMap;

public class Ex79_TreeMap {
	
	public static void main(String[] args) {
		
		//Ex79_TreeMap.java
		
		//Tree -> 이진 트리 구조
		//Map -> key, value
		
		//TreeMap
		// - 키를 자동정렬
		// - 키: 이진 트리
		// - 값: 리스트
		
		TreeMap<String,String> map = new TreeMap<String,String>();
		
		map.put("one", "하나");
		map.put("two", "둘");
		map.put("three", "셋");
		map.put("four", "넷");
		map.put("five", "다섯");
		
		System.out.println(map.size());
		System.out.println(map);
		
		System.out.println(map.get("three"));
		
		
		System.out.println(map.firstKey());
		System.out.println(map.lastKey());
		System.out.println(map.firstEntry());
		System.out.println(map.lastEntry());
		System.out.println(map.headMap("o"));
		System.out.println(map.tailMap("o"));
		System.out.println(map.subMap("f", "o"));
		
		
		
		
		//List
		// - ArrayList(*), LinkedList, Stack, Queue
		//Set
		// - HashSet(*), TreeSet
		//Map
		// - HashMap(*), TreeMap
		
		//ArrayList, HashMap -> 시간 투자
		
	}

}



















