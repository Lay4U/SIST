package com.test.question.q28;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

public class Q001 {
	public static void main(String[] args) throws IOException {
		String path = "D:\\class\\java\\file\\파일_입출력_문제\\이름수정.dat";
		
		BufferedReader reader = new BufferedReader(new FileReader(path));
		String result = "";
		String temp="";
		while((temp = reader.readLine()) != null) {
//			System.out.println(result);
			result += temp + "\r\n";
		}
//		System.out.println(result);
		
		result = result.replace("유재석", "메뚜기");
		
//		System.out.println(result);
		String path2 = "D:\\class\\java\\file\\파일_입출력_문제\\이름수정2.dat";
		try {
			FileWriter fw = new FileWriter(path2);
			fw.write(result);
			fw.close();	
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
		
		
	}
}
