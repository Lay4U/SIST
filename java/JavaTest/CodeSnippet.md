# 코드조각

#### 변수 선언하기
```
//자료형 변수명 상수;
int a = 10;
```


#### 개행하기
```
//1
System.out.println();	//메소드 자체가 개행
//2
System.out.print("\n");	//특수문자를 통해서 개행
```

#### 데이터 입력받기
```
BufferdReader reader = new BufferedReader(new InputStreamReader(System.in));	//문자 1개 읽기 -> 코드값(int) 반환
String line = reader.readLine();	//1줄 읽기 -> 문자(String) 반환
```

#### 키보드 입력 받은 데이터가 문자열이 아닐때
```
BuffredReader reader = new BufferdReader(new InputStreamReader(System.in));

//키보드 입력값 -> int
int num = Integer.parseInt(reader.readLine());

//키보드 입력값 -> double
double num2 = Double.parseDouble(reader.readLine());

//키보드 입력값 -> char
char c1 = (char)reader.read(); //권장
==
reader.readLine().charAt(0);
//char c1 = reader.readLine();

```

#### 형변환
- 명시적 형변환, 큰형 -> 작은형
```
int a;
long b;

```

