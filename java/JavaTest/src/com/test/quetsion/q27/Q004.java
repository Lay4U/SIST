package com.test.quetsion.q27;

import java.io.File;

public class Q004 {
	public static void main(String[] args) {
		String path = "D:\\class\\java\\file\\음악 파일\\Music";
		File f = new File(path);
		File[] fl = f.listFiles();
		int cnt = 1;
		for(File t : fl) {
			System.out.printf("[%03d]%s\n",cnt++,t.getName());
		}
	}
}
