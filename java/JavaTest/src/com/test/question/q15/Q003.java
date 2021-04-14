package com.test.question.q15;

public class Q003 {
	public static void main(String[] args) {
		int[] list = new int[4];
		list[0] = 10;
		list[1] = 20;
		list[2] = 30;
		list[3] = 40;
		String result = dump(list);
		System.out.printf("nums = %s\n", result);
	}

	private static String dump(int[] list) {
		String str = "";
		str += "[";
		for (int i = 0; i < list.length; i++) {
			str += list[i] + ", ";
		}
		str = str.substring(0, str.length() - 2);
		str += "]";
		return str;
	}
}
