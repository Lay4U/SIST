package com.test.java.file;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Set;

public class Ex70_File {
	
	public final static String Q004;
	public final static String Q005;
	public final static String Q008;
	public final static String Q009;
	public final static String Q010;
	
	static {
		Q004 = "T:\\java\\file\\파일_디렉토리_문제\\음악 파일";
		Q005 = "T:\\java\\file\\파일_디렉토리_문제\\확장자별 카운트";
		Q008 = "T:\\java\\file\\파일_디렉토리_문제\\폴더 삭제\\delete";
		Q009 = "T:\\java\\file\\파일_디렉토리_문제\\크기 정렬";
		Q010 = "T:\\java\\file\\파일_디렉토리_문제\\직원";
	}
	
	public static void main(String[] args) {
		
		//Ex70_File.java
		//q004();
		//q005();
		//q008();
		//q009();
		q010();
		
		//디렉토리 구조 제어 -> 재귀 호출
		
	}//main

	private static void q010() {
		
		File dir = new File(Q010);
		File[] list = dir.listFiles();
		
		for (File file : list) {
			
			if (file.isFile()) {
				
				//아무게_2014__17.txt
				String[] temp = getName(file.getName());
				System.out.println(Arrays.toString(temp));
				
				//D:\class\java\file\직원\아무개\2014\
				File subDir = new File(Q010 + "\\" + temp[0] + "\\" + temp[1]);
				subDir.mkdirs();
				
				//파일 이동
				file.renameTo(new File(subDir.getAbsoluteFile() + "\\" + file.getName()));
				
			}
			
		}
		
	}

	private static String[] getName(String name) {
		
		//아무게_2014__17.txt
		String[] temp = new String[2];
		
		int index = name.indexOf("_");
		temp[0] = name.substring(0, index); //직원명
		
		int index2 = name.indexOf("_", index+1);
		temp[1] = name.substring(index+1, index2); //년도
		
		return temp;
	}

	private static void q009() {
		
		//폴더의 위치와 상관없이 모든 폴더 내의 파일들을 찾아 한번에 크기를 비교하고, 크기가 큰 순으로 정렬하시오.
		File dir = new File(Q009);
		ArrayList<File> flist = new ArrayList<File>();
		
		addFile(dir, flist);
		
		for (File file : flist) {
			
			System.out.printf("%s\t%s\n", file.getName(), file.getAbsolutePath());
			
		}
		
	}
	
	private static void addFile(File dir, ArrayList<File> flist) {
		
		File[] list = dir.listFiles();
		
		for (File file : list) {
			if (file.isFile()) {
				flist.add(file);
			}
		}
		
		for (File sub : list) {
			if (sub.isDirectory()) {
				addFile(sub, flist);
			}
		}
		
	}

	private static void q008() {
		
		//'delete' 폴더를 삭제하시오.
		// -> 내용물이 있는 폴더는 삭제를 못한다.
		// -> 내용물? -> 파일(빈폴더)
		
		//모든 파일 지우기
		File dir = new File(Q008);
		
		deleteFile(dir);
		
	}

	private static void deleteFile(File dir) {
		
		File[] list = dir.listFiles();
		
		//현재 폴더가 가지는 모든 파일 삭제
		for (File file : list) {
			if (file.isFile()) {
				file.delete();
			}
		}
		
		//자식 폴더로 들어가서 동일한 일을 반복 -> 재귀
		for (File sub : list) {
			if (sub.isDirectory()) {
				deleteFile(sub);
			}
		}
		
		//현재 폴더에는 아무것도 없다
		dir.delete();
	}

	private static void q005() {
		
		//이미지 파일이 확장자별로 있다. 확장자별로 파일이 몇개 있는지 세시오.
		File dir = new File(Q005);
		File[] list = dir.listFiles();
		
		HashMap<String,Integer> count = new HashMap<String,Integer>();
		
		for (File file : list) {
			
			//마우스.gif
			//광.마우스.gif
			//System.out.println(file.getName());
			String ext = file.getName().substring(file.getName().lastIndexOf(".")+1);
			//System.out.println(ext);
			
			if (count.containsKey(ext)) {
				count.put(ext, count.get(ext) + 1); //count = count + 1
			} else {
				count.put(ext, 1);
			}
			
		}
		
		//출력
		System.out.printf(".gif: %d개\n", count.get("gif"));
		System.out.printf(".jpg: %d개\n", count.get("jpg"));
		System.out.printf(".png: %d개\n", count.get("png"));
		System.out.printf(".txt: %d개\n", count.get("txt"));
		System.out.println();
		
		//HashMap -> 루프
		Set<String> keys = count.keySet();
		
		for (String key : keys) {
			//System.out.println(key);
			System.out.printf(".%s: %d개\n", key, count.get(key));
		}
		
	}

	private static void q004() {
		
		//음악 파일이 100개 있다. 파일명 앞에 일련 번호를 붙이시오.
		//listFiles() + renameTo()
		
		File dir = new File(Q004);
		File[] list = dir.listFiles(); //****
		
		int temp = 0;

		for (int i=0; i<list.length; i++) {
			
			//System.out.println(list[i].getName());
			
			String filename = list[i].getName();
			
			if (filename.toLowerCase().endsWith(".mp3")) {
				
				//음악 파일만
				//System.out.println(filename);
				
				filename = String.format("[%03d]%s", (temp+1), filename); //****
				System.out.println(filename);
				temp++;
				
				//파일명 바꾸기
				list[i].renameTo(new File(Q004 + "\\" + filename)); //****
				
			}			
			
		}
		
		
	}
	
	

}





































