package com.test.review.q3_4;

import java.io.*;

public class Q4_8 {
	public static int getApple(int sunny, int cloud) {
		return ((sunny * 5) + (cloud * 2) - 100) / 10;
	}

	public static void main(String[] args) throws IOException {
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		System.out.print("맑은 날:");	// : 다음 띄어쓰기
		int sunny = Integer.parseInt(reader.readLine());	// 개행 하면 가독성이 높아질듯
		System.out.print("흐린 날:");	// : 다음 띄어쓰기
		int cloud = Integer.parseInt(reader.readLine());

		System.out.printf("사과가 총 %d개 열렸습니다.", getApple(sunny, cloud));
	}

}
/*
 * 유효성 검사 필요 : 0, 0이 입력되면 -n개가 나오므로 최소의 값을 받아야 한다.
 * 
 */
