package com.test.question.q28;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

public class Q002 {
	public static void main(String[] args) throws IOException {
		String path = "D:\\class\\java\\file\\파일_입출력_문제\\숫자.dat";
		
		String result = "";
		String temp = "";
		
		BufferedReader read = new BufferedReader(new FileReader(path));
		while((temp = read.readLine()) != null) {
			result += temp + "\r\n";
		}
		
//		System.out.println(result);
		result = result.replace("0", "영");
		result = result.replace("1", "일");
		result = result.replace("2", "이");
		result = result.replace("3", "삼");
		result = result.replace("4", "사");
		result = result.replace("5", "오");
		result = result.replace("6", "육");
		result = result.replace("7", "칠");
		result = result.replace("8", "팔");
		result = result.replace("9", "구");
//		System.out.println(result);
		
		FileWriter fw = new FileWriter(path);
		fw.write(result);
		fw.close();
	}
}
