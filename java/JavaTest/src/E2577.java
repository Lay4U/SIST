import java.util.Scanner;

//세 개의 자연수 A, B, C가 주어질 때 A × B × C를 계산한 결과에 0부터 9까지 각각의 숫자가 몇 번씩 쓰였는지를 구하는 프로그램을 작성하시오.
//
//예를 들어 A = 150, B = 266, C = 427 이라면 A × B × C = 150 × 266 × 427 = 17037300 이 되고, 계산한 결과 17037300 에는 0이 3번, 1이 1번, 3이 2번, 7이 2번 쓰였다

public class E2577 {

//	for(int i=0; i<10; i++)
//		N[i] = 0;

	public static void main(String[] args) {
		int[] N = new int[10];
		for (int i = 0; i < 10; i++)
			N[i] = 0;
		Scanner sc = new Scanner(System.in);
//		int n1 = sc.nextInt();
//		int n2 = sc.nextInt();
//		int n3 = sc.nextInt();
		int n1 = 150;
		int n2 = 266;
		int n3 = 427;

		int sum = n1 * n2 * n3;
		int len = String.valueOf(sum).length();
		int tmp = sum / (int) Math.pow(10, len - 1);

		for (int i = 0; i < len; i++) {
			tmp = sum / (int) Math.pow(10, len - 1);
			gocalc(tmp, N);
			sum = sum - tmp * (int) Math.pow(10, len - 1);
			System.out.println(sum);
		}

		for (int i = 0; i < 10; i++) {
//			System.out.println(N[i]);
		}
	}

	private static void gocalc(int tmp, int[] N) {
		// TODO Auto-generated method stub
		switch (tmp) {
		case 0:
			N[0]++;
			break;
		case 1:
			N[1]++;
			break;
		case 2:
			N[2]++;
			break;
		case 3:
			N[3]++;
			break;
		case 4:
			N[4]++;
			break;
		case 5:
			N[5]++;
			break;
		case 6:
			N[6]++;
			break;
		case 7:
			N[7]++;
			break;
		case 8:
			N[8]++;
			break;
		case 9:
			N[9]++;
			break;
		}

	}
}
