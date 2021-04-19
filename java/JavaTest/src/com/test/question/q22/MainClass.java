package com.test.question.q22;

public class MainClass {
	public static void main(String[] args) throws Exception {
		Packer packer = new Packer();
		Pencil p1 = new Pencil();
		p1.setHardness("HB");
		Packer.packing(p1);

		Pencil p2 = new Pencil();
		p2.setHardness("4B");
		Packer.packing(p2);

		Eraser e1 = new Eraser();
		e1.setSize("Large");
		Packer.packing(e1);

		BallPointPen b1 = new BallPointPen();
		b1.setThickness(0.3);
		b1.setColor("black");
		Packer.packing(b1);

		BallPointPen b2 = new BallPointPen();
		b2.setThickness(1.5);
		b2.setColor("red");
		Packer.packing(b2);

		Ruler r1 = new Ruler();
		r1.setLength(30);
		r1.setShape("줄자");
		Packer.packing(r1);

		packer.countPacking(0);
//		packer.countPacking(1);
//		packer.countPacking(2);
//		packer.countPacking(3);
//		packer.countPacking(4);

	}
}
