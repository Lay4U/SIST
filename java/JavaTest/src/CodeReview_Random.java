public class CodeReview_Random {
	public static void main(String[] args) {
		//13번 -> 3,5,6,7,9,11 
		String[] crew = { "김정은", "김형래", "문지원", "방수빈", "이준희" };
		int numQuest = 1  ;
		int cnt1=0, cnt2=0, cnt3=0, cnt4=0, cnt5=0;
		int random = 0;
		for (int i = 0; i < numQuest; i++) {
			random = (int) (Math.random() * 5);
			System.out.printf("%3d번째 문제는 %s님이 풉니다.\n", i + 1, crew[random]);
			if(random == 0) cnt1++; else if(random == 1) cnt2++; else if (random == 2) cnt3++; else if (random == 3) cnt4++; else if (random == 4) cnt5++;
			for (int j = 0; j < 99999999; j++)
				Math.random();
		}
		System.out.printf("%3d %d %d %d %d\n", cnt1, cnt2, cnt3, cnt4, cnt5);
	}
}


/*
public class CodeReview_Random {
	public static void main(String[] args) {
		String[] crew = { "김정은", "김형래", "문지원", "방수빈", "이준희" };
		int numQuest = 10;
		//2 4 5 6 7 8 
		int random = 0;
		for (int i = 0; i < numQuest; i++) {
			random = (int) (Math.random() * 5);
//			System.out.println(random);
//			System.out.println(Math.random());
			System.out.printf("%3d번 문제는 %s님의 코드를 사용합니다.\n", i + 1, crew[random]);
			for (int j = 0; j < 100000; j++)
				Math.random();
		}

//		int c1 = 0, c2 = 0, c3 = 0, c4 = 0, c5 = 0;
//		for (int i = 0; i < 100000000; i++) {
//			random = (int) (Math.random() * 5);
//			if (random == 0)
//				c1++;
//			else if(random == 1)
//				c2++;
//			else if(random == 2)
//				c3++;
//			else if(random == 3)
//				c4++;
//			else if(random == 4)
//				c5++;
	}
}
*/
//if(random == 0) cnt1++; else if(random == 1) cnt2++; else if (random == 2) cnt3++; else if (random == 3) cnt4++; else if (random == 4) cnt5++;
/*
if(cnt1>2 || cnt2>2 || cnt3>2 || cnt4>2 || cnt5>2 || cnt1==0 || cnt2==0 || cnt3==0 || cnt4==0 || cnt5==0) {
System.out.println("다시 출력합니다.");
cnt1=0; cnt2=0; cnt3=0; cnt4=0; cnt5=0;
for (int i = 0; i < numQuest; i++) {
	random = (int) (Math.random() * 5);
	System.out.printf("%3d번 문제는 %s님의 코드를 사용합니다.\n", i + 1, crew[random]);
	if(random == 0) cnt1++; else if(random == 1) cnt2++; else if (random == 2) cnt3++; else if (random == 3) cnt4++; else if (random == 4) cnt5++;
	for (int j = 0; j < 9999999; j++)
		Math.random();
}
System.out.printf("%d %d %d %d %d", cnt1, cnt2, cnt3, cnt4, cnt5);
}
*/