<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <style>

   </style>
   <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b98db171cb4bc02433f272306db4edb2"></script>
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
      <div id="map" style="width:100%;height:1000px;"></div>

   </div>
   <script>
      var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
      var options = { //지도를 생성할 때 필요한 기본 옵션
         center: new kakao.maps.LatLng(37.47150565190942, 126.59619949317715), //인천
         level: 3 //지도의 레벨(확대, 축소 정도)
      };

      var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
   </script>
</body>
</html>

