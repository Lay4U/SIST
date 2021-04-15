package com.test.question.q15;

public class Q004 {
	public static void main(String[] args) {
		int N = 20;
		int[] randNum = new int[N];

		for (int i = 0; i < N; i++) {
			randNum[i] = (int) (Math.random() * 19) + 1; // *20으로 바꿔야한다.
		}
//		for(int i:randNum)
//			System.out.println(i);
		int max = Integer.MIN_VALUE;
		int min = Integer.MAX_VALUE;
		for (int i = 0; i < N; i++) {
			if (max < randNum[i])
				max = randNum[i];
			if (min > randNum[i])
				min = randNum[i];
		}

		System.out.print("원본 : ");
		String res = "";
		for (int i : randNum)
			res += i + ", ";
		res = res.substring(0, res.length() - 2);
		System.out.print(res);
		System.out.println();
		System.out.printf("최댓값 : %d\n", max);
		System.out.printf("최솟값 : %d\n", min);
	}
}
