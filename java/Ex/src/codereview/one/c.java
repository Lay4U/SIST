package codereview.one;


import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class c {
	public static void main(String[] args) throws NumberFormatException, IOException {
		System.out.print("너비(cm) : ");
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		double width = Double.parseDouble(reader.readLine());
		System.out.print("높이(cm) : ");
		double height = Double.parseDouble(reader.readLine());
		System.out.println();

		System.out.printf("사각형의 넓이는 %.0f㎠ 입니다.\n", width * height);
		System.out.printf("사각형의 둘레는 %.0fcm 입니다.\n", width * 2 + height * 2);
	}
}
/*
 
	int? double? 너비 높이 범위가 실수여서 
	입력값에 따라 int, or double을 결정
	double 소수점 2번째로 변경해야한다.
 	단위가 커질때를 대비해서 %,를 사용
*/
