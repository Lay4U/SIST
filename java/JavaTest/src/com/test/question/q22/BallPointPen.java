package com.test.question.q22;

public class BallPointPen {
	private double thickness;
	private String color;

	public String info() {
		return Double.toString(getThickness()) + getColor();
	}

	public double getThickness() {
		return thickness;
	}

	public void setThickness(double thickness) throws Exception {
		if (thickness == 0.3) {
			this.thickness = thickness;
		} else if (thickness == 0.5) {
			this.thickness = thickness;
		} else if (thickness == 0.7) {
			this.thickness = thickness;
		} else if (thickness == 1.0) {
			this.thickness = thickness;
		} else if (thickness == 1.5) {
			this.thickness = thickness;
		} else {
			throw new Exception("지원하는 심 굵기는 0.3, 0.5, 0.7, 1.0, 1.5 입니다.");
		}
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) throws Exception {
		switch (color) {
		case "red":
			this.color = color;
			break;
		case "blue":
			this.color = color;
			break;
		case "green":
			this.color = color;
			break;
		case "black":
			this.color = color;
			break;
		default:
			throw new Exception("color는 red, blue, green, black만 지원합니다.");
		}
		this.color = color;
	}

}
