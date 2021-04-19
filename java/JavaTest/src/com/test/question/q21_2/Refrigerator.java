package com.test.question.q21_2;

public class Refrigerator {
	private Item[] item = new Item[100];
	private int idx = 0;
	private static int count = 0;

	public void add(Item item) throws Exception {
		this.item[idx] = new Item();
		this.item[idx].setName(item.getName());
		this.item[idx].setExpiration(item.getExpiration());
		System.out.printf("'%s'를 냉장고에 넣었습니다.\n", this.item[idx].getName());
		this.idx++;
		this.count++;
	}

	public Item get(String name) {
		for (int i = 0; i < idx; i++) {
			if (this.item[i].getName().equals(name)) {
				Item tmp = this.item[i];
				System.out.println(tmp.getName() + "을(를) 냉장고에서 꺼냅니다.");
				remove(this.item, i);
				this.idx--;
				this.count--;
				return tmp;
			}
		}
		return null;
	}

	public int count() {
		return this.count;
	}

	public void listItem() throws Exception {
		for (int i = 0; i < idx; i++) {
			System.out.printf("%s(%s)\n", this.item[i].getName(), this.item[i].getExpiration());
		}
	}

	public void remove(Item[] item, int idx) {
		for (int i = idx; i < item.length; i++) {
			item[idx] = item[idx + 1];
		}
//		System.out.println(idx);
//		item[idx + 1] = null;
	}

}
