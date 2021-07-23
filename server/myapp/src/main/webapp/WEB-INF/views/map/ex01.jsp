<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>myapp</title>

   <%@ include file="/inc/asset.jsp" %>
   <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b98db171cb4bc02433f272306db4edb2"></script>
   <style>

   </style>

</head>
<body>
<!-- template.jsp -->
<%@ include file="/inc/header.jsp" %>

<section class="main-section">

   <h1>Map API <small>01번 템플릿</small></h1>

   <div id="map" style="width: 100%;height:400px;"></div>



</section>


<%@ include file="/inc/init.jsp" %>
<script>
   var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
   var options = { //지도를 생성할 때 필요한 기본 옵션
      center: new daum.maps.LatLng(37.499331, 127.033181), //지도의 중앙 좌표, //지도의 중심좌표.
      level: 3 //지도의 레벨(확대, 축소 정도)
   };

   var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴


</script>
</body>
</html>




이클립스 :
@WebServlet("/board/board.do")
http://localhost:8090/myapp/board/board.do

인텔리제이:
@WebServlet("/board/board.do")
http://localhost:8090/board/board.do







