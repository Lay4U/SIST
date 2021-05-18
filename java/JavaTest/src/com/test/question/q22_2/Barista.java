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
		// 판매결과출력 음료판매, 원자재 소비량, 매출액
		System.out.println("============================");
		System.out.println("        판매 결과");
		System.out.println("============================");
		System.out.println();
		System.out.println();
		System.out.println("----------------------------");
		System.out.println("        음료 판매량");
		System.out.println("----------------------------");
		System.out.printf("에스프레소 %d잔\n", Coffee.espresso);
		System.out.printf("아메리카노 %d잔\n", Coffee.americano);
		System.out.printf("라떼       %d잔\n", Coffee.latte);
		System.out.println();
		System.out.println("----------------------------");
		System.out.println("        원자재 소비량");
		System.out.println("----------------------------");
		System.out.printf("원두 : %,8dg\n", Coffee.bean);
		System.out.printf("물   : %,8dml\n", Coffee.water);
		System.out.printf("얼음 : %,8d개\n", Coffee.ice);
		System.out.printf("우유 : %,8dml\n", Coffee.milk);
		System.out.println();
		System.out.println("----------------------------");
		System.out.println("        매출액");
		System.out.println("----------------------------");
		System.out.printf("원두 : %,8d원\n", Coffee.beanTotalPrice);
		System.out.printf("물   : %,8d원\n", Coffee.waterTotalPrice);
		System.out.printf("얼음 : %,8d원\n", Coffee.iceTotalPrice);
		System.out.printf("우유 : %,8d원\n", Coffee.milkTotalPrice);
		System.out.println("----------------------------");
		System.out.printf("합계 : %,8d원\n",
				Coffee.beanTotalPrice + Coffee.waterTotalPrice + Coffee.iceTotalPrice + Coffee.milkTotalPrice);
	}
}
