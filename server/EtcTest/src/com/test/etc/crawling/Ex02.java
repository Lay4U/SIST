package com.test.etc.crawling;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class Ex02 {
	public static void main(String[] args) throws Exception {
		System.out.println("네이버 영화 랭킹");
		
		String url = "https://movie.naver.com/movie/sdb/rank/rmovie.naver";
		
		Document doc = Jsoup.connect(url).get();
		System.out.println(doc.title());
		
		Elements list = doc.select(".title > .tit3 > a");
		
		System.out.println(list.size());
		
		for(Element item : list) {
//			System.out.println(item);
			System.out.println(item.text());
			System.out.println(item.attr("href"));
		}
	}
}
