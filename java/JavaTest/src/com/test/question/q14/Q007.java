package com.test.question.q14;

public class Q007 {
	public static void main(String[] args) {
		String str = "1234567";

		char[] res = new char[str.length() + str.length() / 3]; // 배열 없이 풀 수 있는 방법 생각해보기
		// str의 맨 뒷 문자열을 저장하면 된다.
		int cnt = 0;
		int len = str.length() - 1;

		for (int i = res.length - 1; i >= 0; i--) {
			res[i] = (char) str.charAt(len);
			cnt++;
			len--;
			if (cnt == 3) {
				cnt = 0;
				i--;
				res[i] = (char) ',';
			}
//			cnt++;
//			if(cnt == 3)
//				System.out.print(", ");
		}
		System.out.println(res);
	}
}
