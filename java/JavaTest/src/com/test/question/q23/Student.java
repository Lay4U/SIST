package com.test.question.q23;

public class Student {
	private String name;
	private int age;
	private int grade;
	private int classNumber;
	private int number;

	public Student() {
		this.name = "미정";
		this.age = 0;
		this.grade = 0;
		this.classNumber = 0;
		this.number = 0;
	}

	public Student(String name, int age, int grade, int classNumber, int number) {
		this.name = name;
		this.age = age;
		this.grade = grade;
		this.classNumber = classNumber;
		this.number = number;
	}

	public Student(String name, int age) {
		this(name, age, 0, 0, 0);
	}

	public Student(int grade, int classNumber, int number) {
		this("미정", 0, grade, classNumber, number);
	}


	public String info() {
		String initAge = this.age == 0 ? "미정" : Integer.toString(this.age);
		String initGrade = this.grade == 0 ? "미정" : Integer.toString(this.grade);
		String initClassNumber = this.classNumber == 0 ? "미정" : Integer.toString(this.classNumber);
		String initNumber = this.number == 0 ? "미정" : Integer.toString(this.number);
		return this.name + "\t" + "(나이 : " + initAge + ", " + "학년 : " + initGrade + ", " + "반 : " + initClassNumber
				+ ", " + "번호 : " + initNumber + ")";
	}

}
