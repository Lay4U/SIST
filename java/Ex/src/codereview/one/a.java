package codereview.one;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class a {
	
	public static void main(String[] args) throws NumberFormatException, IOException {
		
		//요구사항] 태어난 년도를 입력 > 나이를 출력
		
//		나의 답 :
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		
		System.out.print("태어난 년도: ");
		
		int year = Integer.parseInt(reader.readLine());
		
		System.out.printf("나이: %d세\n", (2021 - year + 1));
	}
}

/*
	//999999999999 exception
	// naming -> year 대신 birthYear
	//연도30000미만 자료형에 맞추어 int -> short 하면은 성능차이가 나는가??
	//마지막 출력에 \n 은 개인 취향
	 
*/
