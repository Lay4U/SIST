//package com.test.question.q15;
//
//import java.io.BufferedReader;
//import java.io.IOException;
//import java.io.InputStreamReader;
//
////난수로 채워진 배열에서 첫번째 방부터 연속으로 2개씩 더한 결과를 출력 
//public class q {
//	public static void main(String[] args) throws NumberFormatException, IOException {
//		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
//		System.out.print("배열의 길이 :");
//		int length = Integer.parseInt(reader.readLine());
//		
//		int[] nums = new int[length];
//		
//		for(int i = 0; i<nums.length; i++) { // 1~10 난수 생성 
//			nums[i] = (int)(Math.random()*10)+1;
//		}
//		
//		System.out.print("nums = [ ");//["로
//		outputResult(nums);
//		System.out.println();
//		
//		int[] result = new int[5];			   //reuslt nums  result nums
//		for(int i =0; i< result.length; i++) { // (0-0,1)   (1-2, 3)  (2-4,5)  (3 - 6,7)   (4- 8,9) 
//			result[i] = nums[i*2] + nums[i*2+1];
//		}
//		
////		for (int i = 0; i < 5; i++) { 다른 방법
////			for (int j = 0; j < 2; j++) {
////				res[i] += arr[i * 2 + j];
////			}
////		}
//		
//		System.out.print("result = [ "); //["로
//		outputResult(result);
//		
//		
//		
//	}//main 
//
//	
//
//	private static void outputResult(int[] result) {
//		for(int i = 0; i < result.length; i++) {
//			if(i == result.length-1) {
//				System.out.printf("%d ]", result[i]); //%d]로
//			} else {
//				System.out.printf("%d , ", result[i]);//%d,로
//			}
//		}
//	}
//	private static void outputNums(int[] nums) {
//		for(int i = 0; i < nums.length; i++) {
//			if(i == nums.length-1) {
//				System.out.printf("%d ]", nums[i]);
//			} else {
//				System.out.printf("%d ,", nums[i]);
//			}
//		}
//	}// outputNums는 동일한 기능, 동일한 매개변수를 받으므로 삭제하고 outputResult하나만 사용하자.
//}




//package com.test.question.q15;
//
//import java.io.BufferedReader;
//import java.io.IOException;
//import java.io.InputStreamReader;
//
//public class q {
//
//	public static void main(String[] args) throws NumberFormatException, IOException {
//		
//		//delete
//		
//		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
//		
//		System.out.print("삭제 위치: ");
//		
//		int index = Integer.parseInt(reader.readLine());
//		
//		int[] nums = new int[5];
//		
//		for (int i=0; i< nums.length; i++) {
//			
//			nums[i] = (int)(Math.random()*10)+1; //1~10 숫자 랜덤
//		}
//		
//		output(nums);
//		
//		delete(nums,index);
//		
//		output(nums);
//		
//	}//main
//	
//	
//	public static void delete(int[] nums, int index) {
//		
//		for(int i=index+1; i<=nums.length-1; i++) { //사람기준 보정 > int i=index;
//			
//			nums[i-1]=nums[i]; //이거말고 다른방법이 또 있나?
//			
//		}
//		
//		nums[nums.length-1] = 0;//일반적으로 0을 넣나? 0을 안넣으면 난수 대입됨. 오류 방지위해 0을 넣자.
//	}
//	
//	public static void output(int[] nums) {
//		for(int i=0;i<nums.length;i++) {
//			System.out.printf("%d ", nums[i]);
//		}
//		System.out.println();
//	}
//	
//	
//}


//package com.test.question.q15;
//
//import java.io.BufferedReader;
//import java.io.IOException;
//import java.io.InputStreamReader;
//
//public class q {
//	public static void main(String[] args) throws NumberFormatException, IOException {
//		int N = 10;
//		int[] arr = new int[N];
//		for (int i = 0; i < N; i++) {
//			arr[i] = (int) (Math.random() * 9) + 1;
//		}
//		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
//
//		System.out.print("삽입 위치 : ");
//		int idx = Integer.parseInt(reader.readLine());
//		System.out.print("값 : ");
//		int value = Integer.parseInt(reader.readLine());
//
//		System.out.print("원본 : [");
//		String res = "";
//		for (int i : arr)
//			res += i + ", ";
//		res = res.substring(0, res.length() - 2);
//		res += "]";
//		System.out.print(res);
//		System.out.println();
//
//		insert(arr, idx, value);
////		for(int i : arr) {
////			System.out.println(i);
////		}
//
//		System.out.print("결과 : [");
//		res = "";
//		for (int i = 0; i < N; i++) {
//			res += arr[i] + ", ";
//		}
//		res = res.substring(0, res.length() - 2);
//		res += "]";
//		System.out.print(res);
//
//	}
//
//	private static void insert(int[] arr, int idx, int value) {// arr 2, 100
//		for (int i = arr.length - 2; i >= idx; i--) { //arr.length -1을 하면 마지막 값이 없어지는데, 어차피 없어질거 그냥 점프했다.
//			arr[i + 1] = arr[i];
//		}
//		arr[idx] = value;
//	}
//}



//package com.test.question.q15;
//
//import java.io.BufferedReader;
//import java.io.IOException;
//import java.io.InputStreamReader;
//
//public class q {
//	public static void main(String[] args) throws NumberFormatException, IOException {
//		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
//		System.out.print("숫자의 범위(1~N) : ");
//		int range = Integer.parseInt(reader.readLine());
//		System.out.print("숫자의 개수 : ");
//		int N = Integer.parseInt(reader.readLine());
//
//		int[] rand = new int[N];
//
////		int[] rand = {1, 1, 2, 3, 4}; 
////		for(int i=0; i<N; i++) {
////			rand[i] = (int) (Math.random() * 9) + 1;
////		}
//
//		int tmp = 0;
//		int cnt = 0;
//		for (int i = 0; i < N; i++) {
//			tmp = (int) (Math.random() * range) + 1; //난수
//			for (int j = 0; j < N; j++) {
//				if (rand[j] == tmp) //==중복된 값이 있다
//					cnt++; //cnt로 중복여부 판단.
//				if (j == N - 1 && cnt == 0) { //중복된 값이 없다 
//					rand[i] = tmp;
////					j++;// 2번째 for문을 빠져나가기 위해서
//					break;
//				} else if (j == N - 1 && cnt != 0) {
//					j = 0;
//					tmp = (int) (Math.random() * range) + 1;
//					cnt = 0;
//				}
//			}
//			cnt = 0;
//		}
////		for(int i : rand)
////			System.out.println(i);
//		String str = "[";
//		for (int i : rand)
//			str += i + ", ";
//		str = str.substring(0, str.length() - 2);
//		str += "]";
//		System.out.println(str);
//	}
//}


//4번 2번째방법
//package com.test.question.q15;
//
//public class q {
//
//	public static void main(String[] args) {
//		
//		int[] nums = new int[20];
//		
//		for(int i=0; i<nums.length; i++) {
//			
//			int random = (int)(Math.random()*20)+1;
//			
//			nums[i] = random;
//			
//		}// 랜덤으로 난수 받기
//		
//		output(nums); //배열 출력 
//		
//		System.out.println();
//		
//		int max = 0;
//		
//		for(int i=0; i<nums.length;i++) {
//			
//			if(i==0) {// 처음 비교
//				if(nums[i]<=nums[i+1]) {
//					max = nums[i+1];
//				} else {
//					max = nums[i];
//				}
//			} else {
//				if(nums[i]<=max) {
//					max = max;
//				}else {
//					max = nums[i];
//				}
//			}
//			
//		}
//		
//		System.out.printf("최대값 : %d\n",max);
//
//		
//		int min =0;
//		
//		for(int i=0; i<nums.length; i++) {
//			
//			if(i == 0) {
//				if(nums[i]<=nums[i+1]) {
//					min = nums[i];
//				} else {
//					min = nums[i+1];
//				}
//			} else {
//				if(nums[i]<= min) {
//					min = nums[i];
//				} else {
//					min = min;
//				}
//			}
//		}
//		System.out.printf("최소값 : %d\n", min);
//		
//		
//	}//main
//
//	public static void output(int [] nums) {
//		
//		for (int i=0; i<nums.length;i++) {
//
//			if(i == nums.length-1) {
//				System.out.printf("%d",nums[i]);
//			} else {
//			System.out.printf("%d, ",nums[i]);
//			}
//			
//		}
//		
//		System.out.println();
//	}
//	
//	
//}






//package com.test.question.q15;
//
//public class q {
////1~20 사이 난수 담고 있는 배열 생성하고 최대값과 최소값 출력
//	public static void main(String[] args) {
//
//	int[] num = new int[20];
//	
//	int max = 0;// int max = Integer.MIN_VALUE; 가능	//배열의 첫번째값
//	int min = 21;// int min = Integer.MAX_VALUE; 가능	//배열의 첫번째값
//	System.out.print("원본: ");
//	
//	for(int i=0; i<num.length; i++) { //구현방법을 2중포문으로 가능하다.
//		num[i] += (int)(Math.random() * 20)+1;//1~20까지
//	   
//		if(num[i] > max) {
//			max = num[i];
//		}
//		if(num[i] < min) {
//			min = num[i];
//		}		
//		
//		if(num[i] == num[19]) {// (i == 19)일때로
//			System.out.printf("%d \n", num[i]);
//		} else {
//			System.out.printf("%d, ", num[i]);
//		}
//	
//	}//for문	
//	 	
//	 System.out.println("최대값: " + max);	
//	 System.out.println("최소값: " + min);	
//		
//	}
//
//}


//package com.test.question.q15;
//
//import java.io.BufferedReader;
//import java.io.IOException;
//import java.io.InputStreamReader;
//
//public class q {
//	
//	public static void main(String[] args) throws NumberFormatException, IOException {
//		
//		int[] nums = new int[5];
//		
//		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
//		
//		for (int i=0; i<nums.length; i++) {
//			System.out.print("숫자: ");
//			//여기서 int num = Integer.parseInt(reader.readLine());로 선언하면 가독성이 경우에따라 좋아질수도 있다.
//			nums[i] = Integer.parseInt(reader.readLine()); //값을 넣는다.
//			System.out.println(nums[i]);
//		}
//		for (int i=nums.length-1; i>=0; i--) {
//		System.out.printf("nums[%d] = %d\n", i, nums[i]);// nums[4-i]로도 가능하다.
//														//22번째줄  들여쓰기
//		}
//		
//
//		
//		
//	}//main
//
//}//class
