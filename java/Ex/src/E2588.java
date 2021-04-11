import java.util.Scanner;

public class E2588 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		int num1 = sc.nextInt();
		int num2 = sc.nextInt();
		
		int res1 = num2 % 100 % 10 * num1;
		int res2 = num2 % 100 / 10 * num1;
		int res3 = num2 / 100 * num1;
		int res = res1 + res2*10 + res3*100;
		System.out.println(res1);
		System.out.println(res2);
		System.out.println(res3);
		System.out.println(res);
	}
}
