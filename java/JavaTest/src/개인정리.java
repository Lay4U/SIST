
public class 개인정리 {
	public static void main(String[] args) {

	}
}

//Calender Class
//
//Calendar 변수명 = Calendar.getInstance();
//System.out.println(now.get(Calendar.YEAR));			//년
//System.out.println(now.get(Calendar.MONTH));		//월 (0월~11월)
//System.out.println(now.get(Calendar.DATE));			//일
//System.out.println(now.get(Calendar.HOUR));			//시
//System.out.println(now.get(Calendar.MINUTE));		//분
//System.out.println(now.get(Calendar.SECOND));		//초
//System.out.println(now.get(Calendar.MILLISECOND));	//밀리초
//System.out.println(now.get(Calendar.AM_PM));		//오전(0), 오후(1)
//System.out.println(now.get(Calendar.DAY_OF_MONTH));	//일(Date)
//System.out.println(now.get(Calendar.DAY_OF_WEEK));	//요일. 일(1)~토(7) 
//System.out.println(now.get(Calendar.DAY_OF_YEAR));	//올해들어 며칠째?
//System.out.println(now.get(Calendar.HOUR_OF_DAY));	//지금까지 시간(24H)
//System.out.println(now.get(Calendar.WEEEK_OF_YEAR));//몇주차
//
//void	set(int field, int value)
//Sets the given calendar field to the given value.
//void	set(int year, int month, int date)
//Sets the values for the calendar fields YEAR, MONTH, and DAY_OF_MONTH.
//void	set(int year, int month, int date, int hourOfDay, int minute)
//Sets the values for the calendar fields YEAR, MONTH, DAY_OF_MONTH, HOUR_OF_DAY, and MINUTE.
//void	set(int year, int month, int date, int hourOfDay, int minute, int second)
//Sets the values for the fields YEAR, MONTH, DAY_OF_MONTH, HOUR, MINUTE, and SECOND.
//
//add(int field, int amount)
//Adds or subtracts the specified amount of time to the given calendar field, based on the calendar's rules.


//날짜 세기

//public class Q002 {
//	public static void main(String[] args) {
//		Calendar now = Calendar.getInstance();
//		now.add(Calendar.DATE, 100 - 1);
//		System.out.printf("백일 : %tF\n", now);
//
////		now.add(Calendar.DATE, 265 - 1);
//		//윤년이 포함됐는지 안됐는지 모르므로 이렇게 짜지 말자
//		
//		//리셋해서 다시
//		now = Calendar.getInstance();
//		now.add(Calendar.YEAR, 1);
//		// 이게 맞는 코드이다.
//		
//		//월, 년에대한 산술연산은 반드시 add Month, year로 하자.
//		System.out.printf("첫돌 : %tF\n", now);
//
//	}
//}

//String에서 split할때 정규표현식으로 쓰이므로
//.으로 확장자 구별할때는 \을 붙여서 사용해야 한다!

/**
* 문서 주석
* -> 사용시 말풍선 도움말 -> team project에 도움
* 이 주석만 모아서 별도의 도움말 파일 생성 가능 > javadoc.exe
**/