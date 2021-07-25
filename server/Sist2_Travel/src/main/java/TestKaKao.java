import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.Charset;

public class TestKaKao {
//		37.47150565190942 126.59619949317715
//		/v2/local/search/category.{format} 
//		private static String query = "category_group_code=encodeURIComponent('AT4')&x=&y=&radius=5000";
//		private static String query = "category_group_code=AT4"; //실행됨
		private static String query = "category_group_code=AD5&x=37.47150565190942&y=126.59619949317715&radius=5000"; 
	
	    private static String GEOCODE_URL="http://dapi.kakao.com/v2/local/search/category.json?"+query;
	    private static String GEOCODE_USER_INFO="KakaoAK b7007a415d33c970f8d73abba2ce576c"; 
	    
	    public static void main(String[] args) {
			
	        URL obj;
		
	        try{
	            //인코딩한 String을 넘겨야 원하는 데이터를 받을 수 있다.
//	            String address = URLEncoder.encode("대구광역시 중구 동성로2가 동성로2길 81", "UTF-8");
	            
	            obj = new URL(GEOCODE_URL);
				
	            HttpURLConnection con = (HttpURLConnection)obj.openConnection();
	            
	            //get으로 받아오면 된다. 자세한 사항은 카카오개발자센터에 나와있다.
	            con.setRequestMethod("GET");
	            con.setRequestProperty("Authorization",GEOCODE_USER_INFO);
	            con.setRequestProperty("content-type", "application/json");
	            con.setDoOutput(true);
	            con.setUseCaches(false);
	            con.setDefaultUseCaches(false);
				
	            Charset charset = Charset.forName("UTF-8");
	            BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream(), charset));
	            
	            String inputLine;
	            StringBuffer response = new StringBuffer();
	            
	            while ((inputLine = in.readLine()) != null) {
	                response.append(inputLine);
	            }
				
	            //response 객체를 출력해보자
	            System.out.println(response.toString());
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}

	
}
