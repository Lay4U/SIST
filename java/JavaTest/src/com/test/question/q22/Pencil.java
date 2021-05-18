package com.test.question.q22;

public class Pencil {
	private String hardness;

	public String info() {
		return getHardness();
	}

	public String getHardness() {
		return hardness;
	}

	public void setHardness(String hardness) throws Exception {
		switch (hardness) {
		case "4B":
			this.hardness = hardness;
			break;
		case "3B":
			this.hardness = hardness;
			break;
		case "2B":
			this.hardness = hardness;
			break;
		case "B":
			this.hardness = hardness;
			break;
		case "HB":
			this.hardness = hardness;
			break;
		case "H":
			this.hardness = hardness;
			break;
		case "2H":
			this.hardness = hardness;
			break;
		case "3H":
			this.hardness = hardness;
			break;
		case "4H":
			this.hardness = hardness;
			break;
		default:
			throw new Exception("4B~4H만 지원합니다.");
		}
	}
}
