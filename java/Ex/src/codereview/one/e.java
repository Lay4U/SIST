package codereview.one;

//사용자의 한달 수입을 입력받아 세후 금액을 출력 .
import java.io.*;
public class e {

	public static void main(String[] args) throws IOException {
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		
		int income;
		
		System.out.print("한달 수입 금액(원): "); 
		
		income= Integer.parseInt(reader.readLine());
		
		final double taxRate = 0.033;
		double tax = income * taxRate; 
		
		System.out.printf("세후 금액(원): %,.0f원\n세금(원): %,.0f원", income-tax, tax);
		
	}

}

/*
	개행
	 int income = 으로 가독성 높이기
	 0.033F에서 F 제거
	final double taxRate = 0.033; 로 세율 바뀔때를 대비
*/


