import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

//"OOXXOXXOOO"와 같은 OX퀴즈의 결과가 있다. O는 문제를 맞은 것이고, X는 문제를 틀린 것이다. 문제를 맞은 경우 그 문제의 점수는 그 문제까지 연속된 O의 개수가 된다. 예를 들어, 10번 문제의 점수는 3이 된다.
//
//"OOXXOXXOOO"의 점수는 1+2+0+0+1+0+0+1+2+3 = 10점이다.
//
//OX퀴즈의 결과가 주어졌을 때, 점수를 구하는 프로그램을 작성하시오
//5
//OOXXOXXOOO
//OOXXOOXXOO
//OXOXOXOXOXOXOX
//OOOOOOOOOO
//OOOOXOOOOXOOOOX
public class E8958 {
	public static void main(String[] args) throws IOException {
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		System.out.println();
		int N = Integer.parseInt(reader.readLine());
		int end = 0;
		char[][] str = null;
		for (int i = 0; i < N; i++) {
			String input = reader.readLine();
			str = new char[i][input.length()];
			for (int j = 0; j < input.length(); j++) {
				str[i][j] = input.charAt(j);
			}
		}
		for(char[] a: str)
			System.out.println(a);
//		for(char a : str)
//			System.out.println(a);
//		int sum = 0;
//		int cnt = 1;
//		for (int i = 0; i < input.length(); i++) {
//			if (str[i] == ('O')) {
//				sum += cnt;
//				cnt++;
//			} else {
//				cnt = 1;
//			}
//		}
//		System.out.println(sum);

	}
}
