package com.test.quetsion.q27;

import java.io.BufferedReader;
import java.io.File;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.HashMap;

public class Q002 {
	public static void main(String[] args) throws Exception {
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));

		System.out.print("폴더 선택");
		String path = "D:\\class\\java\\file";
		System.out.print("파일 확장자 : ");
//		String fileExtension = reader.readLine();
		System.out.println();
		String fileExtension = "java";
		File f = new File(path);
		File[] fl = f.listFiles();
//		HashMap<String, Integer> sl = new HashMap<String, Integer>();
		ArrayList<String> sl = new ArrayList<String>();
		for (File list : fl) {
			if (list.isFile()) {
				String[] arr = list.getName().split("\\.");
//				System.out.println(arr[1]);
				if (arr[1].equals(fileExtension)) {
					sl.add(arr[0] + "." + arr[1]);

				}
			}
			for (int i = 0; i < sl.size(); i++) {
				System.out.println(sl.get(i));
			}
		}
	}
}
