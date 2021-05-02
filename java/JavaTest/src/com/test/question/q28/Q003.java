package com.test.question.q28;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;

/*
 *
 * 
홍길동,47,61,73
아무게,37,89,93
유재석,49,37,71
정형돈,40,97,82
박명수,90,87,38
정준하,41,84,77
하하,80,51,40
노홍철,97,47,47
길,70,34,99
전진,88,86,72
황광희,65,43,98
김성수,55,33,60

 */
public class Q003 {
	public static void main(String[] args) throws IOException {
		String path = "D:\\class\\java\\file\\파일_입출력_문제\\성적.dat"; // static

		BufferedReader read = new BufferedReader(new FileReader(path));

		ArrayList<String> pass = new ArrayList<String>();
		ArrayList<String> fail = new ArrayList<String>();

		String line = "";
		while ((line = read.readLine()) != null) {
			String[] temp = line.split(",");// 홍길동,47,61,73
//			System.out.println(temp[0]+" "+temp[1]+" "+temp[2]+" "+temp[3]);
			//Arrays.toString(temp);
			int n1 = Integer.parseInt(temp[1]);
			int n2 = Integer.parseInt(temp[2]);
			int n3 = Integer.parseInt(temp[3]);

			if ((n1 + n2 + n3) / 3 >= 60 && n1 >= 40 && n2 > 40 && n3 >= 40)
				pass.add(temp[0]);
			else
				fail.add(temp[0]);
		}
		
		System.out.println("합격");
		for(String s : pass) {
			System.out.println(s);
		}
		System.out.println();
		System.out.println("불합격");
		for(String s : fail) {
			System.out.println(s);
		}

	}
}
