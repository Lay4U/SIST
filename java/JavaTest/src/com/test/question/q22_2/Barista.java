package com.test.question.q22_2;

public class Barista {
	
	public Espresso makeEspresso(int bean) {
		Espresso espresso = new Espresso();
		espresso.setBean(bean);
		Coffee.bean += bean;
		Coffee.espresso++;
		Coffee.beanTotalPrice += Coffee.beanUnitPrice * bean;
		return espresso;

	}

	public Espresso[] makeEspressoes(int bean, int count) {
		Espresso[] espressos = new Espresso[count];
		for (int i = 0; i < count; i++) {
			espressos[i] = new Espresso();
			espressos[i].setBean(bean);
			Coffee.bean += bean;
			Coffee.espresso++;
			Coffee.beanTotalPrice += Coffee.beanUnitPrice * bean;
		}
		return espressos;
	}

	public Latte makeLatte(int bean, int milk) {
		Latte latte = new Latte();
		latte.setBean(bean);
		latte.setMilk(milk);
		Coffee.bean += bean;
		Coffee.milk += milk;
		Coffee.latte++;
		Coffee.beanTotalPrice += Coffee.beanUnitPrice * bean;
		Coffee.milkTotalPrice += Coffee.milkUnitPrice * milk;
		return latte;
	}

	public Latte[] makeLattes(int bean, int milk, int count) {
		Latte[] lattes = new Latte[count];
		for (int i = 0; i < count; i++) {
			lattes[i] = new Latte();
			lattes[i].setBean(bean);
			lattes[i].setMilk(milk);
			Coffee.bean += bean;
			Coffee.milk += milk;
			Coffee.latte++;
			Coffee.beanTotalPrice += Coffee.beanUnitPrice * bean;
			Coffee.milkTotalPrice += Coffee.milkUnitPrice * milk;
		}
		return lattes;
	}

	public Americano makeAmericano(int bean, int water, int ice) {
		Americano americano = new Americano();
		americano.setBean(bean);
		americano.setWater(water);
		americano.setIce(ice);
		Coffee.bean += bean;
		Coffee.water += water;
		Coffee.ice += ice;
		Coffee.americano++;
		Coffee.beanTotalPrice += Coffee.beanUnitPrice * bean;
		Coffee.waterTotalPrice += Coffee.waterunitPrice * water;
		Coffee.iceTotalPrice += Coffee.iceunitPrice * ice;
		return americano;
	}

	Americano[] makeAmericano(int bean, int water, int ice, int count) {
		Americano[] americanos = new Americano[count];
		for (int i = 0; i < count; i++) {
			americanos[i] = new Americano();
			americanos[i].setBean(bean);
			americanos[i].setWater(water);
			americanos[i].setIce(ice);
			Coffee.bean += bean;
			Coffee.water += water;
			Coffee.ice += ice;
			Coffee.americano++;
			Coffee.beanTotalPrice += Coffee.beanUnitPrice * bean;
			Coffee.waterTotalPrice += Coffee.waterunitPrice * water;
			Coffee.iceTotalPrice += Coffee.iceunitPrice * ice;
		}
		return americanos;
	}

	void result() {
		// ?????????????????? ????????????, ????????? ?????????, ?????????
		System.out.println("============================");
		System.out.println("        ?????? ??????");
		System.out.println("============================");
		System.out.println();
		System.out.println();
		System.out.println("----------------------------");
		System.out.println("        ?????? ?????????");
		System.out.println("----------------------------");
		System.out.printf("??????????????? %d???\n", Coffee.espresso);
		System.out.printf("??????????????? %d???\n", Coffee.americano);
		System.out.printf("??????       %d???\n", Coffee.latte);
		System.out.println();
		System.out.println("----------------------------");
		System.out.println("        ????????? ?????????");
		System.out.println("----------------------------");
		System.out.printf("?????? : %,8dg\n", Coffee.bean);
		System.out.printf("???   : %,8dml\n", Coffee.water);
		System.out.printf("?????? : %,8d???\n", Coffee.ice);
		System.out.printf("?????? : %,8dml\n", Coffee.milk);
		System.out.println();
		System.out.println("----------------------------");
		System.out.println("        ?????????");
		System.out.println("----------------------------");
		System.out.printf("?????? : %,8d???\n", Coffee.beanTotalPrice);
		System.out.printf("???   : %,8d???\n", Coffee.waterTotalPrice);
		System.out.printf("?????? : %,8d???\n", Coffee.iceTotalPrice);
		System.out.printf("?????? : %,8d???\n", Coffee.milkTotalPrice);
		System.out.println("----------------------------");
		System.out.printf("?????? : %,8d???\n",
				Coffee.beanTotalPrice + Coffee.waterTotalPrice + Coffee.iceTotalPrice + Coffee.milkTotalPrice);
	}
}
