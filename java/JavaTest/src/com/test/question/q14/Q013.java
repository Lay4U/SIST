package com.test.question.q14;

import javax.swing.text.StyledEditorKit.ForegroundAction;

public class Q013 {
	public static void main(String[] args) {
		String str = "안녕녕하하하하세요...홍홍홍홍길동입입니다다다다다..";
		int cnt = 0;
		int dupCnt = 0;
		int ctrChr = 0;
		// set으로 길이를 알아오면 편할텐데..
		char[] chr = new char[20];
		for (int i = 0; i < 20; i++)
			chr[i] = 0;
//		for (char a : chr)
//			System.out.println(a);
		for (int i = 0; i < str.length(); i++) {
			for (int j = 0; j < str.length(); j++) {
				if (str.charAt(i) == str.charAt(j)) {
					cnt++;
					for (int k = 0; k < 20; k++) {
						if (chr[k] != str.charAt(i))
							dupCnt++;
						if (k == 19 && dupCnt == 20)
							chr[ctrChr++] = str.charAt(i);
					}
					dupCnt = 0;
//					System.out.print(str.charAt(i) + " ");
//					녕 녕 하 하 하 하 하 하 하 하 하 하 하 하 . . . . . . . . . . . . 홍 홍 홍 홍 홍 홍 홍 홍 홍 홍 홍 홍 입 입 다 다 다 다 다 다 다 다 다 다 다 다 다 다 다 다 다 다 다 다 . . . . . . . . 
				}

//				if( j == str.length()-1) {
//					System.out.printf("'%c' 발견횟수 %d회\n", str.charAt(i), cnt );
//				}

			}
			cnt = 0;
		} // for_1
//		for(char c : chr)
//			System.out.println(c);

		for (int i = 0; i < 20; i++) {
			if (chr[i] == 0)
				continue;
			for (int j = 0; j < str.length(); j++) {
				if (chr[i] == str.charAt(j)) {
					cnt++;
				}
				if (j == str.length() - 1) {
					System.out.printf("'%c' 발견횟수 %d회\n", chr[i], cnt);
					cnt = 0;
				}
			}
		}

	}
}
// 코드가 더러워졌다... 그런데 Set을 사용하지 못하는 이상 이게 최선?
// 클린 코드로 바꾸어 보기를...
// 중복제거 어떻게하나?
//'안' 발견횟수 1회
//'녕' 발견횟수 2회
//'녕' 발견횟수 2회
//'하' 발견횟수 4회
//'하' 발견횟수 4회
//'하' 발견횟수 4회
//'하' 발견횟수 4회
//'세' 발견횟수 1회
//'요' 발견횟수 1회
//'.' 발견횟수 5회
//'.' 발견횟수 5회
//'.' 발견횟수 5회
//'홍' 발견횟수 4회
//'홍' 발견횟수 4회
//'홍' 발견횟수 4회
//'홍' 발견횟수 4회
//'길' 발견횟수 1회
//'동' 발견횟수 1회
//'입' 발견횟수 2회
//'입' 발견횟수 2회
//'니' 발견횟수 1회
//'다' 발견횟수 5회
//'다' 발견횟수 5회
//'다' 발견횟수 5회
//'다' 발견횟수 5회
//'다' 발견횟수 5회
//'.' 발견횟수 5회
//'.' 발견횟수 5회
//안
//녕
//하
//세
//요
//.
//홍
//길
//동
//입
//니
//다
