<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>myapp</title>

    <%@ include file="/inc/asset.jsp" %>
    <script type="text/javascript"
            src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b98db171cb4bc02433f272306db4edb2"></script>
    <style>

    </style>

</head>
<body>
<!-- template.jsp -->
<%@ include file="/inc/header.jsp" %>

<section class="main-section">

    <h1>Map API <small>기본 지도</small></h1>


    <div id="map" style="width:500px;height:400px;"></div>


    <div class="btn-group" role="group">
        <button class="btn btn-group" id="btn1" value="강남역으로 이동하기"></button>
        <button class="btn btn-group" id="btn2" value="서울역으로 이동하기"></button>
    </div>
    <hr>
    <div class="btn-group" role="group">
        <button class="btn btn-group" id="btn3" value="확대하기"></button>
        <button class="btn btn-group" id="btn4" value="축소하기"></button>
    </div>
    <hr>
    <div class="btn-group" role="group">
        <button class="btn btn-group" id="btn5" value="드래그 on/off"></button>
        <button class="btn btn-group" id="btn6" value="줌 on/off"></button>
    </div>



</section>


<%@ include file="/inc/init.jsp" %>
<script>
    var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
    var options = { //지도를 생성할 때 필요한 기본 옵션
        center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
        level: 3 //지도의 레벨(확대, 축소 정도)
    };

    var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴

    //추가 설정
    var mapTypeControl = new daum.maps.MapTypeControl();
    map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);

    var zoomControl = new daum.maps.ZoomControl();
    map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);

    var setDraggable(false);

    //버튼 클릭 > 해당 위치로 이동
    $('#btn1').click(funtion(){
        //이동할 좌표?
        var seoulStation = new daum.map.LatLng(37.554961, 126.970858);
        map.setCenter(soulStation);

    });

    $('#btn2').click(funtion(){
        //이동할 좌표?
        var yeoksamStation = new daum.map.LatLng(37.500464, 127.036173);
        map.setCenter(soulStation);

    });

    $('#btn3').click(function(){
        map.setLevel(map.getLevel() - 1);
    });

    $('#btn4').click(function(){
        map.setLevel(map.getLevel() +1);
    });

    $('#btn5').click(function(){
        if(map.getDraggable()){
            map.setDraggable(false);
            $(this).removeClass('btn-primary');
            $(this).addClass('btn-default');
        } else {
            map.setDraggable(false);
            $(this).removeClass('btn-default');
            $(this).addClass('btn-primary');
        }
    })

    $('#btn6').click(function(){
        if(map.getZoomable()){
            map.setZoomable(false);
            $(this).removeClass('btn-primary');
            $(this).addClass('btn-default');
        }else{
            map.setZoomable(true);
            $(this).removeClass('btn-default');
            $(this).addClass('btn-primary');
        }
    })
</script>
</body>
</html>

http://localhost:8090/myapp/map/map.do?no=ex03
이클립스 :
@WebServlet("/board/board.do")
http://localhost:8090/myapp/board/board.do

인텔리제이:
@WebServlet("/board/board.do")
http://localhost:8090/board/board.do







