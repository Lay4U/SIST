import java.util.Scanner;

public class E3053 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.println();
		int[] N = new int[10];
		int[] modN = new int[10];
		for (int i = 0; i < 10; i++) {
			N[i] = sc.nextInt();
			modN[i] = N[i] % 42;
		}

		int res = 0;
		int cnt = 0;
		for (int i = 0; i < 10; i++) {
			for (int j = 0; j < 10; j++) {
				if (modN[i] == modN[j] )
					cnt++;
			}
			if( cnt == 0 )
				res++;
		}
		
		for(int i : modN)
			System.out.print(i+" ");
		System.out.println(res);
	}
}
