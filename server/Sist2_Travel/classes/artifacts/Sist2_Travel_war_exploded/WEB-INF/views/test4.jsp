<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <style>

   </style>
   <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b98db171cb4bc02433f272306db4edb2"></script>
   <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<title></title>



<style>
</style>
</head>
<body>
   <!-- test.jsp -->
   <div class="container">

   <%--
   어느 한 지역을 선택한 뒤에 > 선택된 지역을 기반으로 명소, 음식점, 숙소 리스트를 출력
   API를 이용.
   --%>

      <h1 class="page-header">지도</h1>
      <div id="map" style="width:80%;height:500px;"></div>
      <form method="GET" action="/mvc/test/map.do">
      		<input type="text" name="query">
      </form>
     <div></div>
   </div>
   <script>
   /* GET /v2/local/search/category.{format} HTTP/1.1
   Host: dapi.kakao.com
   Authorization: KakaoAK {REST_API_KEY}

   AT4   관광명소
AD5   숙박
FD6   음식점
   */
   var container = document.getElementById('map'); // 지도 태그 선택

	var options = {
		center: new daum.maps.LatLng(37.499331, 127.033181), // 지도의 중앙 좌표
		level: 3 // 지도의 레벨(확대,축소)
	};

	var map = new daum.maps.Map(container, options); //지도 생성


	$.ajax({
	       url:'https://dapi.kakao.com/v2/local/search/keyword.json?y=37.514322572335935&x=127.06283102249932&radius=20000&query='+encodeURIComponent('${query}'),
	             type:'GET',
	             headers: {'Authorization' : 'KakaoAK b7007a415d33c970f8d73abba2ce576c'},
	      success:function(data){
	         for(var i=0; i<data.documents.length; i++){

	        	 let marker = new daum.maps.Marker({
	 				position: new daum.maps.LatLng(data.documents[i].y, data.documents[i].x)
	 			});

	 			marker.setMap(map);

	 			var rs = rs + data.documents[i].place_name +"<br>";
	 				rs = rs + data.documents[i].address_name +"<br>";
	               	rs = rs + data.documents[i].category_group_code +"<br>";
	               	rs = rs + data.documents[i].category_group_name +"<br>";
	               	rs = rs + data.documents[i].category_name +"<br>";
	               	rs = rs + data.documents[i].distance +"<br>";
	               	rs = rs + data.documents[i].id +"<br>";

	         }
	 			$('body').append(rs);

	 			map.setCenter(new kakao.maps.LatLng(data.documents[0].y, data.documents[0].x));
	      },
	      error : function(e){
	         console.log(e);
	      }
	});

	kakao.maps.event.addListener(map, 'center_changed', function() {

	    // 지도의  레벨을 얻어옵니다
	    var level = map.getLevel();

	    // 지도의 중심좌표를 얻어옵니다
	    var latlng = map.getCenter();


	    var lat = latlng.getLat()
	    var lng = latlng.getLng()

	    var resultDiv = document.getElementById('result');
	    resultDiv.innerHTML = message;

	});




   </script>
</body>
</html>
