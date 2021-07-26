package com.test.etc.crawling;

import java.util.Arrays;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class Ex03 {
	public static void main(String[] args) throws Exception{
		String url = "https://movie.naver.com/movie/running/current.naver";
		System.out.println("a");
		Document doc = Jsoup.connect(url).get();
		
		//div.list_wrap > ul.list>detail_t1 > li
		
		Elements list = doc.select("div.lst_wrap > ul.lst_detail_t1 > li");
		
		for (Element item: list) {
//			System.out.println(item);
//			System.out.println("----------------------");
			String title = item.select(".tit > a").text();
//			System.out.println(title);
			
//			String outline = item.select("dd:nth-child(2) .link_txt").text();
//			System.out.println(outline);
			
			String temp = item.select(".info_txt1 dd:nth-child(2)").text();
//			System.out.println(time);
			
			temp = temp.replace(" ", "").replace("개봉", "");
			
			String[] templist = temp.split("\\|");
			
			
			String outline = "";
			String time = "";
			String rdate = "";
			
			if(templist.length == 2) {
				time = templist[0];
				rdate = templist[1];
			}else {
				outline = templist[0];
				time = templist[1];
				rdate = templist[2];
				
			}
//			System.out.println(outline);
//			System.out.println(time);
//			System.out.println(rdate);
//			System.out.println(Arrays.toString(templist));
			
			String director = item.select("dd:nth-child(4) .link_txt").text();
			String actor = item.select("dd:nth-child(6) .link_txt").text();
			String poster = item.select(".thumb > a > img").attr("src");
			
			
		}
	}
}
