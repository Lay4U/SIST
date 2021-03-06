package codereview.one;


import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class d {

	
	public static void main(String[] args) throws NumberFormatException, IOException {
		
		
		//요구사항] 자전거 바퀴 지름 26인치 사용자 페달 밟은 횟수 입력하면 자전거가 총 몇 m 달렸는지 출력하시오.
		// 조건 : 기어비는 1:1 , 페달 1회전 = 자건거 바퀴 1회전 , 출력숫자 천단위 표기
		
		
		
		BufferedReader reader = (new BufferedReader(new InputStreamReader(System.in)));
		
		System.out.print("사용자가 페달을 밟은 횟수 : ");
		
		int pedal = Integer.parseInt(reader.readLine());
		System.out.println("휠 인치를 입력해주세요");


		double distance = ((26 * 0.0254)*Math.PI) * pedal ; //(26inch*0.0254m)* pi * 페달 밟은 횟수
		System.out.printf("사용자가 총 %,d회 페달을 밟아 자전거가 총 %,.1fm를 달렸습니다.", pedal,distance);
	}
}

/*
 * System.out.println("사용자가 페달을 밟은 횟수 :");
 * 이 코드를 print로 바꾸고 :뒤에 공백을 넣으면 가독성 늘어남
 * 3.14 -> Math.PI로 바꿈 
 * 1인치 = 0.0254m 변수 선언 
 * 추후 변경을 대비해 휠 크기(변수)와 인치변경값(상수 final double)로 선언해야함
 *	Double wheel = Double.parseDouble(reader.readLine());
	final double inchToMeter = 0.0254;
 *  
 */
