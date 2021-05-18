package com.test.question.q16;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Q007 {
	public static void main(String[] args) throws NumberFormatException, IOException {
		String[][] score = new String[3][10];
//		int korScore = 80;
//		int engScore = 50;
//		int mathScore = 70;
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		System.out.print("국어 점수 : ");
		int korScore = Integer.parseInt(reader.readLine());
		System.out.print("영어 점수 : ");
		int engScore = Integer.parseInt(reader.readLine());
		System.out.print("수학 점수 : ");
		int mathScore = Integer.parseInt(reader.readLine());
		
		int[] scoreCalc = new int[3];
		scoreCalc[0] = korScore / 10;
		scoreCalc[1] = engScore / 10;
		scoreCalc[2] = mathScore / 10;

		for (int i = 0; i < score.length; i++) {
			for (int j = 0; j < scoreCalc[i]; j++) {
				score[i][j] = "■";
			}
		}
		for (int i = 0; i < score.length; i++) {
			for (int j = 0; j < score[i].length; j++) {
				if (score[i][j] == null)
					score[i][j] = " ";
			}
		}
		output(score);
		System.out.println("--------------");
		System.out.println("국어 영어 수학");
	}

	private static void output(String[][] arr) {
		for (int i = arr[0].length-1; i >= 0; i--) {
			for (int j = 0; j < arr.length; j++) {
				System.out.printf("%3s ", arr[j][i]);
			}
			System.out.println();
		}
	}

}
