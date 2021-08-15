package c1;

import java.util.Scanner;

public class C1_2 {
    public static int male;

    public static boolean checkRegion(String id) {
        int i;
        int cnt = 0;
        int bcnt = 0;
        boolean valid = true;
        for (i = 0; i < 6; i++){
            if (id.length() >= 6) {
                if (id.charAt(i) == '1')
                    cnt++;
                else if (id.charAt(i) != '0')
                    bcnt++;
            }
        }
        if (cnt != 1) valid = false;
        else if (bcnt != 0) valid = false;
        return valid;
    }

    public static boolean checkBirth(String id) {
        int year = 0;
        int day = 0;
        int month = 0;
        int i;
        int tmp;
        boolean valid = true;
        int addday = 0;
        int max = 0;
        if (id.length() >= 14) {
            for (i = 6; i < 10; i++) {
                tmp = id.charAt(i) - '0';
                year = year * 10 + tmp;
            }
            for (i = 10; i < 12; i++) {
                tmp = id.charAt(i) - '0';
                month = month * 10 + tmp;
            }
            for (i = 12; i < 14; i++) {
                tmp = id.charAt(i) - '0';
                day = day * 10 + tmp;
            }
        }

        if (year < 1900 || year > 2014) valid = false;
        if (month < 1 || month > 12) valid = false;
        if (year % 400 == 0 || year % 4 == 0 && year % 100 != 0)
            addday = 1;
        if (valid == true) {
            switch (month) {
                case 1:
                case 3:
                case 5:
                case 7:
                case 8:
                case 10:
                case 12:
                    max = 31;
                    break;
                case 4:
                case 6:
                case 9:
                case 11:
                    max = 30;
                    break;
                case 2:
                    max = 28 + addday;
                    break;
            }
            if (day < 1 || day > max) valid = false;
        }
        return valid;


    }

    public static boolean checkGender(String id) {
        int tmp;
        boolean valid = true;
        if (id.length() >= 17) {
            tmp = id.charAt(16) - '0';
            if (id.charAt(14) == '0' && id.charAt(15) == '0' && id.charAt(16) == '0') valid = false;
            if (tmp % 2 == 0) male = 0;
            else male = 1;
        }
        return valid;
    }

    public static boolean checksum(String id) {
        char check = '!';
        boolean valid = true;
        int checksum = 0;
        int cnt = 0;
        int i;
        for (i = 0; i < 17; i++) {
            cnt = id.charAt(i) - '0';
            checksum = checksum + cnt * (int) Math.pow(2, 17 - i);
            checksum = checksum % 11;
        }
        if (checksum < 10 && check >= 0) check = (char) (checksum + '0');
        else if (checksum == 10) check = 'x';
        if (id.length() == 18) {
            if (check != id.charAt(17)) valid = false;
        }
        return valid;
    }

    public static void main(String[] args) {
        int T = 0;
        String id;
        boolean valid;
        Scanner sc = new Scanner(System.in);

        T = sc.nextInt();
        sc.nextLine();
        while (T != 0) {
            valid = true;
            male = 1;
            id = sc.nextLine();
            valid = checkRegion(id);

            if (valid == true)
                valid = checkBirth(id);

            if (valid == true) {
                valid = checkGender(id);
            }

            if (valid == true)
                valid = checksum(id);

            if (valid == false) {
                System.out.println("Invalid");
            } else {
                if (male == 1)
                    System.out.println("Male");
                else
                    System.out.println("Female");
            }
        }
    }
}
