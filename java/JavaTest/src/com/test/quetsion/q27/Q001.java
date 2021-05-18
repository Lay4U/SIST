package com.test.quetsion.q27;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;

public class Q001 {
	public static void main(String[] args) throws IOException {
//		D:\class\java\file\test.txt
//		String s = "D:\\class\\java\\file\\test.txt";
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		System.out.print("파일 경로 : ");
		String path = reader.readLine();
		File f = new File(path);

		System.out.println("파 일 명 : " + f.getName());
		System.out.println("종    류 : " + f.getName().substring(f.getName().length() - 4, f.getName().length()));
//		System.out.println("파일크기 : " +f.length());

		String whichByte = "";
		long fileSize = f.length();
		final int convertUnit = 1024;
		if (fileSize < convertUnit)
			whichByte += fileSize + "B";
		else if (fileSize < convertUnit * convertUnit)
			whichByte += fileSize / convertUnit + "KB";
		else if (fileSize < convertUnit * convertUnit * convertUnit)
			whichByte += fileSize / convertUnit / convertUnit + "MB";
		else if (fileSize < convertUnit * convertUnit * convertUnit * convertUnit)
			whichByte += fileSize / convertUnit / convertUnit / convertUnit + "GB";
		else // if(fileSize < convertUnit*convertUnit*convertUnit*convertUnit*convertUnit)
			whichByte += fileSize / convertUnit / convertUnit / convertUnit + "PB";

		System.out.println("파일크기 : " + whichByte);
	}
}
