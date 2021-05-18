package com.test.question.q17;

public class MainClass {
	public static void main(String[] args) {
		
		Book b1 = new Book();
		
		b1.setAuthor("Kernighan, Brian W. , Ritchie, Demmos M. Ritchie, Dennis");
		System.out.println(b1.getAuthor());
		
		b1.setISBN("9780131103627");
		System.out.println(b1.getISBN());
		
		b1.setPage(271);
		System.out.println(b1.getPage());
		
		b1.setPrice(50000);
		System.out.println(b1.getPrice());
		
		b1.setPublisher("Prentice Hall Software");
//		b1.getPublisher 쓰기전용
		
		b1.setTitle("The C Programming Language 한글 테스트");
		System.out.println(b1.getTitle());
		
		System.out.println(b1.getPubYear());
		
		System.out.println();
		
		System.out.println(b1.info());
	}
}
