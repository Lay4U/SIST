package codereview.one;

//섭씨온도를 입력받아 화씨온도로 변환.
import java.io.*;

public class g {

	public static void main(String[] args) throws IOException {
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		
		double C,F;
		
		System.out.print("섭씨(C): ");
		
		C = Double.parseDouble(reader.readLine());
		
		F = C * 1.8 + 32;
		
		System.out.printf("섭씨 %.1fC는 화씨 %.1fF입니다.", C,F);
	}
}

/*
 * 개행
 * 변수명을 알수 있게, 시작은 소문자
 * c, f를 subCci, hwaCci으로
 * C대신 °C로 F대신 °F로
 */
