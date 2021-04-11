import java.util.Scanner;

public class E11022 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int n = sc.nextInt();

		for (int i = 1; i <= n; i++) {
			int n1 = sc.nextInt();
			int n2 = sc.nextInt();
			System.out.printf("Case #%d: %d + %d = %d\n", i, n1, n2, n1 + n2);
		}

	}
}
