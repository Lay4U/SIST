package codereview.one;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class b {

	public static void main(String[] args)throws IOException {
		
		
	  BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
	
	 System.out.print("첫번째 숫자: ");
	 String data1 = reader.readLine();
	 int first = Integer.parseInt(data1);
	 
	 System.out.print("두번째 숫자: ");
	 String data2 = reader.readLine();
	 int second = Integer.parseInt(data2);
	 
	 System.out.printf("%,d + %,d = %,d\n",first, second, (first+second));
	 System.out.printf("%,d - %,d = %,d\n",first, second, (first-second));
	 System.out.printf("%,d * %,d = %,d\n",first, second, (first*second));
	 System.out.printf("%,d / %,d = %.1f\n",first, second,(double)(first/second));
	 System.out.printf("%,d %% %,d = %,d\n",first, second, first%second);
	}
}

/*
 *  (double)first / second 는
 *  double / int 이므로 double형
 *  (double) (first / second) 는 (double) 5/3
 *  (dobule) (int / int) 이므로 는 (double) 1
 *  (double) (int) 가 되어서		는 (dobule) 1
 *  (double)이 된다				는 	1.000000000
 *  
 *  따라서 int 형의 계산의 double / int 형으로 해야한다

  * 여러개의 float으로 형변환 가능하지만 한번의 double이 명료함
  * first, secend를 firstNumber, secondNumber로 바꿈
  */