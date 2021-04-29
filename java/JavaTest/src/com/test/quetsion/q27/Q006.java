package com.test.quetsion.q27;

import java.io.File;

public class Q006 {
	private static int cnt = 0;

	public static void main(String[] args) {
		String path = "D:\\class\\java\\file\\폴더 삭제\\delete";
		File f = new File(path);
		if (f.exists()) {
			recursiveSearch(f);
		}

		System.out.println("총 " + cnt + "개의 파일을 삭제했습니다.");

	}

	private static void recursiveSearch(File dir) {

		File[] list = dir.listFiles();
//		for (File f : list) {
//			System.out.println(f.getName());
//		}
		for (File sub : list) {
			if (sub.isFile()) {
//				System.out.println(sub.length());
				if (sub.length() == 0) {
					System.out.println(sub.delete());
					cnt++;
				}

			}
		}

		for (File sub : list) {
			if (sub.isDirectory()) {
				recursiveSearch(sub);
			}
		}
	}
}
