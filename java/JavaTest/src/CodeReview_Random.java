public class CodeReview_Random {
	public static void main(String[] args) {
		String[] crew = { "김정은", "김형래", "문지원", "방수빈", "이준희" };
		int numQuest = 10;
		 
		int random = 0;
		for (int i = 0; i < numQuest; i++) {
			random = (int) (Math.random() * 5);
			System.out.printf("%3d번 문제는 %s님의 코드를 사용합니다.\n", i + 1, crew[random]);
			for (int j = 0; j < 9999999; j++)
				Math.random();
		}
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
