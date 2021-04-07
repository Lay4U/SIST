class Example 
{
    public static void main(String[] args) 
    {

        //요구사항] 정수형 타입의 변수를 만들어 초기화를 하고 그 값을 출력하시오.
        int a = 10;
        int b;

        System.out.println("a : " + a)		//;가 없다
        System.out.println("b : " + b);		//b가 초기화 되지 않았다.
        System.out.println("c : " + c);		//c가 선언되지 않았다.


        //요구사항] 학생의 이름과 키와 몸무게를 출력하시오.
        String name = '홍길동';	//문자열은 " " 
        int height = 180;
        int weight = 72.5;

        System.out.println("학생 이름 : %s\n", name);
        System.out.printf("학생 키 : %dcm\n", name);
        System.out.printf("학생 몸무게 : %dkg\n", weight);

    } //main

}