package com.test.question.q21_2;

import java.util.Calendar;

public class Item {
	private String name;
	private Calendar expiration;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getExpiration() throws Exception {
		return this.expiration.get(Calendar.YEAR) + "-" + this.expiration.get(Calendar.MONTH) + "-"
				+ this.expiration.get(Calendar.DATE);
	}

	public void setExpiration(String expiration) throws Exception {
//		this.expiration = expiration;
		this.expiration = Calendar.getInstance();
		try {
			String[] arr = expiration.trim().split("-");
			this.expiration.set(Integer.parseInt(arr[0]), Integer.parseInt(arr[1]), Integer.parseInt(arr[2]));
		} catch (Exception e) {
			throw new Exception("날짜 형식을 YYYY-MM-DD로 입력해주세요");
		}

	}
}
