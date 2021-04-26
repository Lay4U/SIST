package com.test.question.q25;

public class MainClass {
	public static void main(String[] args) {
		MyHashMap map = new MyHashMap();

		map.put("국어", "합격");
		map.put("영어", "불합격");
		map.put("수학", "보류");
//		map.put("국어2", "합격");
//		map.put("영어3", "불합격");
//		map.put("수학4", "보류");
//		map.put("국어5", "합격");
//		map.put("영어6", "불합격");
//		map.put("수학7", "보류");
//		
//
//		System.out.println(map.toString());

		System.out.println(map.get("국어"));
		System.out.println(map.get("영어"));
		System.out.println(map.get("수학"));
		System.out.println();
		System.out.println(map.size());
		System.out.println();
		map.put("영어", "합격");
		System.out.println(map.get("영어"));
		System.out.println();
		map.remove("영어");
		System.out.println(map.get("영어"));
		System.out.println();
		if (map.containsKey("국어")) {
			System.out.println("국어 점수 있음");
		} else {
			System.out.println("국어 점수 없음");
		}
		System.out.println();
		if (map.containsValue("합격")) {
			System.out.println("합격 과목 있음");
		} else {
			System.out.println("합격 과목 없음");
		}
		System.out.println();
		map.clear();
		System.out.println(map.size());
	}
}
