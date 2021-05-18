package com.test.question.q22;

public class Eraser {
	private String size;

	public String info() {
		return getSize();
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) throws Exception {
		switch (size) {
		case "Large":
			this.size = size;
			break;
		case "Medium":
			this.size = size;
			break;
		case "Small":
			this.size = size;
			break;
		default:
			throw new Exception("Large, Medium, Small만 지원합니다.");
		}
	}
}
