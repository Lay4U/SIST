package com.test.question.q18;

public class Main {
	public static void main(String[] args) throws Exception {
		Note note = new Note();
		note.setSize("B4");
		note.setColor("노란색");
		note.setPage(25);
		note.setOwner("홍길동");
		System.out.println(note.info());
		
		Note note2 = new Note();
		note2.setSize("A4");
		note2.setColor("검정색");
		note2.setPage(100);
		System.out.println(note2.info());
		
		Note note3 = new Note();
		note3.setSize("A3");
		note3.setColor("파란색");
		note3.setPage(77);
		note3.setOwner("아무개");
		System.out.println(note3.info());
	}
}
