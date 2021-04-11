import java.util.Scanner;

public class E2884 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int n1 = sc.nextInt();
		int n2 = sc.nextInt();

		
		if (n2 < 45)
			if (n1 == 0) {
				n1 = 23;
				n2 += 15; 
			} else {
				n1 -= 1;
				n2 += 15;
			}
		else
			n2 -= 45;

		System.out.println(n1 + " " + n2);
	}

}
