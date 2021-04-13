package com.test.question.q14;

public class Q005 {
	public static void main(String[] args) {
//		String str = "afsda길동adfasf길동adfasf길동";
//		String word = "길동";
//		int index = str.indexOf(word);
//		System.out.println(str.indexOf(word));
		
		String str = "asdfasdfasfa길동afdasfads길동adfasdf길동adfasf길동";
		String word = "길동";
		int index = 0;
		int cnt = 0;
		
		while(true) {
			if(str.indexOf(word, index) > -1) {
				index = str.indexOf(word, index);
				cnt++;
			}else {
				break;	//indexOf값이 -1이면 break
				//여기서 print 가능.
			}
			index += word.length();
		}
		System.out.printf("'%s'을(를) 총 %d회 발견했습니다.", word, cnt);
	}
}
