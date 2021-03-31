package com.test.java;

//1. 9개 자료형을 기반으로
//2. 주변의 데이터를 선택
//3. 자료형을 선택하고 변수를 생성하고 데이터를 대입하고 화면에 출력한다.
//4. 각 자료형 x 10개
public class Ex05_DataType {
	public static void main(String[] args) {
		byte numberOfFinger = 10;
		byte numberOfMonitor = 2;
		byte numberOfEye = 2;
		byte numberOfNose = 1;
		byte numberOfBook = 2;
		byte numberOfDrive = 3;
		byte numberOfPencil = 5;
		byte numberOfCup = 2;
		byte numberOfKeyboard = 2;
		byte numberOfMouseButton = 6;
		System.out.println("손가락의 개수는 " + numberOfFinger + "개 입니다.");
		System.out.println("모니터의 개수는 " + numberOfMonitor + "개 입니다.");
		System.out.println("눈의 개수는 " + numberOfEye + "개 입니다.");
		System.out.println("코의 개수는 " + numberOfNose + "개 입니다.");
		System.out.println("책의 개수는 " + numberOfBook + "개 입니다.");
		System.out.println("드라이브의 개수는 " + numberOfDrive + "개 입니다.");
		System.out.println("펜의 개수는 " + numberOfPencil + "개 입니다.");
		System.out.println("컵의 개수는 " + numberOfCup + "개 입니다.");
		System.out.println("키보드의 개수는 " + numberOfKeyboard + "개 입니다.");
		System.out.println("마우스 버튼의 개수는 " + numberOfMouseButton + "개 입니다.");
		System.out.println();

		short zoomPID = 15704;
		short calculatorPID = 20896;
		short chromePID = 30704;
		short eclipsePID = 29376;
		short explorePID = 4416;
		short everythingPID = 18404;
		short javawPID = 30151;
		short notepadPID = 12584;
		short notionPID = 20204;
		short rundll32PID = 7463;
		System.out.println("zoom 프로그램의 PID는 " + zoomPID + "입니다.");
		System.out.println("calculator 프로그램의 PID는 " + calculatorPID + "입니다.");
		System.out.println("chrome 프로그램의 PID는 " + chromePID + "입니다.");
		System.out.println("eclipse 프로그램의 PID는 " + eclipsePID + "입니다.");
		System.out.println("explore 프로그램의 PID는 " + explorePID + "입니다.");
		System.out.println("everything 프로그램의 PID는 " + everythingPID + "입니다.");
		System.out.println("javaw 프로그램의 PID는 " + javawPID + "입니다.");
		System.out.println("notepad 프로그램의 PID는 " + notepadPID + "입니다.");
		System.out.println("notion 프로그램의 PID는 " + notionPID + "입니다.");
		System.out.println("rundll32 프로그램의 PID는 " + rundll32PID + "입니다.");
		System.out.println();

		int sizeOfJavaexe = 277632;
		int sizeOfEclipse = 426152;
		int occupyMemoryEclipse = 1127136;
		int occupyMemoryEverything = 439496;
		int occupyMemoryChrome = 225544;
		int occupyMemoryZoom = 217120;
		int occupyMemoryMsMpEng = 128268;
		int occupyMemorySearchApp = 116208;
		int occupyMemoryNotion = 114732;
		int occupyMemoryPerfmon = 79688;
		System.out.println("Java.exe의 파일 크기는 " + sizeOfJavaexe + " KB입니다.");
		System.out.println("Eclipse.exe의 파일 크기는 " + sizeOfEclipse + " KB입니다.");
		System.out.println("eclipse의 RAM 점유율은 " + occupyMemoryEclipse + " KB입니다.");
		System.out.println("everything의 RAM 점유율은 " + occupyMemoryEverything + " KB입니다.");
		System.out.println("chrome의 RAM 점유율은 " + occupyMemoryChrome + " KB입니다.");
		System.out.println("zoom의 RAM 점유율은 " + occupyMemoryZoom + " KB입니다.");
		System.out.println("msmpeng의 RAM 점유율은 " + occupyMemoryMsMpEng + " KB입니다.");
		System.out.println("searchapp의 RAM 점유율은 " + occupyMemorySearchApp + " KB입니다.");
		System.out.println("notion의 RAM 점유율은 " + occupyMemoryNotion + " KB입니다.");
		System.out.println("perfmon의 RAM 점유율은 " + occupyMemoryPerfmon + " KB입니다.");
		System.out.println();

		long lottoWin = 22252809381L; // 2021_03_27
		long marketCapitalizationOfSamSung = 488925191000000L;
		long marketCapitalizationOfSKHynix = 97188316000000L;
		long marketCapitalizationOfNAVER = 62255827000000L;
		long marketCapitalizationOfLGChem = 57462167000000L;
		long marketCapitalizationOfSamsungBiologics = 49425255000000L;
		long marketCapitalizationOfHyundaiCar = 46900167000000L;
		long marketCapitalizationOfSamsungSDI = 45934706000000L;
		long marketCapitalizationOfKakao = 44195863000000L;
		long marketCapitalizationOfPOSCO = 28030567000000L;
		System.out.println("지난주 로또 1등 당첨 금액은 " + lottoWin + "원 입니다.");
		System.out.println("삼성전자의 시가총액은 " + marketCapitalizationOfSamSung + "원 입니다.");
		System.out.println("SK하이닉스의 시가총액은 " + marketCapitalizationOfSKHynix + "원 입니다.");
		System.out.println("NAVER의 시가총액은 " + marketCapitalizationOfNAVER + "원 입니다.");
		System.out.println("LG화학의 시가총액은 " + marketCapitalizationOfLGChem + "원 입니다.");
		System.out.println("삼성바이오로직스의 시가총액은 " + marketCapitalizationOfSamsungBiologics + "원 입니다.");
		System.out.println("현대차의 시가총액은 " + marketCapitalizationOfHyundaiCar + "원 입니다.");
		System.out.println("삼성SDI의 시가총액은 " + marketCapitalizationOfSamsungSDI + "원 입니다.");
		System.out.println("카카오의 시가총액은 " + marketCapitalizationOfKakao + "원 입니다.");
		System.out.println("POSCO의 시가총액은 " + marketCapitalizationOfPOSCO + "원 입니다.");
		System.out.println();

		float currentTemperature = 18.3F; // Celsius
		float fluctuationRateOfSamSung = -0.24F;
		float fluctuationRateOfSKHynix = -1.12F;
		float fluctuationRateOfNAVER = 0.53F;
		float fluctuationRateOfLGChem = 0.62F;
		float fluctuationRateOfSamsungBiologics = 0.13F;
		float fluctuationRateOfHyundaiCar = 0.23F;
		float fluctuationRateOfSamsungSDI = -0.45F;
		float fluctuationRateOfKakao = 1.01F;
		float fluctuationRateOfPOSCO = -0.31F;
		System.out.println("현재 기온은 " + currentTemperature + "%입니다");
		System.out.println("삼성전자의 등락률은 " + fluctuationRateOfSamSung + "%입니다");
		System.out.println("SK하이닉스의 등락률은 " + fluctuationRateOfSKHynix + "%입니다");
		System.out.println("NAVER의 등락률은 " + fluctuationRateOfNAVER + "%입니다");
		System.out.println("LG화학의 등락률은 " + fluctuationRateOfLGChem + "%입니다");
		System.out.println("삼성바이오로직스의 등락률은 " + fluctuationRateOfSamsungBiologics + "%입니다");
		System.out.println("현대차의 등락률은 " + fluctuationRateOfHyundaiCar + "%입니다");
		System.out.println("삼성SDI의 등락률은 " + fluctuationRateOfSamsungSDI + "%입니다");
		System.out.println("카카오의 등락률은 " + fluctuationRateOfKakao + "%입니다");
		System.out.println("POSCO의 등락률은 " + fluctuationRateOfPOSCO + "%입니다");
		System.out.println();

		double waterCapacity = 500.0D;
		double ageOfUniverse = 1.3799 * 10000000000D;
		double diameterOfObservableUniverse = 8.8 * 100000000000000000000000000D;
		double massOfUniverse = 10E53D;
		double averageDensityOfUniverse = 9.9 / 1000000000000000000000000000000D;
		double meanOfSun = 1.496 * 100000000D;
		double galacticPeriodOfSun = (2.25 + 2.50) / 2 * 100000000D;
		double volumeOfSun = 1.41 * 1000000000000000000D;
		double surfaceAreaOfSun = 6.09 * 1000000000000D;
		System.out.println("물의 용량은 " + waterCapacity + " L 입니다.");
		System.out.println("우주의 나이는 " + ageOfUniverse + " 년 입니다.");
		System.out.println("우주의 지름은 " + diameterOfObservableUniverse + " m 입니다.");
		System.out.println("우주의 질량은 " + massOfUniverse + " kg 입니다.");
		System.out.println("우주의 평균 밀도는 " + averageDensityOfUniverse + " g/cm 입니다.");
		System.out.println("태양까지의 거리는 " + meanOfSun + " km 입니다.");
		System.out.println("태양의 나이는 " + galacticPeriodOfSun + " 년 입니다.");
		System.out.println("태양의 부피는 " + volumeOfSun + " km^3 입니다.");
		System.out.println("태양의 표면적은 " + surfaceAreaOfSun + " km^2 입니다.");
		System.out.println();

		boolean isMan = true;
		boolean isAdult = true;
		boolean isMarried = false;
		boolean isAdmin = true;
		boolean isGuest = false;
		boolean flag = true;
		boolean isConnected = true;
		boolean isPowerOn = true;
		boolean isWorking = true;
		boolean isClicked = false;
		System.out.println("남성입니까? " + isMan);
		System.out.println("성인입니까? " + isAdult);
		System.out.println("기혼입니까? " + isMarried);
		System.out.println("관리자입니까? " + isAdmin);
		System.out.println("게스트입니까? " + isGuest);
		System.out.println("플래그 값? " + flag);
		System.out.println("연결되었습니까? " + isConnected);
		System.out.println("파워가 켜져있습니까? " + isPowerOn);
		System.out.println("작동중입니까? " + isWorking);
		System.out.println("클릭되었습니까? " + isClicked);
		System.out.println();

		char lastOfASCII = 126;
		char firstOfASCII = 0;
		char middleOfASCII = 63;
		char randomASCII = 33;
		char randomASCII2 = 44;
		char randomASCII3 = 11;
		char A = 'A';
		char a = 'a';
		char Z = 'Z';
		char z = 'z';
		System.out.println("아스키코드의 마지막 문자는 " + lastOfASCII + "입니다");
		System.out.println("아스키코드의 첫번째 문자는 " + firstOfASCII + "입니다");
		System.out.println("아스키코드의 63번째 문자는 " + middleOfASCII + "입니다");
		System.out.println("아스키코드의 33번째 문자는 " + randomASCII + "입니다");
		System.out.println("아스키코드의 44번째 문자는 " + randomASCII2 + "입니다");
		System.out.println("아스키코드의 11번째 문자는 " + randomASCII3 + "입니다");
		System.out.println("현재 저장된 문자는 " + A + "입니다");
		System.out.println("현재 저장된 문자는 " + a + "입니다");
		System.out.println("현재 저장된 문자는 " + Z + "입니다");
		System.out.println("현재 저장된 문자는 " + z + "입니다");
		System.out.println();

		String myName = "김형래";
		String myState = "경기도";
		String myCity = "성남시";
		String helloEnglish = "Hello";
		String helloChinese = "你好";
		String helloJapanese = "こんにちは";
		String byeEnglish = "Good Bye";
		String byeChinese = "再见";
		String byeJapanese = "さようなら";
		String helloWorld = "Hello~ World!";
		System.out.println(myName + "는 " + myState + " " + myCity + "에 살고있습니다.");
		System.out.println("영어로 안녕하세요는 " + helloEnglish + "입니다.");
		System.out.println("중국어로 안녕하세요는 " + helloChinese + "입니다.");
		System.out.println("일본어로 안녕하세요는 " + helloJapanese + "입니다.");
		System.out.println("영어로 안녕히 가세요는 " + byeEnglish + "입니다.");
		System.out.println("중국어로 안녕히 가세요는 " + byeChinese + "입니다.");
		System.out.println("일본어로 안녕히 가세요는 " + byeJapanese + "입니다.");
		System.out.println("현재 저장된 문자열은 " + helloWorld + "입니다.");

	}
}
