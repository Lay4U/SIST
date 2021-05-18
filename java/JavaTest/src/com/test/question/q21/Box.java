package com.test.question.q21;

public class Box {
	private Macaron[] list = new Macaron[10];
	private String arrColor[] = { "red", "blue", "yellow", "white", "pink", "purple", "green", "black" };
	int cnt = 0;

	public void cook() {
		for (int i = 0; i < list.length; i++) {
			list[i] = new Macaron();
			list[i].setSize(((int) (Math.random() * 11) + 5)); // 5~15
//			System.out.println(list[i].getSize());
			list[i].setColor(arrColor[((int) (Math.random() * arrColor.length))]);
			list[i].setThickness(((int) (Math.random() * 20) + 1));// 1~20
		}
		System.out.printf("마카롱을 %d개 만들었습니다.\n", list.length);
	}

	public void check() {
		for (int i = 0; i < list.length; i++) {
			if (list[i].getSize() >= 8 && list[i].getSize() <= 15 && !list[i].getColor().equals("black")
					&& list[i].getThickness() >= 3 && list[i].getThickness() <= 18) {
				list[i].setisPass(true);
				cnt++;
			} else {
				list[i].setisPass(false);
			}
		} // exit for

		System.out.println("[박스 체크 결과]");
		System.out.printf("QC 합격 개수   : %2d개\n", cnt);
		System.out.printf("QC 불합격 개수 : %2d개\n", list.length - cnt);
	}

	public void list() {
		System.out.println("[마카롱 목록]");
		for (int i = 0; i < list.length; i++) {
			String tmp = "";
			System.out.printf("%d번 마카롱 : %dcm(%s, %dmm) : %s\n", i+1, list[i].getSize(), list[i].getColor(),
					list[i].getThickness(), tmp = list[i].getisPass() ? "합격" : "불합격");
		}
	}
}
