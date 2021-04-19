package com.test.question.q22_2;

public class MainClass {
	public static void main(String[] args) {
		Barista barista = new Barista();

		// 손님1
		Espresso e1 = barista.makeEspresso(30);
		e1.drink();

		// guest2
		Latte l1 = barista.makeLatte(30, 250);
		l1.drink();

		// guest3
		Americano a1 = barista.makeAmericano(30, 300, 20);
		a1.drink();

		System.out.println();
		// guset4
		Espresso[] e2 = barista.makeEspressoes(25, 10);

		for (Espresso espresso : e2) {
			espresso.drink();
		}
		System.out.println();
		// guset5
		Latte[] l2 = barista.makeLattes(25, 300, 5);

		for (Latte l : l2) {
			l.drink();
		}
		System.out.println();

		// guset6
		Americano[] a2 = barista.makeAmericano(20, 350, 30, 15);

		for (Americano a : a2) {
			a.drink();
		}
		System.out.println();
		barista.result();
	}
}
