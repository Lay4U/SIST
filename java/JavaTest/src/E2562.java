import java.util.Scanner;
//3, 29, 38, 12, 57, 74, 40, 85, 61
//85 8
//public class E2562{
//	public static void main(String[] args) {
//		Scanner scanner = new Scanner(System.in);
//		int[] arr = new int[9];
//		int idx=0;
//		int max = Integer.MIN_VALUE;
//		System.out.println();
//		for(int i=0; i<arr.length; i++) {
//			arr[i]= scanner.nextInt();
//			if(arr[i] > max) {
//				max = arr[i];
//				idx = i;
//			}
//		}
//		System.out.println(max);
//		System.out.println(idx+1);
//	}
//}
public class E2562 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.println();
		int[] arr = new int[9];
		int idx =0;
		int cnt =0;
		int max = Integer.MIN_VALUE;
		
		for(int i : arr) {
			i = sc.nextInt();
			if(i > max) {
				max = i;
				idx = cnt;
			}
			cnt++;
		}
		System.out.println(max);
		System.out.println(idx+1);
	}

}
