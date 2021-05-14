package com.test.java;

import java.io.BufferedReader;
import java.io.FileReader;

public class Ex80_RegEx {
	
	public static void main(String[] args) {
		
		//Ex80_RegEx.java
		
		/*
		
		정규 표현식, Regular Expression
		- 정규식
		- 우리가 원하는 패턴(규칙)을 가지는 문자열을 검사하는 표현식
		- 자바와 상관없이 독립적인 표현식
		- 자바가 정규 표현식을 지원하는 클래스를 제공한다.
		
		
		정규 표현식 구성 요소(문법)
		
		1. 모든 문자
		- 우리가 사용하는 모든 문자
		
		2. 모든 문자
		- .
		- 모든 문자 중 1개 -> 와일드 카드
		ex) ...
		ex) .a. -> abc, bac, dac, aca
		ex) Ex.. 
		ex) 홍.. -> 홍길동, 홍가가, 홍나나, 김길동, 김가가
		
		
		[앞의 요소의 출현 횟수 지정]
		- 0, 1, 무한대
		
		3. 없음
		- 출현 횟수: 1
		- 생략불가능, 중복불가능
		ex) abc -> abc
		
		4. ?
		- 출현 횟수: 0 ~ 1
		- 생략가능, 중복불가능
		ex) a?bc -> bc, abc, aabc, aaabc
		ex) 홍?길동 -> 홍길동님 안녕하세요. 길동아 안녕~
		ex) (ab)?cd -> cd, acd, bcd, abcd 
		ex) a?b?c -> c, ac, bc, abc 
		ex) (파란)?(노란)?바지 -> 바지, 파란바지, 노란바지, 파란노란바지
		
		5. +
		- 출현 횟수: 1 ~ 무한대
		- 생략불가능, 중복가능
		ex) a+bc -> bc, abc, aabc, aaabc, aaaabc, aaazaabc 	
		
		6. *
		- 출현 횟수: 0 ~ 무한대
		- 생략가능, 중복가능
		ex) a*bc -> bc, abc, aabc, aaabc, aaaabc, aaazaabc
		
		7. |
		- choice
		ex) (홍길동|아무개|테스트)+입니다.
			- 입니다.
			- 홍길동입니다.
			- 아무개입니다.
			- 호호호입니다.
			- 테스트입니다.
			- 홍길동아무개입니다.
		
		
		---------------------------------------------
		
		[앞의 요소의 출현 횟수 지정] > 개량 요소
		
		ex) 홍*길동, 홍?홍?홍?길동 -> 길동, 홍길동, 홍홍길동, 홍홍홍길동, 홍홍홍홍길동(X)
		
		
		8. {n}
		- n : 1이상의 정수, 앞의 요소의 출현 횟수
		ex) a{3}bc -> bc, abc, aabc, aaabc, aaaabc, aaaaabc 
		
		9. {n,}
		- n ~ 무한대 출현횟수 지정
		- n : 최소 횟수
		ex) a{2,}bc -> bc, abc, aabc, aaabc, aaaabc, aaaaabc 
		
		10. {n,m}
		- n ~ m 출현횟수 지정
		- m : 최대 횟수
		ex) a{2,3}bc -> bc, abc, aabc, aaabc, aaaabc, aaaaabc 
		
		
		------------------------------------------------------
		
		
		[선택 + 그룹]
		
		11. [요소나열]
		- [] 안에 나열된 요소 중 하나를 선택
		- choice
		- | 표현과 유사
		
		ex) (a|b|c)de -> ade, bde, cde
		ex) [abc]de -> ade, bde, cde
		ex) (홍길동|아무개)님 -> 홍길동님, 아무개님
		ex) [홍길동아무개]님 -> 홍님, 길님, 동님, 아님, 무님, 개님
		    [(홍길동)(아무개)]님 -> 홍길동님, 아무개님 
		
		ex) 2~3자리 숫자 검색
			[0123456789]{2,3} -> 제 몸무게는 70kg입니다. 키는 180cm입니다. 나이는 20살입니다.
			
		ex) 주민등록번호 검색
			[0123456789]{6}-[0123456789]{7} -> 전화번호는 010-1234-5678이고, 주민등록번호는 950510-2012457입니다.
			
		ex) [0123456789] -> 모든 숫자
		ex) [13579] -> 홀수만
		ex) [31975] -> 홀수만
		ex) [ABC] -> A, B, C
		ex) [가나다] -> 가, 나, 다
		ex) [5가E] -> 5, 가, E
		
		ex) 영소문자 + 4~7자 이내로 구성된 영단어
			- [abcdefghijklmnopqrstuvwxyz]{4,7}
		
		ex) 영대문자 + 5자 이상으로 구성된 영단어
			- [ABCDEFGHIJKLMNOPQRSTUVWXYZ]{5,}
			
		ex) 영문자 4~7자 이내로 구성된 영단어
			- [ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz]{4,7}
		
		ex) 숫자 : [0123456789] -> [0-9]
		ex) 영소문자 : [a-z]
		ex) 영대문자 : [A-Z]
		ex) 한글 : [가-힣]  
		
		ex) 한글 4~7자 단어
			[가-힣]{4,7}
		
		ex) 영문자 4~7자 단어
		    [ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz]{4,7}
		    [A-Za-z]{4,7}
		   
		ex) 영문자 + 숫자 + 한글 -> 4~7자 단어
			[A-Za-z0-9가-힣]{4,7}
		
		ex) 영문자 + 숫자 + 한글 + _ -> 4~7자 단어
			[A-Za-z0-9가-힣_]{4,7}
			
		ex) 프로젝트 진행 > 회원 가입 > 아이디 입력 > 유효성 검사
			a. 영문자 + 숫자 + _
			b. 숫자로 시작 X
			c. 4자~12자 이내
			
			[A-Za-z_][A-Za-z0-9_]{3,11}
			
			hong, test123, test_11, test짱, 홍길동, 123test, aaaa
			
			
		12. [^요소나열]
			- 나열된 요소 빼고 나머지 다
			ex) [^A-Za-z]{2,10}
		
		
		----------------------------------------------------------
		
		13. 공백
			- \s
			- 공백 문자 검색(스페이스, 개행, 탭)
			ex) 안녕\s?하세요. -> 안녕하세요. 안녕 하세요.
		        안녕\s{0,1}하세요.
		        
		
		14. 줄임
			- [0-9] -> \d
			ex) 010-[0-9]{3,4}-[0-9]{4}
			ex) 010-\d{3,4}-\d{4}
			
			- [A-Za-z0-9_] -> \w
			ex) [A-Za-z0-9_]{4,12}
			ex) \w{4,12}
		
		15. ^
			- 대상 문자열이 반드시 ^ 뒤의 요소로 시작해야 한다.
			ex) ^abc -> abc(O), testabc(X), atest
		
		16. $
			- 대상 문자열이 반드시 $ 뒤의 요소로 끝나야 한다.
			ex) abc$ -> abc(O), abctest(X), testc
		
		
		
		정규식이 어려운 이유?
		- URL 검색 > 정규식 만들기로.. > URL이 어떤 규칙을 가지는 문자열?????
		- Email -> 규칙?
		
		
		- http://regexlib.com
		- \w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}
		
		test@gmail.com
		hong1234@naver.com
		aaaaaa.com //X
		aaa@test //X
		aaa@test.com
		
		
		
		*/
		
		
		try {
			
			BufferedReader reader = new BufferedReader(new FileReader("test.txt"));
			
			String txt = "";
			String content = "";
			
			while ((txt = reader.readLine()) != null) {
				content += txt + "\r\n";
			}
			
			reader.close();
			
			System.out.println(content);
			System.out.println(content.indexOf("\r\n"));
			System.out.println(content.substring(0, content.indexOf("\r\n")));
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		
	}

}










