package com.test.question.q11;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Calendar;

public class Q008 {
	public static void main(String[] args) throws NumberFormatException, IOException {
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		System.out.println("[들어온 시간]");
		System.out.print("시 : ");
		int entryHour = Integer.parseInt(reader.readLine());
		System.out.print("분 : ");
		int entryMinute = Integer.parseInt(reader.readLine());

		System.out.println("[나간 시간]");
		System.out.print("시 : ");
		int exitHour = Integer.parseInt(reader.readLine());
		System.out.print("분 : ");
		int exitMinute = Integer.parseInt(reader.readLine());
		System.out.println();
		

		//Method 1			//나간 총 분      					들어온 총 분
		int totalMinute = (exitHour * 60 + exitMinute) - (entryHour * 60 + entryMinute);
//		System.out.println(totalMinute);
		int totalCharge = (totalMinute - 30) / 10 * 2000;	//주차요금, 기본요금, 10분단위 변수로 생성해야하나? 상수로 넣어야하나?
															//유효성 검사 필요 totalminute이 30이상이여야 계산 가능.
															//30분이하면 무료
		
		System.out.printf("주차 요금은 %,d원 입니다.\n", totalCharge);
		//기준이 분단위 이므로 분을 기준으로 계산
		
//////////////////////////////////////////////////////////////////////////////////////////////////////////

		//Method 2
		Calendar entryTime = Calendar.getInstance();
		Calendar exitTime = Calendar.getInstance(); 

		entryTime.set(Calendar.DATE, -1);		//이 코드가 필요한가에 대한 의문 기준점 설정에대한 기준
		entryTime.set(Calendar.HOUR, entryHour); //HOUR_OF_DAY로 변경해야 정확한 값을 갖는다.
		entryTime.set(Calendar.MINUTE, entryMinute);
		entryTime.set(Calendar.SECOND, 0);		// 초는 동일하게 0초로

		exitTime.set(Calendar.DATE, -1);
		exitTime.set(Calendar.HOUR, exitHour);	//HOUR_OF_DAY로 변경해야 정확한 값을 갖는다.
		exitTime.set(Calendar.MINUTE, exitMinute);
		exitTime.set(Calendar.SECOND, 0);

		Long entryTick = entryTime.getTimeInMillis();
		Long ExitTick = exitTime.getTimeInMillis();

		Long totalTick = ExitTick - entryTick;
//		System.out.println(totalTick);
		totalTick = totalTick / 1000 / 60;		//유효성 검사 필요 totalTick이 30분 이상이여야 계산 가능.
			
		System.out.printf("주차 요금은 %,d원 입니다.\n", (totalTick - 30) / 10 * 2000);
	}
}
