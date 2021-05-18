package com.test.question.q28;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.Scanner;
/*
 * 1,유게무,광주시 강동구 다동, 010-3086-6664
2,이형석,서울시 강서구 마동, 010-6174-7403
3,홍길석,인천시 강남구 다동, 010-7912-5576
4,황게돈,강릉시 강서구 가동, 010-6726-5838
5,정무석,광주시 강서구 나동, 010-2267-5937
6,박수게,광주시 강동구 가동, 010-8020-1893
7,김명동,대구시 강남구 가동, 010-8167-7264
8,하재명,부산시 강남구 마동, 010-2773-2780
9,박유게,부산시 중구 마동, 010-1513-8466
10,황명돈,서울시 중구 다동, 010-5111-6975
11,황돈수,서울시 강북구 라동, 010-6880-4898
12,길돈돈,인천시 강남구 가동, 010-5643-4475
13,정유유,광주시 중구 가동, 010-1323-7566
14,황재무,제주시 강북구 나동, 010-8701-1117
15,하게게,광주시 중구 다동, 010-4168-4145
16,황형동,대구시 강서구 가동, 010-8284-7762
17,이게형,제주시 강서구 다동, 010-7061-4809
18,노유게,제주시 강북구 마동, 010-8792-3812
19,전수길,제주시 강동구 가동, 010-1298-6258
20,박돈게,강릉시 강북구 마동, 010-8766-8898
21,이형돈,제주시 강동구 가동, 010-8989-7208
22,전수길,대구시 강북구 가동, 010-5692-8568
23,전유석,제주시 강북구 나동, 010-1395-2696
24,노게무,강릉시 중구 나동, 010-7203-1202
25,전게명,대구시 중구 다동, 010-6453-8271
26,황무석,대구시 강남구 마동, 010-1119-5692
27,노명명,강릉시 강남구 가동, 010-5343-7832
28,정무동,서울시 강남구 라동, 010-7039-6084
29,박돈게,강릉시 강서구 가동, 010-2193-2273
30,김명형,인천시 강동구 나동, 010-7283-1749
31,황동유,부산시 강남구 다동, 010-2826-5894
32,유유유,강릉시 강서구 다동, 010-1096-4380
33,김돈형,대구시 강북구 라동, 010-4455-7811
34,이석동,서울시 강동구 라동, 010-1068-7398
35,길명무,인천시 강북구 라동, 010-2791-4341
36,하명수,제주시 중구 다동, 010-8560-1567
37,김명유,광주시 중구 마동, 010-8617-5976
38,홍돈명,제주시 강동구 마동, 010-2880-6612
39,박게명,대구시 강서구 가동, 010-3179-2185
40,전형명,강릉시 중구 라동, 010-4395-3377
41,박형수,인천시 강서구 다동, 010-8523-7109
42,황길게,부산시 강남구 가동, 010-1889-3330
43,노수수,광주시 강동구 가동, 010-7241-7335
44,노동석,대구시 강서구 가동, 010-2990-4597
45,유명게,대구시 강북구 가동, 010-6147-1709
46,김수형,제주시 중구 마동, 010-7363-3029
47,유돈유,제주시 중구 라동, 010-6070-8883
48,노동유,부산시 강동구 다동, 010-3629-8271
49,유석명,광주시 강서구 가동, 010-5891-7093
50,황석유,강릉시 중구 다동, 010-2971-5488
51,박유형,제주시 강서구 라동, 010-1958-5584
52,유길명,강릉시 중구 가동, 010-2908-2788
53,길석무,서울시 강북구 나동, 010-5119-5504
54,홍게명,제주시 강동구 가동, 010-4829-8824
55,김형형,제주시 강남구 마동, 010-1485-1058
56,유무유,대구시 강남구 라동, 010-2862-3608
57,하명동,서울시 강서구 마동, 010-7789-8563
58,하형형,대구시 강서구 나동, 010-5693-7312
59,유형무,서울시 강동구 가동, 010-6622-8591
60,전명무,대구시 강남구 가동, 010-6040-4046
61,하돈명,부산시 강남구 나동, 010-6655-6577
62,하게재,대구시 강남구 다동, 010-8302-1181
63,노동길,인천시 강동구 다동, 010-3918-4408
64,홍유석,대구시 강동구 나동, 010-8398-3179
65,전유재,서울시 강북구 마동, 010-5417-3487
66,황명형,대구시 강동구 나동, 010-5349-4547
67,유동명,강릉시 강북구 나동, 010-4048-4803
68,박재수,서울시 강동구 라동, 010-6083-3154
69,정명석,서울시 강서구 마동, 010-5664-8673
70,황명게,서울시 강동구 가동, 010-3414-7205
71,유형동,부산시 강서구 마동, 010-5209-7380
72,하돈석,서울시 강서구 나동, 010-8044-7848
73,홍유길,강릉시 중구 마동, 010-6232-3098
74,길석게,인천시 강서구 가동, 010-8116-3495
75,홍유길,강릉시 강남구 마동, 010-4061-5902
76,하명게,제주시 강남구 가동, 010-1468-7056
77,정길석,인천시 강동구 가동, 010-8773-1966
78,하수돈,강릉시 강동구 가동, 010-5940-5038
79,김무형,강릉시 강동구 나동, 010-6863-7510
80,황수명,부산시 강북구 다동, 010-3752-8623
81,박길돈,제주시 강남구 가동, 010-5146-7362
82,황명게,인천시 강동구 나동, 010-6921-4062
83,전동게,인천시 중구 다동, 010-6628-4944
84,유형길,서울시 중구 나동, 010-4708-8680
85,박길수,대구시 중구 나동, 010-3148-5050
86,박돈동,서울시 강북구 나동, 010-6952-1306
87,김게명,인천시 강남구 다동, 010-3408-5726
88,김게돈,서울시 강남구 나동, 010-6244-7008
89,정게게,인천시 강서구 다동, 010-2639-4665
90,길유재,대구시 강서구 나동, 010-2821-3591
91,유동길,제주시 강북구 다동, 010-3782-1767
92,노길수,제주시 강동구 다동, 010-7579-4154
93,박돈형,강릉시 강북구 마동, 010-2838-7012
94,황재재,제주시 강남구 라동, 010-1236-2056
95,전돈길,광주시 강서구 다동, 010-5947-2509
96,전게돈,부산시 강남구 마동, 010-2878-1435
97,하형석,부산시 강남구 마동, 010-5782-6046
98,홍게형,광주시 강남구 가동, 010-4104-8321
99,하석재,강릉시 강남구 라동, 010-5411-2612
100,황명석,서울시 강남구 나동, 010-5696-5287
[이름]
번호 :
주소 :
전화 :
 */
public class Q004 {
	public static void main(String[] args) throws IOException {
		String path = "D:\\class\\java\\file\\파일_입출력_문제\\단일검색.dat";

		Scanner sc = new Scanner(System.in);
//		String findName = "황명석";
		System.out.print("이름 : ");
		String findName = sc.nextLine();
		
		BufferedReader read = new BufferedReader(new FileReader(path));
		String line = "";
		String result ="";
		while((line = read.readLine()) != null) {
			String[] temp = line.split(",");
//			System.out.println(temp[0]+" "+temp[1]+" "+temp[2]+" "+temp[3]+" ");
			
			if(temp[1].equals(findName)) {
				result += String.format("[%s]\n번호: %s\n주소: %s\n전화: %s\n",temp[1], temp[0],temp[2], temp[3]);
			}
		}
		if(result.equals("")) {
			System.out.println("없는이름");
			return;
		}
			
		System.out.println(result);

	}
}