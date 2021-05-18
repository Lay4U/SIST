package com.test.question.q22_2;

public class Latte {
	private int bean;
	private int milk;

	public void drink() {
		System.out.printf("원두 %2dg, 우유 %2dml으로 만들어진 라테를 마십니다.\n", this.bean, this.milk);
	}

	public int getBean() {
		return bean;
	}

	public void setBean(int bean) {
		this.bean = bean;
	}

	public int getMilk() {
		return milk;
	}

	public void setMilk(int milk) {
		this.milk = milk;
	}
}
