import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.StringTokenizer;

import javax.swing.text.AbstractDocument.BranchElement;

public class E1546 {
	public static void main(String[] args) throws NumberFormatException, IOException {
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		System.out.println();
		StringTokenizer st;
		int N = Integer.parseInt(reader.readLine());
		double[] num = new double[N];
		int max = Integer.MIN_VALUE;
		st = new StringTokenizer(reader.readLine());
		for (int i = 0; i < N; i++) {
			num[i] = Double.parseDouble(st.nextToken());
			if (num[i] > max)
				max = (int) num[i];
		}
		for (int i = 0; i < N; i++) 
				num[i]= num[i] / max * 100;  

//		System.out.println(max);
//		for(double i : num)
//			System.out.println(i);
		double res = 0;
		
		for (double i : num)
			res += i;
		System.out.println(res/N);

	}
}
