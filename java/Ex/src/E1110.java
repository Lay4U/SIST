import java.util.Scanner;

//26부터 시작한다. 2+6 = 8이다. 새로운 수는 68이다. 6+8 = 14이다. 새로운 수는 84이다. 8+4 = 12이다. 새로운 수는 42이다. 4+2 = 6이다. 새로운 수는 26이다.
public class E1110 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int input = sc.nextInt();
//		int input = 55;
		int origin = input;
		int cnt = 0;
		while (true) {
			int first = origin / 10; // 2
//			int last = origin - (origin / 10 * 10);// 6
			int last = origin % 10;
			System.out.println(last);
			int sumDigit = first + last; // 8
			sumDigit = sumDigit >= 10 ? sumDigit - (sumDigit / 10 * 10) : sumDigit;
//			System.out.println(sumDigit);
			int res = last * 10 + sumDigit;
//			System.out.println(res);
			origin = res;
			cnt++;
			if (input == res) {
				System.out.println(cnt);
				break;
			}
		}
	}
}
