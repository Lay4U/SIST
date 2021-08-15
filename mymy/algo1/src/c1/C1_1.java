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
	boolean isInteriorPt(Enemy enemy) {//�ݰ� ���ο� ���� �ֳ�?
		int xdiff, ydiff;
		boolean result;
		xdiff = r.x - enemy.e.x;
		ydiff = r.y - enemy.e.y;
		if(Math.sqrt(xdiff*xdiff + ydiff*ydiff + 0.0) <= radius) {
			System.out.println("(" + enemy.e.x + "," + enemy.e.y + ")�� ���̤Ӵ��� ������ ������ ��ġ �Դϴ�. \n");
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
				System.out.println("�Էµ� ���̴� ��ġ ��ǥ(" + radars.r.x + "," + radars.r.y + ")�̰�, ���̴� ���� ������"
						+ radars.radius + "�̴�.");
				System.out.println("ħ���� ������ �� " + eNum + "���̴�.");
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
				System.out.println("���̴� ���� ������ �ִ� ������ �� : " + count + "\n");
				out.write(count + "\r\n");
			}
			in.close();
			out.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}
}
