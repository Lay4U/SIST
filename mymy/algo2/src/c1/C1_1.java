package c1;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.FileWriter;

class Pos{
    int x;
    int y;
}

class Enemy{
    Pos e = new Pos();
}

class Radars {
    Pos r = new Pos();
    int radius;
    boolean isInteriorPt(Enemy enemy) {//반경 내부에 적이 있나?
        int xdiff, ydiff;
        boolean result;
        xdiff = r.x - enemy.e.x;
        ydiff = r.y - enemy.e.y;
        if(Math.sqrt(xdiff*xdiff + ydiff*ydiff + 0.0) <= radius) {
            System.out.println("(" + enemy.e.x + "," + enemy.e.y + ")는 레이ㅣ더에 감지된 적군의 위치 입니다. \n");
            result = true;
        }else {
            result = false;
        }
        return result;
    }
}

public class C1_1 {
    public static void main(String[] args) {
        BufferedReader in;
        FileWriter out;
        String inputStr1;
        String inputStr2;
        String[] rs = new String[5];
        int testNum;
        int eNum;
        String es[];
        try {
            in = new BufferedReader(new FileReader("input.txt"));
            out = new FileWriter("output.txt");
            testNum = Integer.valueOf(in.readLine());
            for(int i=0; i<testNum; i++) {
                System.out.println("#" + (i+1));
                out.write("#" + (i+1) + " ");
                Radars radars = new Radars();
                inputStr1 = in.readLine();
                inputStr2 = in.readLine();
                rs = inputStr1.split(" ");
                radars.r.x = Integer.valueOf(rs[0]);
                radars.r.y = Integer.valueOf(rs[1]);
                radars.radius = Integer.valueOf(rs[2]);
                eNum = Integer.valueOf(rs[3]);
                System.out.println("입력된 레이더 배치 좌표(" + radars.r.x + "," + radars.r.y + ")이고, 레이더 감지 역역은"
                        + radars.radius + "이다.");
                System.out.println("침투한 적군의 수 " + eNum + "명이다.");
                es = new String[eNum*2];
                es = inputStr2.split(" ");
                Enemy[] enemy = new Enemy[eNum];
                for(int j=0; j<eNum; j++) {
                    enemy[j] = new Enemy();
                    enemy[j].e.x = Integer.valueOf(es[j+i]);
                    enemy[j].e.y = Integer.valueOf(es[j+j+1]);
                }
                int count = 0;
                for(int j=0; j<eNum; j++) {
                    if(radars.isInteriorPt(enemy[j]))
                        count++;
                }
                System.out.println("레이더 감지 영역에 있는 적군의 수 : " + count + "\n");
                out.write(count + "\r\n");
            }
            in.close();
            out.close();
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        }

    }
}
