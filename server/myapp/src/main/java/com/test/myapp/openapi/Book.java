package com.test.myapp.openapi;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

@WebServlet("/openapi/book.do")
public class Book extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//할일
		//1. 검색어 가져오기
		//2. OpenAPI 요청 > 결과 반환(JSON)
		//3. JSON 분석 > 자바화(자바형태로 변환)
		//4. 결과를 JSP에게 전달  + 호출
		
		//1.
		//a. book.do > req.getParameter("query") > null 
		//b. book.do?query=? > req.getParameter("query") > "자바"
		//c. book.do?query=	//빈문자열 > req.getParameter("query") >""
		//d. 
		String query = req.getParameter("query");
		

		if (query != null && !query.equals("")) {
			
			//2.
			String result = getJSON(query);
			//System.out.println(result);
			
			//3.
			JSONParser parser = new JSONParser();
			
			try {
				JSONObject obj = (JSONObject)parser.parse(result);
				
				//System.out.println(obj.get("total"));
				req.setAttribute("total", obj.get("total").toString());
				
				//검색된 책을 JSP에게 전달하기
				JSONArray list = (JSONArray)obj.get("items");
				
				req.setAttribute("list", list);
				
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		
		
		
		
		
      

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/openapi/book.jsp");
		dispatcher.forward(req, resp);

	}
	
	private static String getJSON(String query) {
		  String clientId = "eWSx3TnawKDhdJy9X9JU"; //애플리케이션 클라이언트 아이디값"
	        String clientSecret = "XYsSlGSYsU"; //애플리케이션 클라이언트 시크릿값"


	        String text = null;
	        try {
	            text = URLEncoder.encode(query, "UTF-8");
	        } catch (UnsupportedEncodingException e) {
	            throw new RuntimeException("검색어 인코딩 실패",e);
	        }

	        
	        String apiURL = "https://openapi.naver.com/v1/search/book.json?query=" + text + "&display=1000";    // json 결과
	        //String apiURL = "https://openapi.naver.com/v1/search/blog.xml?query="+ text; // xml 결과


	        Map<String, String> requestHeaders = new HashMap<>();
	        requestHeaders.put("X-Naver-Client-Id", clientId);
	        requestHeaders.put("X-Naver-Client-Secret", clientSecret);
	        String responseBody = get(apiURL,requestHeaders);


//	        System.out.println(responseBody);
	        return responseBody;
	}
	
	private static String get(String apiUrl, Map<String, String> requestHeaders){
        HttpURLConnection con = connect(apiUrl);
        try {
            con.setRequestMethod("GET");
            for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
                con.setRequestProperty(header.getKey(), header.getValue());
            }


            int responseCode = con.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
                return readBody(con.getInputStream());
            } else { // 에러 발생
                return readBody(con.getErrorStream());
            }
        } catch (IOException e) {
            throw new RuntimeException("API 요청과 응답 실패", e);
        } finally {
            con.disconnect();
        }
    }


    private static HttpURLConnection connect(String apiUrl){
        try {
            URL url = new URL(apiUrl);
            return (HttpURLConnection)url.openConnection();
        } catch (MalformedURLException e) {
            throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
        } catch (IOException e) {
            throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
        }
    }


    private static String readBody(InputStream body){
        InputStreamReader streamReader = new InputStreamReader(body);


        try (BufferedReader lineReader = new BufferedReader(streamReader)) {
            StringBuilder responseBody = new StringBuilder();


            String line;
            while ((line = lineReader.readLine()) != null) {
                responseBody.append(line);
            }


            return responseBody.toString();
        } catch (IOException e) {
            throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
        }
    }

}