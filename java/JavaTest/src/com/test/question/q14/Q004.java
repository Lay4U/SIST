package com.test.question.q14;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Q004 {
	public static void main(String[] args) throws IOException {
//		String n1 = "dog.gif";
//		System.out.println(n1.lastIndexOf("."));
//		System.out.println(n1.substring(n1.lastIndexOf(".")+1));
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));

		int gifN = 0;
		int jpgN = 0;
		int pngN = 0;
		int hwpN = 0;
		int docN = 0;
		for (int i = 0; i < 10; i++) {
			System.out.print("파일명 : ");
			String n = reader.readLine();
//			if (n.substring(n.lastIndexOf(".") + 1).equals("gif")) 지저분하다
			
			if (n.endsWith("gif"))
				gifN++;
			else if (n.endsWith("jpg"))
				jpgN++;
			else if (n.endsWith("png"))
				pngN++;
			else if (n.endsWith("hwp"))
				hwpN++;
			else if (n.endsWith("doc"))
				docN++;
			else {
				System.out.println(n.substring(n.lastIndexOf(".") + 1) + "은 지원하지 않는 문자열입니다.");
				System.out.println();
			}
		}

		System.out.printf("gif : %d개\n", gifN);
		System.out.printf("jpg : %d개\n", jpgN);
		System.out.printf("png : %d개\n", pngN);
		System.out.printf("hwp : %d개\n", hwpN);
		System.out.printf("doc : %d개\n", docN);

	}
}
