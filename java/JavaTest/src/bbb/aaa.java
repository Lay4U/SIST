package bbb;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Calendar;

public class aaa {
	
	public static void main(String[] args) throws IOException {
		
	BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
	
//	System.out.print("남자 이름: ");
	
	String str1 = "홍길동";
	
	System.out.print("여자 이름: ");
	
	String str2 = "아무개";
	
	System.out.print("만난날(년): ");
	
	int year = 2020;
	
	System.out.print("만난날(월): ");
	
	int month = 5;
	
	System.out.print("만난날(일): ");
	
	int day = 25;
	System.out.println();
	
	Calendar now = Calendar.getInstance();
	
	now.set(year, month, day);
	
	System.out.printf("'%s'과(와) '%s'의 기념일\n", str1, str2);
	System.out.printf("%tF\n", now);
	System.out.println(now);
	System.out.println(now.get(Calendar.DAY_OF_MONTH));
	System.out.println(now.get(Calendar.MONTH));
	System.out.println(now.get(Calendar.YEAR));
	now.add(Calendar.DAY_OF_MONTH, 100-1);
	System.out.println(now);
	System.out.println(now.get(Calendar.DAY_OF_MONTH));
	System.out.println(now.get(Calendar.MONTH));
	System.out.println(now.get(Calendar.YEAR));
	
	System.out.println();
	
	
	System.out.printf("100일: %tF\n", now);
	System.out.printf("100일: %d-%d-%d\n",now.get(Calendar.YEAR), now.get(Calendar.MONTH), now.get(Calendar.DATE));
	
//	System.out.println(now.getTime());
//	System.out.println(Calendar.DATE);
	// time : 1601717086822
	now.add(Calendar.DAY_OF_MONTH, 100-1);
	System.out.printf("200일: %tF\n", now);
	System.out.printf("200일: %d-%d-%d\n",now.get(Calendar.YEAR), now.get(Calendar.MONTH), now.get(Calendar.DATE));
	
	now.add(Calendar.DAY_OF_MONTH, 100-1);
	System.out.printf("300일: %tF\n", now);
	System.out.printf("300일: %d-%d-%d\n",now.get(Calendar.YEAR), now.get(Calendar.MONTH), now.get(Calendar.DATE));
	
	now.add(Calendar.DAY_OF_MONTH, 200-1);
	System.out.printf("500일: %tF\n", now);
	System.out.printf("500일: %d-%d-%d\n",now.get(Calendar.YEAR), now.get(Calendar.MONTH), now.get(Calendar.DATE));
	
	now.add(Calendar.DAY_OF_MONTH, 500-1);
	System.out.printf("1000일: %tF\n", now);
	System.out.printf("1000일: %d-%d-%d\n",now.get(Calendar.YEAR), now.get(Calendar.MONTH), now.get(Calendar.DATE));
	
	
	
	}//main


}
