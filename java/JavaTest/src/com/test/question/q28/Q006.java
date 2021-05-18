package com.test.question.q28;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Stack;

public class Q006 {
	public static void main(String[] args) throws IOException {
		String path = "D:\\class\\java\\file\\파일_입출력_문제\\괄호.java";
		BufferedReader read = new BufferedReader(new FileReader(path));

		String line = "";
		String result = "";
		Stack<Character> bracket = new Stack<Character>();
		Boolean bool = false;

		while ((line = read.readLine()) != null) {
			result += line + "\r\n";
		}
//		System.out.println(result);
		for (int i = 0; i < result.length(); i++) {
			if (result.charAt(i) == '{' || result.charAt(i) == '(' || result.charAt(i) == '[')
				bracket.push(result.charAt(i));
				//{([
			/////// pop->( }<-charAt(i) false
				//  pop->( )<-charAt(i) true
				// (( {   }
			// { 123
			// } 125
			
//			if (result.charAt(i) == '}' || result.charAt(i) == ')' || result.charAt(i) == ']') {
//			if ('{')
//				if ('[') {
//					if ( '(' ) {
						bool = true;
					}
				}
//				if(bracket.pop().equals(result.charAt(i)));
//					bool = true;
//		}
		if(bool && bracket.size()==0) {
			System.out.println("올바른 소스");
		}else {
			System.out.println("잘못된 소스");
		}

	}
}
