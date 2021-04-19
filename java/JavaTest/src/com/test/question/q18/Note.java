package com.test.question.q18;

public class Note {
	public void setSize(String size) {
		if(size.equals("A3")) {
			this.price += 400;
			this.size = size;
		}else if(size.equals("A4")) {
			this.price += 200;
			this.size = size;
		}else if(size.equals("A5")) {
			this.price += 0;
			this.size = size;
		}else if(size.equals("B3")) {
			this.price += 500;
			this.size = size;
		}else if(size.equals("B4")) {
			this.price += 300;
			this.size = size;
		}else if(size.equals("B5")) {
			this.price += 100;
			this.size = size;
		}else {
			System.out.println("잘못된 입력입니다.");
		}
      //switch로 짜는게 깔끔했을듯
		
		
	}


	public void setColor(String color) {
		if(color.equals("검정색")) {
			this.price+=100;
			this.color = color;
		}else if(color.equals("흰색")) {
			this.price+=0;
			this.color = color;
		}else if(color.equals("노란색")) {
			this.price+=200;
			this.color = color;
		}else if(color.equals("파란색")) {
			this.price+=200;
			this.color = color;
		}
		//여기도  switch
	}


	public void setPage(int page) {
		if( page > 10 && page <=50) {
			this.price += (page-10) * 10;
			this.page = page;
			this.thickness = "얇은";
		}else if(page <=100) {
			this.price += (page-10) * 10;
			this.page = page;
			this.thickness = "보통인";
		}else if(page <=200) {
			this.price += (page-10) * 10;
			this.page = page;
			this.thickness = "두꺼운";
		}else if(page >200) {
			System.out.println("잘못된 입력형식입니다.");
		}else {
			System.out.println("잘못된 입력형식입니다.");
		}

	}


	public void setOwner(String owner) {
		if(owner.length() >1 && owner.length() <6) {
			this.owner = owner;
			isOwned = true;
		}
		else
			isOwned = false;
	}




	private String size = "A5";			//이게 기본값인가? 아닌가?
	private String color = "흰색";		//이게 기본값인가? 아닌가?
	private int page = 10;
	private String owner;
	private int price = 500;
	private String thickness;
	private boolean isOwned = false;
	private String output="";
	
	public String info(){
		if (isOwned)		//여기서 if로 각 멤버변수 값을 판단해서 가격 결정 가능
			output = "■■■■■■ 노트 정보 ■■■■■■\n"
					+ 	"소유자 : " + owner + "\n"
					+	"특성 : " + color + " " + thickness + " " +size+ " 노트" + "\n"
					+	"가격 : " + price +"원" + "\n"
					+"■■■■■■■■■■■■■■■■■■■■■■■\n";
		else
			output = "■■■■■■ 노트 정보 ■■■■■■\n"
					+	"주인 없는 노트\n"
					+"■■■■■■■■■■■■■■■■■■■■■■■\n";
		return output;
      //String의 +operation
      //String + String은
      //String.append(String)으로
      //"소유자 : ".append(owner)연산으로 진행

      //String + int의 경우
      //String.append(Integer.toString(int)로 변환하여 하나의 문자열로 리턴)
      //"가격 : ".append(Integer.toString(price)) 이런식으로 결합해나감.

      //성능 측면에서 문자열을 여러번 concat 하려는 경우, String + 연산 대신에 StringBuilder나 StringBuffer의 append 메서드를 이용하는 것이 적합하다.
	}
}
