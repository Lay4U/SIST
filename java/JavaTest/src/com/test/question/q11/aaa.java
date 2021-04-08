package com.test.question.q11;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class aaa {

   public static void main(String[] args)throws IOException {
      BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));

      System.out.print("문자: ");
      int alphabet = reader.read();
      //13번째 줄에  a를 입력하면
      //Integer.parsInt("a") 이렇게 입력됐어요
      // "a"를 숫자로 변환하지 못해서 아래와 같은 오류를 뿌리네요
      // a를 숫자로 변경하는건 Integer가 아니라 형변환을 통해서 이루어 지면 될거같아요
      // java.lang.NumberFormatException: For input string: "a"
      if(alphabet >= 65 && alphabet <= 90) {
         System.out.printf("%c\n", alphabet + 32);
      } else if (alphabet >= 97 && alphabet <= 122) {
         System.out.printf("%c\n", alphabet - 32);
      }
   }

}