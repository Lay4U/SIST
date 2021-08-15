package c1;

import java.util.Scanner;

public class C1_3 {
    public static int reverse(int n){
        int tmp = n;
        int rev = 0;
        while(tmp != 0){
            rev = rev * 10 + tmp % 10;
            tmp /= 10;
        }
        return rev;
    }

    public static boolean isPalindrome(int [] arr, int cnt){
        int start = 0;
        int end = cnt - 1;
        boolean flag = true;

        while(start <= end){
            if(arr[start] != arr[end]){
                    flag = false;
                    break;
            }else{
                start++;
                end--;
            }
        }
        return flag;
    }

    public static int divN(int n , int cnt, int [] arr){
        int tmp = n;
        while(tmp!=0){
            arr[cnt] = tmp % 10;
            tmp /= 10;
            cnt++;
        }
        return cnt;
    }

    public static void main(String[] args){
        int T;
        int N;
        int reverseN;
        int sum;
        int cnt=0;
        boolean flag = true;
        int arr[] = new int[10];
        Scanner sc = new Scanner(System.in);
        T = sc.nextInt();
        while(T-- != 0){
            N = sc.nextInt();
            reverseN = 0;
            reverseN = reverse(N);
            sum = N + reverseN;
            cnt = 0;
            cnt = divN(sum, cnt, arr);
            flag = isPalindrome(arr, cnt);
            if (flag == false)
                System.out.println("no");
            else
                System.out.println("yes");
        }
    }
}
