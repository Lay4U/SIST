package com.test.java;

import java.io.BufferedReader;
import java.io.FileReader;
import java.util.Scanner;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Ex81_RegEx {
	
	public static void main(String[] args) {
		
		//Ex81_RegEx.java
		
		//m1();
		
		//m2();
		m3();
		
		//m4();
		//m5();
		
		//m6();
		
	}//main

	private static void m6() {
		
		String txt = "안녕하세요. 홍길동입니다. 제 전화번호는 010-8521-5412 그리고 집 전화는 02-987-6543입니다. 연락주세요.";
		
		Pattern p = Pattern.compile("\\d{2,3}-(\\d{3,4})-(\\d{4})");
		
		Matcher m = p.matcher(txt);
		
		while (m.find()) {
			System.out.println(m.group());
			System.out.println(m.group(1));
			System.out.println(m.group(2));
		}
		
	}

	private static void m5() {
		
		//프로젝트 -> 유효성 검사
		Scanner scan = new Scanner(System.in);
		
		System.out.print("아이디 입력: ");
		String input = scan.nextLine();
		
		//20~30 lines
		//1. 영문자, 숫자, _ -> for + charAt + 코드값 비교
		//2. 숫자 시작 X -> if + charAt(0) + 코드값 비교
		//3. 4자 ~ 12자 이내 -> if + length
		
		//String regex = "^[A-Za-z_][A-Za-z0-9_]{3,11}$";
		String regex = "^[A-Za-z_]\\w{3,11}$";
		
		Pattern p = Pattern.compile(regex);
		Matcher m = p.matcher(input);
		
		if (m.find()) {
			System.out.println("통과");
		} else {
			System.out.println("실패");
		}
		
		
		
		
		
	}

	private static void m4() {
		
		//프로젝트 -> 유효성 검사
		Scanner scan = new Scanner(System.in);
		
		System.out.print("나이 입력: ");
		String input = scan.nextLine();
		
		//숫자만 입력?
		//charAt(i) -> '0' > c && '0' < c...
		
		String regex = "^[0-9]{1,3}$";
		Pattern p = Pattern.compile(regex);
		Matcher m = p.matcher(input);
		
		if (m.find()) {
			System.out.println("올바른 나이를 입력함.");
		} else {
			System.out.println("나이는 숫자로 작성할것!!!");
		}
		
		
	}

	private static void m3() {
		
		try {
			
			BufferedReader reader = new BufferedReader(new FileReader("dat\\naver.txt"));
			
			String wholeText = "";
			String line = "";
			
			while ((line = reader.readLine()) != null) {
				wholeText += line + "\r\n";
			}
			
			reader.close();
			
			//System.out.println(wholeText);
			
			//네이버 시작 페이지 > 모든 URL를 수집
			// -> 문자열\문자열
			Pattern p = Pattern.compile("(http|ftp|https):\\/\\/[\\w\\-_]+((\\.[\\w\\-_]+))+([\\w\\-\\.,@?^=%&amp;:/~\\+#]*[\\w\\-\\@?^=%&amp;/~\\+#])?");
			
			Matcher m = p.matcher(wholeText);
			
			while (m.find()) {
				System.out.println(m.group(2));
			}
			
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		
		
	}

	private static void m2() {
		
		//Pattern 클래스
		// - 정규식 지원
		String txt = "안녕하세요. 홍길동입니다. 제 전화번호는 010-8521-5412 그리고 집 전화는 02-987-6543입니다. 연락주세요.";
		
		//txt -> 전화번호 있는지? 없는지?
		
		//정규식 객체 생성
		Pattern p = Pattern.compile("\\d{2,3}-\\d{3,4}-\\d{4}");
		
		
		//검색
		Matcher m = p.matcher(txt);
		
		//System.out.println(m.find());
		
		if (m.find()) {
			
			System.out.println("게시물 작성 금지!!!");
						
			//어떤 전화번호를 작성했길래??
			System.out.println(m.group());
			
		} else {
			System.out.println("게시물 작성 완료~");
		}
		
		
		//게시판 작성 -> 금지어(바보, 멍청이)
		txt = "글을 쓰고 있습니다... 바보야!!";
		
		p = Pattern.compile("(바보|멍청이)");
		
		m = p.matcher(txt);
		
		if (m.find()) {
			System.out.println("금지어 사용!!!!");
			System.out.println(m.group());
		} else {
			System.out.println("통과~");
		}
		
		
		
		txt = "안녕하세요. 제 몸무게는 75kg입니다. 키는 175cm입니다. 나이는 20살입니다.";
		// -> 숫자만 골라내시오.
		
		p = Pattern.compile("\\d{1,}");
		
		m = p.matcher(txt);
		
		while (m.find()) { //iter.hasNext()
			System.out.println(m.group()); //iter.next()
		}
		
	}

	private static void m1() {
		
		//자바 + 정규식
		// - 자바의 일부 메소드가 정규식을 지원
		
		String txt = "안녕하세요. 홍길동입니다. 제 전화번호는 010-8521-5412 그리고 집 전화는 02-987-6543입니다. 연락주세요.";
		
		//게시판 정책 -> 연락처 작성 금지 -> 마스킹 처리
		//System.out.println(txt.replace("010-1234-5678", "XXX-XXXX-XXXX"));
		
		//CharSequence -> String 클래스의 부모 인터페이스
		
		System.out.println(txt.replaceAll("[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}", "XXX-XXXX-XXXX"));
		
		
		

		String name = "홍길동,아무개.하하하,호호호.후후후";

		//분할 메소드 -> 구분자를 기준으로 문자를 자르는 기능
		//String[] result = name.split(",{1,4}");
		String[] result = name.split("[,\\.]");
		
//		for (String n : result) {
//			System.out.println(n);
//		}
		
		for (int i=0; i<result.length; i++) {
			System.out.printf("result[%d] = %s\n", i, result[i]);
		}
		
	}

}




























































