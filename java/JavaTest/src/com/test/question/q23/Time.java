package com.test.question.q23;

public class Time {
	private int hour;
	private int minute;
	private int second;

	public Time() {
		this.hour=0;
		this.minute=0;
		this.second=0;
	}
	
	public Time(int hour, int minute, int second) {
		int sum = hour*60*60 + minute*60 + second;
		this.hour = sum / 60 / 60;
		sum %= 3600;
		this.minute= sum / 60;
		sum %= 60;
		this.second=sum;
	}
	
	public Time(int minute, int second) {
		this(0,minute,second);
	}
	
	public Time(int second) {
		this(0,0,second);
	}
	
	
	public String info() {
		return this.hour + ":" + this.minute + ":" + this.second;
	}
}
