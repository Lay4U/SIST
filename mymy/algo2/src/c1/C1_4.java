package c1;

import java.io.*;

class Palindrome {
    boolean check(char input[], int k) {
        int pal = 0;
        int j = 0;
        int limit = 0;
        for (int i = 0; i < input.length; i++) {
            if (input[i] != '\0')
                j++;
        }
        limit = j;
        for (int i = 0; i < j; i++, j--) {
            if (input[i + k] == input[j - 1 + k])
                pal++;
        }
        if (pal == (limit + 1) / 2)
            return true;
        else
            return false;
    }
}

public class C1_4 {
    public static void main(String[] args) throws FileNotFoundException, IOException {
        BufferedReader in;
        FileWriter out;
        int testNum;
        String inputStr;
        char temp[];
        int strLen;
        int i, j, k, q;
        try {
            in = new BufferedReader(new FileReader("input.txt"));
            out = new FileWriter("output.txt");
            testNum = Integer.valueOf(in.readLine());
            for(q = 0; q<testNum;q++){
                int count=0;
                inputStr = in.readLine();
                Palindrome palindrome = new Palindrome();
                System.out.println("#" + (q+1) + "\n");
                System.out.println("입력받은 문자열: " + inputStr + "\n");
                strLen = inputStr.length();
                out.write("#" + (q+1) + " ");
                for(k=3; k<=strLen; k++){
                    for(j=0; j<strLen-k+1; j++){
                        temp = new char[inputStr.length()+1];
                        for(i=j; i<k+j; i++)
                            temp[i] = inputStr.charAt(i);
                        temp[i] = '\0';
                            if(palindrome.check(temp, j)){
                                char output[] = new char[k];
                                for(i=0; i<k; i++)
                                    output[i] = temp[j+1];
                            }
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
