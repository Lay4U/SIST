//술코딩 
//Bugles 객체의 정보
//- 가격, 용량, 생산일자, 유통기한
//
//모든 멤버 변수 접근 지정자는 private으로 한다.
//멤버 접근을 위한 Setter, Getter를 정의한다.
//용량 쓰기 전용, 300g, 500g, 850g
//가격 읽기 전용 850원(300g),1200원(300g)1950원(850g)
//생산일자 : 쓰기 전용(Calendar)
//남은유통기한 : 읽기  전용, 생산된 제품의 유통기한 기준 : 7일(300g),10일(500g),15일(850g)
//Bugles 객체 메소드
//void eat() : 과자 먹기
//
////main
//Bugles snack = new Bugles();
//snace.setSize(500);
//snace.setCreationTIme("오늘기준전후") 2021-04-16 String으로 입력
//syso("가격 : " + snack.getPrice() + "원";
//syso("유통 기한이 " + snvack.getExpireation() + " 일"남았습니다.";
//snack.eat();
//
//Bugles snack2 = new Bugles();
//snack2.setSize(300);
//snack2.setCreationTime("오늘기준젖후")_;
//syso("가격") // 위랑똑같음
//
//getExpiration 메소드 동작은
//유통기한 - 현재 - 제조시간(CreationTime) 을 리턴해줌.
//
//기초코드
//class Bugles{
//접근제어 int price;
//int weight;
// Calendar creationTIme;
// int expiration;
//
//get,set generate

package com.test.question.q20;

import java.util.Calendar;

public class Bugles {

	public int getPrice() throws Exception {
		switch (this.weight) {
		case (300):
			this.price = 850;
			break;
		case (500):
			this.price = 1200;
			break;
		case (850):
			this.price = 1950;
			break;
		default:
			throw new Exception("무게는 300, 500, 850만 지원합니다.");
		}
		return this.price;

	}

	public void setWeight(int weight) throws Exception {
		if (weight == 300 || weight == 500 || weight == 850) {
			this.weight = weight;
		} else {
			throw new Exception("무게는 300, 500, 850만 지원합니다.");
		}
	}

	public void setCreationTime(String creationTime) throws Exception {
		String[] arr = creationTime.trim().replace(" ", "").split("-");
		try {
			this.creationTime.set(Integer.parseInt(arr[0]), Integer.parseInt(arr[1]) - 1, Integer.parseInt(arr[2]));
		} catch (Exception e) {
			throw new Exception("시간형식을 잘못 입력하셨습니다. \"YYYY-MM-DD\" 형식으로 입력해주십시요");
		}
		
		
//		System.out.printf("%tF\n",this.creationTime);
	}

	public int getExpiration() throws Exception {
		Calendar now = Calendar.getInstance();

		switch (this.weight) {
			case 300:
				this.expirationDate = 7;
				break;
			case 500:
				this.expirationDate = 10;
				break;
			case 850:
				this.expirationDate = 15;
				break;
			default:
				throw new Exception("무게는 300, 500, 850만 지원합니다.");	
		}

		long tmp = (this.expirationDate * 24 * 60 * 60 * 1000
				- (now.getTimeInMillis() - this.creationTime.getTimeInMillis())) / 1000 / 60 / 60 / 24;
		expiration = (int)tmp;
//		System.out.println(tmp);
		return (int) expiration;

	}

	public void eat() throws Exception {
		if (getExpiration() >= 0) {
//			System.out.printf("가격 : %d원\n", this.price);
//			System.out.printf("유통기한 : %d일 남았습니다.\n", getExpiration());
			System.out.println("과자를 맛있게 먹습니다.");
		} else {
//			System.out.printf("가격 : %d원\n", this.price);
//			System.out.printf("유통기한 : %d일 남았습니다.\n", getExpiration());
			System.out.println("유통기한이 지나 먹을 수 없습니다.");
		}
	}

	private int price;
	private int weight;
	private Calendar creationTime = Calendar.getInstance();
	private int expiration;
	private int expirationDate;

}
