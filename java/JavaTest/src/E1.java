//import java.io.BufferedReader;
//
//class Example 
//{
//    public static void main(String[] args) 
//    {
//        //요구사항] 숫자를 2개 입력받아 산술 연산을 각각하는 메소드 5개를 선언하고 호출하시오.
//        BufferedReader reader = new BufferedReader(new InputStreamReader(System.in))
//
//        System.out.print("숫자 1 : ");
//        String input1 = reader.readLine();
//
//        System.out.print("숫자 2 : ");
//        String input2 = reader.readLine();
//
//        add(input1, input2);
//        subtract(input1, input2);
//        multiply(input1, input2);
//        divide(input1, input2);
//        mod(input1, input2);
//
//    } //main
//
//    //더하기
//    public static void add(int a, int b)
//    {
//        System.out.printf("%d + %d = %d\n", a, b, a + b);
//    }
//
//    //빼기
//    public static void subtract(int a, int b)
//    {
//        System.out.printf("%d - %d = %f\n", a, b, a - b);
//    }
//
//    //곱하기
//    public static void multiply(int a, int b)
//    {
//        System.out.printf("%d * %d = %d\n", a, a * b);
//    }
//
//    //나누기
//    public static void divide(int a, int b)
//    {
//        System.out.printf("%d / %d = %1.f\n", a, b, a / b);
//    }
//
//    //나머지
//    public static int mod(int a, int b)
//    {
//        System.out.printf("%d % %d = %d\n", a, b, a % b);
//    }
//
//}