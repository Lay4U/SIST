

import java.util.Iterator;
import java.util.Scanner;

public class E10818 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int n = sc.nextInt();
		int min = Integer.MAX_VALUE;
		int max = Integer.MIN_VALUE;
		int[] arr = new int[n];
		for (int a : arr) {

			a = sc.nextInt();
			min = a < min ? a : min;
			max = a > max ? a : max;
		}
		System.out.printf("%d %d", min, max);
	}

}
