package com.test.java;

public class Ex08_Output {
public static void main(String[] args) {
			String name1 = "홍길동";

			int kor1 = 98;

			int eng1 = 95;

			int math1 = 85;

			String name2 = "김아무개";

			int kor2 = 81;

			int eng2 = 79;

			int math2 = 88;

			System.out.println("==========");

			System.out.println("==성적표===");

			System.out.println("==========");

			System.out.println("[이름]\t[국어]\t[영어]\t[수학]"); // 테이블 머릿말, table header;

			System.out.print(name1);

			System.out.print("\t");

			System.out.print(kor1 + "\t");

			System.out.print(eng1 + "\t");

			System.out.print(math1 + "\n");

			System.out.println(name2 + "\t" + kor2 + "\t" + eng2 + "\t" + math2);
}
}
