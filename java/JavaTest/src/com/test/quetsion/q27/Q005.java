package com.test.quetsion.q27;

import java.io.File;
import java.util.HashMap;

public class Q005 {
	public static void main(String[] args) {

		String path = "D:\\class\\java\\file\\확장자별 카운트";
		File f = new File(path);
		File[] fl = f.listFiles();
		HashMap<String, Integer> fileList = new HashMap<String, Integer>();

		for (File t : fl) {
			if (t.isFile()) {
				String[] arr = t.getName().split("\\.");
//				arr[0] 이름
//				arr[1] 확장자
//				[0].[1]
				for (int i = 1; i < arr.length; i += 2) {
//					System.out.println(arr[i]);
					if(fileList.get(arr[i]) == null) //containskey
						fileList.put(arr[i], 1);
					else
						fileList.put(arr[i], fileList.get(arr[i])+1);
				}
			}
		}
		
		for(String key : fileList.keySet()) {
			System.out.println(key);
			System.out.println(fileList.get(key));
		}

	}
}
