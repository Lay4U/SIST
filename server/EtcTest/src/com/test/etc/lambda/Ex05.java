package com.test.etc.lambda;

import java.io.BufferedReader;
import java.io.FileReader;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Arrays;
import java.util.List;
import java.util.stream.IntStream;

import com.test.data.Color;
import com.test.data.Data;
import com.test.data.User;

public class Ex05 {
	public static void main(String[] args) {
//		m2();
//		m3();
//		m4();
//		m6();
		m7();
		
	}

	private static void m7() {
		// TODO Auto-generated method stub
		
	}

	private static void m6() {
		// 소스 -> 스트림 -> 중간 처리(파이프) x N -> 최종 처리(파이프)
		//중간 파이프: filter(), distinct();
		//최종 파이프: forEach()
		
		//매핑
		// - mapXXX()
		// - 스트림 요소 -> 다른 형태의 요소(값)으로 변환(******)해서 반환하는 작업
		// - 중간 파이프
		
		List<String> list = Data.getStringList();
		System.out.println(list);
		System.out.println();
	
		// 각 문자열의 길이를 확인? > 문자열(String) -> 매핑(변환) -> 길이(int)
		
		list.stream().forEach(str -> System.out.printf("%s(%d)\n", str, str.length()));
		System.out.println();
		
		list.stream().map(word -> word.length()).forEach(n -> System.out.println(n));
		System.out.println();
		
		Data.getIntList(10).stream().forEach(n -> System.out.println(n));
		
		Data.getIntList(10).stream().map(n -> (n / 10) * 10).forEach(n -> System.out.println(n));
		
		
		List<User> ulist = Data.getUserList();
		
		System.out.println(ulist.get(0));
		System.out.println();
		
		ulist.stream()
			.filter(user -> user.getGent() == 1)
			.map(user -> (double)user.getWeight() / (user.getHeight() * (user.getHegith())) * 10000)
			.forEach(bmi -> System.out.printf("%.1f\n", bmi));
		
		
	}

	private static void m4() {
		
		// 파이프라인
		
		List<Integer> list = Data.getIntList(15);
		
		System.out.println(list);
		System.out.println();
		
		for (int n : list) {
			if(n%2 ==0) {
				System.out.printf("%4d", n);
			}
		}
		System.out.println();
		
//		스트림 사용
		list.stream().forEach(n->{
			if(n%2==0) {
				System.out.printf("%4d", n);
			}
		});
		System.out.println();
		
		//스트림 사용 + 권장
		// 스트림 시작 -> 필터처리(중간) -> 포이치처리(최종)
		list.stream().filter(n -> n % 2 == 0).forEach(n -> System.out.printf("%4d", n));
		System.out.println();
		
		list.stream().filter(n -> n%3 == 0).forEach(n -> System.out.printf("%4d",n));
		System.out.println();
		
		list.stream().filter(n -> n > 50).forEach(n -> System.out.printf("%4d", n));
		System.out.println();
		
		Data.getStringList().stream().filter(str -> str.length() >= 5).forEach(str -> System.out.println(str));
		System.out.println();
		
		Data.getStringList().stream().filter(str -> str.startsWith("온"));
		System.out.println();
		
		
		Data.getUserList().stream()
		.filter(user -> user.getGender() == 1)
		.forEach(user -> System.out.println(user.getName()));
		System.out.println();
		
		Data.getUserList().stream()
		.filter(user -> user.getGender() == 2)
		.forEach(user -> System.out.println(user.getName()));
		System.out.println();
		
		Data.getUserList().stream()
		.filter(user -> user.getHeight() > 170 && user.getWeight() > 70)
		.forEach(user -> System.out.println(user));
		System.out.println();
		
		Data.getItemList().stream()
		.filter(item -> item.getColor() == Color.YELLOW)
		.forEach(item -> System.out.printf("%s(%s)\n", item.getName(), item.getColor()));
	}

	private static void m3() {
		int[] list1 = {10, 20, 30, 40, 50};
		Arrays.stream(list1).forEach(n -> System.out.printf("%4d", n));
		System.out.println();
		
		List<String> list2 = Arrays.asList("홍길동", "아무개", "하하하");
		list2.stream().forEach(name -> System.out.printf("%s", name));
		System.out.println();
		
		//3.
		IntStream list3 = IntStream.range(1, 11);
		list3.forEach(n -> System.out.printf("%4d", n));
		System.out.println();
		
		try {
			BufferedReader reader = new BufferedReader(new FileReader(".\\data\\data.txt"));
			
			String line = "";
			
			while((line = reader.readLine()) != null) {
				System.out.println(line);
			}
			
			reader.close();
			
			Path path = Paths.get(".\\data\\data.txt");
			Files.lines(path);
			
			Files.lines(Paths.get(".\\data\\data.txt")).forEach(ln -> System.out.println(ln));
			System.out.println();
			
			Path workspace = Paths.get("D:\\class\\server");
			Files.list(workspace).forEach( path2 -> System.out.println(path2.toString()));
			System.out.println();
					
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	private static void m2() {
		
//		int[] nums1 = Data.getIntArray();
//		System.out.println(Arrays.toString(nums1));
//		
//		int[] nums2 = Data.getIntArray(10);
//		System.out.println(Arrays.toString(nums2));
//		
//		List<Integer> nums3 = Data.getIntList(5);
//		System.out.println(nums3);
//		
//		List<String> list = Data.getStringList(10);
//		System.out.println(list);
		
		Data.getIntList().stream().forEach(num -> System.out.println(num));
		
		Data.getStringList(10).stream().forEach(word -> System.out.printf("%s(%d)\n", word, word.length()));
	}
}
