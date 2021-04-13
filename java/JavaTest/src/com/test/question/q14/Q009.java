package com.test.question.q14;

public class Q009 {
	public static void main(String[] args) {
		String str = "잘 생각해봐 바보 멍청이 바보 바보 멍청이";
		System.out.println(str.indexOf("바보"));
		int index = 0;
		

		int cnt=0;
		
		while (true) {
			// TODO replace대신 substring으로 구현해서 여러번 count 되도록
			if(str.indexOf("바보", index) > -1) {
				index = str.indexOf("바보", index);
				str = str.replace("바보", "**");
				index+=2;
				cnt++;
			}
			else if(str.indexOf("멍청이", index) > -1) {
				index = str.indexOf("멍청이", index);
				str = str.replace("멍청이", "***");
				index+=2;
				cnt++;
			}
			else
				break;
		}
		System.out.println(str);
		System.out.println("금지어를 " + cnt+"회 입력했습니다.");
	}
}

