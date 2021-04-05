package codereview.one;


import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class f{

	public static void main(String[] args) throws IOException {
		
		//요구사항] 영문 소문자를 1차 입력받은 후 대문자로 변환해서 출력하시오 
		//도움 대문자와 소문자의 문자 코드 값 어떤 관계? A ->65 a = 97 (97-65=32) 차이 난다.
		
		BufferedReader reader = (new BufferedReader(new InputStreamReader(System.in)));
		
		System.out.println("문자입력 : ");
		int small = reader.read();
		
		// 한글자만
		int small2 = System.in.read();
		
		int large = small - 32;
		
		System.out.printf("소문자 '%s'의 대문자는'%s'입니다", (char)small,(char)large);	
	}
}
/*		
	println 을 print
	버퍼로 받는게 좋은가? read로 받는게 좋은가?
	한글자만 받아야 하므로 System.in.read로 받는다.
	int선언? short선언? 성능차이?
	 small 대신 smallChar로 변경
*/	