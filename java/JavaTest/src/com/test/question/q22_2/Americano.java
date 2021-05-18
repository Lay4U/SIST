package com.test.question.q22_2;

public class Americano {
	private int bean;
	private int water;
	private int ice;

	void drink() {
		System.out.printf("원두 %2dg, 물 %2dml, 얼음 %2d개로 만들어진 아메리카노를 마십니다.\n", this.bean, this.water, this.ice);
	}

	public int getBean() {
		return bean;
	}

	public void setBean(int bean) {
		this.bean = bean;
	}

	public int getWater() {
		return water;
	}

	public void setWater(int water) {
		this.water = water;
	}

	public int getIce() {
		return ice;
	}

	public void setIce(int ice) {
		this.ice = ice;
	}
}
