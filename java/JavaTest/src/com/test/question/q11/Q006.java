package com.test.question.q11;

import java.io.IOException;

public class Q006 {
	public static void main(String[] args) throws IOException {
		System.out.print("문자 : ");
		char chr =  (char)System.in.read();	//BufferedReader가 좋을까? System.in.read가 좋을까
											//(char)로 형변환하지 않으면 오류 발생
											//Type mismatch: cannot convert from int to char 
		
//		int chr = System.in.read();			//처음부터 int형으로 받으면 강제 형 변환 필요 없다.
		
		if (chr >= 65 && chr <= 90) {		//대문자 주석달기
			System.out.printf("%c\n", chr + 32);
		} else if (chr >= 97 && chr <= 122)	//소문자 주석달기
			System.out.printf("%c\n", chr - 32);
											//알파벳이 아닌 문자에 대해서 예외 처리가 필요.
	}
}
