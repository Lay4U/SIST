package com.test.question.q17;

public class Book {

	public void setTitle(String title) {
		Boolean isValid = false;
		if(title.length() > 50 ) {
			System.out.println("잘못된 입력입니다.");
			return;
		}
		for(int i=0; i<title.length(); i++) {
			char validCheck = title.charAt(i); 
			if(validCheck > 'a' && validCheck < 'z' )
				isValid = true;
			else if(validCheck > 'A' && validCheck < 'Z')
				isValid = true;
			else if(validCheck > '0' && validCheck < '0')
				isValid = true;
			else if(validCheck > '가' && validCheck < '힣')
				isValid = true;
		}
		if(isValid)
			this.title = title;
		else 
			System.out.println("잘못된 입력입니다.");
		
	}

	public String getTitle() {
		return this.title;
	}

	public void setPrice(int price) {
		if(price >=0 && price <=1000000)
			this.price = price;
		else
			System.out.println("잘못된 입력입니다.");
	}

	public int getPrice() {
		return this.price;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getAuthor() {
		return this.author;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}


	public String getPubYear() {
		return this.pubYear;
	}

	public void setISBN(String ISBN) {
		this.ISBN = ISBN;
	}

	public String getISBN() {
		return this.ISBN;
	}
	
	public void setPage(int page) {
		if (page >0)
			this.page = page;
		else
			System.out.println("잘못된 정보입니다.");
	}
	
	public int getPage() {
		return this.page;
	}

	public String info(){
		return 	"책에 대한 모든 정보입니다.\n"
				+"title : " + this.title + "\n"
				+"price : " + this.price + "\n" //title.concat("문자열 + 문자열")
				
				+"author: " + this.author + "\n"
				+"publisher : " + this.publisher + "\n"
				+"pubYear : " + this.pubYear + "\n"
				+"ISBN : " + this.ISBN + "\n"
				+"page : " + this.page + "\n";
				
	}
	private String title;
	private int price;
	private String author;
	private String publisher;
	private String pubYear = "2021";
	private String ISBN;
	private int page;

//	제목 읽기/쓰기 최대50자(영,한,숫+공백)
//	가격 읽기쓰기 0~1000000
//	저자 읽기쓰기, 제한없음
//	페이지수 읽기쓰기
//	출판사 쓰기
//	발행년도 읽기
//	ISBN 읽기/쓰기

}
