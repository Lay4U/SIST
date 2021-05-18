package com.test.question.q22;

public class Ruler {
	private int length;
	private String shape;

	public String info() {
		return "";
	}

	public int getLength() {
		return length;
	}

	public void setLength(int length) throws Exception {
		switch (length) {
		case 30:
			this.length = length;
			break;
		case 50:
			this.length = length;
			break;
		case 100:
			this.length = length;
			break;
		default:
			throw new Exception("길이는 30, 50, 100만 지원합니다");
		}
	}

	public String getShape() {
		return shape;
	}

	public void setShape(String shape) {
		switch (shape) {
		case "줄자":
			this.shape = shape;
			break;
		case "원형자":
			this.shape = shape;
			break;
		case "삼각자":
			this.shape = shape;
			break;
		}
		this.shape = shape;
	}
}
