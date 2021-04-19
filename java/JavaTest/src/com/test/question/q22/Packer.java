package com.test.question.q22;

public class Packer {
	private static int pencilCount = 0;
	private static int eraserCount = 0;
	private static int ballPointPenCount = 0;
	private static int rulerCount = 0;

	public static void packing(Pencil pencil) {
		System.out.printf("포장 전 검수 : %s 진하기 연필입니다.\n", pencil.getHardness());
		System.out.println("포장을 완료했습니다.");
		pencilCount++;
	}

	public static void packing(Eraser eraser) {
		System.out.printf("포장 전 검수 : %s 사이즈 지우개입니다.\n", eraser.getSize());
		System.out.println("포장을 완료했습니다.");
		eraserCount++;
	}

	public static void packing(BallPointPen ballPointPen) {
		System.out.printf("포장 전 검수 : %s 색상 %.1fmm 볼펜입니다.\n", ballPointPen.getColor(), ballPointPen.getThickness());
		System.out.println("포장을 완료했습니다.");
		ballPointPenCount++;
	}

	public static void packing(Ruler ruler) {
		System.out.printf("포장 전 검수 : %dcm %s 입니다.\n", ruler.getLength(), ruler.getShape());
		System.out.println("포장을 완료했습니다.");
		rulerCount++;
	}

	public static void countPacking(int type) {
		System.out.println("=======================");
		System.out.println("      포장결과");
		System.out.println("=======================");
		switch (type) {
		case 0:
			System.out.printf("연필 %d회\n", pencilCount);
			System.out.printf("지우개 %d회\n", eraserCount);
			System.out.printf("볼펜 %d회\n", ballPointPenCount);
			System.out.printf("자 %d회\n", rulerCount);
			break;
		case 1:
			System.out.printf("연필 %d회\n", pencilCount);
			break;
		case 2:
			System.out.printf("지우개 %d회\n", eraserCount);
			break;
		case 3:
			System.out.printf("볼펜 %d회\n", ballPointPenCount);
			break;
		case 4:
			System.out.printf("자 %d회\n", rulerCount);
			break;
		default:
			System.out.println("0~4의 값을 입력하세요");
		}

	}
}
