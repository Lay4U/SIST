package com.test.etc.crawling;

import java.io.IOException;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;

public class Ex04 {
	public static void main(String[] args) throws Exception {

//		 m1();
//		m2();
//		m3();
//		m4();
		m5();

	}

	private static void m5() {
		String webDriverID = "webdriver.chrome.driver";
		String path = "chromedriver.exe";
		
		System.setProperty(webDriverID, path);

		ChromeOptions options = new ChromeOptions();
		options.setCapability("ignoreProtectedModeSettings", true);

		WebDriver driver = new ChromeDriver(options);
		
		String url = "http://localhost:8090/myapp/member/login.do";
				
		driver.get(url);
		
//		body > section > div > button:nth-child(2)
		WebElement btn = driver.findElement(By.cssSelector("body > section > div > button:nth-child(2)"));
		btn.click();
		
		url = "http://localhost:8090/myapp/board/add.do?reply=0";
		
		driver.get(url);
		
		WebElement subject = driver.findElement(By.id("subject"));
		subject.sendKeys("셀레니움을 통해서 작성중입니다.");
		
		WebElement content = driver.findElement(By.id("content"));
		content.sendKeys("내용입니다.");
		
		WebElement btnWrite = driver.findElement(By.cssSelector("body > section > form > div > button.btn.btn-primary"));
		btnWrite.click();
		
	}

	private static void m4() {
		String webDriverID = "webdriver.chrome.driver";
		String path = "chromedriver.exe";
		
		System.setProperty(webDriverID, path);

		ChromeOptions options = new ChromeOptions();
		options.setCapability("ignoreProtectedModeSettings", true);

		WebDriver driver = new ChromeDriver(options);
		
		String url = "https://banapresso.com/menu";
		
		driver.get(url);
		
		List<WebElement> list = driver.findElements(By.className("menu_box"));
		
		for (WebElement item : list) {
			String name  = item.findElement(By.tagName("strong")).getText();
			String price = item.findElement(By.className("price")).getText();
			
			System.out.println(name + ", " + price);
		}
		
		
	}

	private static void m3() {
		String webDriverID = "webdriver.chrome.driver";
		String path = "chromedriver.exe";

		ChromeOptions options = new ChromeOptions();
		options.setCapability("ignoreProtectedModeSettings", true);

		WebDriver driver = new ChromeDriver(options);

		String url = "http://lms1.sist.co.kr/worknet/Slogin.asp";

		driver.get(url);

		WebElement id = driver.findElement(By.id("strLoginID"));
		id.sendKeys("김형래");
		
		WebElement pw = driver.findElement(By.id("strLoginPwd"));
		pw.sendKeys("9710");
		
		WebElement btn = driver.findElement(By.cssSelector("#content > div > form > table > tbody > tr > td > div > div.login-form > div.login-btn > input"));
		btn.click();
		
		try {
			driver.wait(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		WebElement td = driver.findElement(By.cssSelector("content"));
		System.out.println(td.getText());
	}

	private static void m2() throws IOException {
		// TODO Auto-generated method stub
		String url = "http://banapresso.com/menu";
		Document doc = Jsoup.connect(url).get();
		System.out.println(doc.html());
	}

	private static void m1() throws IOException {
		// 아래 URL은 접속 불가능
		String url = "http://lms1.sist.co.kr/worknet/SMember/index.asp?strCode=I202103260009";
//		String selector = "#content > div > div > div > div.panel-body > form table > thread > tr:nth-child(5) > td:nth-child(2)";

		String selector = "td";

		Document doc = Jsoup.connect(url).get();

		System.out.println(doc.title());

		Elements list = doc.select(selector);

		System.out.println(list.get(0).text());
	}
}
