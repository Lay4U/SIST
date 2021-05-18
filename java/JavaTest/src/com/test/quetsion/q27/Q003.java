package com.test.quetsion.q27;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;

public class Q003 {
	public static void main(String[] args) throws IOException {
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));

		String src = "D:\\class\\java\\file\\AAA\\test.txt";
		String dst = "D:\\class\\java\\file\\BBB\\test.txt";

		File srcFile = new File(src);
		File dstFile = new File(dst);

		if (srcFile.exists()) {
			if (dstFile.exists()) {
				System.out.print("같은 이름의 파일이 존재합니다. 덮어 쓸까요(y/n)? : ");
				String yon = reader.readLine();
				if (yon.toLowerCase().equals("y")) {
					srcFile.renameTo(dstFile);
					System.out.println("y. 파일을 덮어썼습니다.");
				} else {
					System.out.println("n. 작업을 취소합니다.");
				}

			} else {
				System.out.println("파일 이동에 성공했습니다.");//renameTo빼먹음. 오류!!!
			}
		} else {
			System.out.println("원본 파일이 존재하지 않습니다.");
		}

	}
}
