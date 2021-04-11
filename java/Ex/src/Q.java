

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Q {
   
   public static void main(String[] args) throws NumberFormatException, IOException {
      
      BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
      
      System.out.print("첫번째 숫자: ");
      int firstNum = Integer.parseInt(reader.readLine());
      
      System.out.print("두번째 숫자: ");
      int secondNum = Integer.parseInt(reader.readLine());
      
      System.out.print("연산자: ");
      String operator = reader.readLine();
      
      
      if (operator.equals("+")){
         System.out.printf("%d %s %d = %,1d", firstNum, operator, secondNum, firstNum + secondNum);
         
      } else if (operator.equals("-")) {
         System.out.printf("%d %s %d = %,1d", firstNum, operator, secondNum, firstNum - secondNum);
         
      } else if (operator.equals("*")) {
         System.out.printf("%d %s %d = %,1d", firstNum, operator, secondNum, firstNum * secondNum);
         
      } else if (operator.equals("/")) {
         System.out.printf("%d %s %d = %,1d", firstNum, operator, secondNum, firstNum / secondNum);
         
      } else if (operator.equals("%")) {
         System.out.printf("%d %s %d = %,1d", firstNum, operator, secondNum, firstNum % secondNum);
      }

   
   }//main
      

}//class

