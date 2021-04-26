

public class E4673 {

   public static void main(String[] args) {
   
   int sum = 0;
   String s = "";

   for(int i=1; i<=100 ;i++) {
      for(int j=1; j<=i ; j++) {
         if(i%j == 0) { //나머지가 0인 수
            sum += j;
            
            if((sum-i) == i) { //전체 약수 합 - 자신 수 = 자기 자신 //완전수 구하기
               s += i + " = " + "[ ";
               for(int k=1; k<i; k++) {
                  if(i%k == 0) {//완전수의 약수 구하기
                     s += k + " ,";
                    
                  }
               }
               s = s.substring(0, s.length() -1) + "]\n";
               System.out.print(s);
               
               }
            
            }
         
      }
      
      sum = 0;
      s = "";
   }//for문
   
   }//main
   
}
