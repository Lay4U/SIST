package com.test.question.q12;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

   public class Q {
      public static void main(String[] args) throws NumberFormatException, IOException {
         BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
         
         System.out.print("시작 숫자를 입력하세요 : ");
         int startNum = Integer.parseInt(reader.readLine());
         System.out.print("종료 숫자를 입력하세요 : ");
         int endNum = Integer.parseInt(reader.readLine());
         int sum = 0;
         
         for (int i = startNum; i <= endNum; i++) {
            if (sum > endNum) 
               break;
            System.out.print(i);
            
            if (i == endNum) {
               System.out.print(" = ");
            } else {
               System.out.print(" + ");
            }
            sum += i;
         }
         System.out.printf(" = %d", sum);
      }
}

//package com.test.question.q12;
//
//import java.io.BufferedReader;
//import java.io.IOException;
//import java.io.InputStreamReader;
//
//public class Q {
//	public static void main(String[] args) throws NumberFormatException, IOException {
//		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
//
//		System.out.print("시작 숫자를 입력하세요 : ");
//		int startNum = Integer.parseInt(reader.readLine());
//		System.out.print("종료 숫자를 입력하세요 : ");
//		int endNum = Integer.parseInt(reader.readLine());
//
//		int sum = 0;
//
//		for (int i = startNum; i <= endNum; i++) {
//			if (sum > endNum) {
//				System.out.printf("= %d", sum);
//				break;
//			}
//			System.out.printf("%d + ", i);
//
////            if (i == endNum) {
////               System.out.print(" = ");
////            } else {
////               System.out.print(" + ");
////            }
//			sum += i;
//
//		}
////         System.out.printf("%d", sum);
//	}
//}