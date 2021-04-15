package com.test.java;

import java.awt.List;

import javax.swing.text.DefaultEditorKit.InsertBreakAction;

public class Ex27_Array {
	public static void main(String[] args) {
		m1();
	}

	private static void m1() {
		// 배열의 업무(용도)에 맞는 사용법

		// 기본 사용법
		// 방을 순차적으로 접근.
		// 원하는 방을 선택해서 접근
		int[] num = new int[] { 5, 9, 6, 10, 3, 1, 5, 6, 7, 10 };

		// 1. 차례대로 접근
		for (int i = 0; i < num.length; i++) {
			System.out.println(num[i]);
		}
		System.out.println();
		for (int n : num) {
			System.out.println(n);
		}
		System.out.println();
		System.out.println();

		// 2 원하는 방을 선택해서 접근
		int[] list = new int[10];

		output(list);

		add(list, 10);
		add(list, 20);
		add(list, 30);
		add(list, 40);
		add(list, 50);
		add(list, 60);
		add(list, 70);
		add(list, 80);
		output(list);
		insert(list, 3, 90);
		output(list);
		delete(list, 5);
		output(list);
	}
	private static void delete(int[] list, int index) {
		for(int i=index; i<=list.length-2; i++) {
			list[i]= list[i+1]; 
		}
	}

	/**
	 * @param list  array
	 * @param index where
	 * @param n     value
	 */
	private static void insert(int[] list, int index, int n) {
		// 우측쉬프트
		for (int i = list.length - 2; i >= index; i--) {
			list[i+1] = list[i];
		}
		list[index] = n; 
	}

	private static void add(int[] list, int n) {
		// 가장 앞에있는 빈 방이 어디냐?
		int idx = -1;
		for (int i = 0; i < list.length; i++) {
			if (list[i] == 0) {
				idx = i;
				break;
			}
		}
		list[idx] = n;
	}

	public static void output(int[] list) {
		for (int i = 0; i < list.length; i++) {
			System.out.printf("%d  ", list[i]);
		}
		System.out.println();
	}
}
