<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>myapp</title>

    <%@ include file="/inc/asset.jsp" %>

    <style>

    </style>

</head>
<body>
<!-- template.jsp > ex01.jsp > ex04.jsp > add.jsp -->
<%@ include file="/inc/header.jsp" %>

<section class="main-section">

    <h1>Map API <small>추가하기</small></h1>

    <div id="map" style="width: 100%; height: 400px;"></div>

    <hr>

    <form method="POST" action="/myapp/map/addok.do">
        <table class="table table-bordered">
            <tr>
                <th style="width: 150px;">좌표</th>
                <td id="latlng" style="text-align: left;"></td>
            </tr>
            <tr>
                <th>이름</th>
                <td><input type="text" name="name" class="form-control" required></td>
            </tr>
        </table>

        <input type="submit" class="btn btn-default" value="추가하기">
        <input type="button" class="btn btn-default" value="추가하기"
               onclick="location.href='/myapp/map/add.do';">

        <hr>

        <table class="table table-bordered">
            <tr>
                <th style="width: 300px;">이름</th>
                <th>위치</th>
            </tr>
            <c:forEach items="${list}" var="dto">
                <tr>
                    <td><a href="#!" onclick="info(${dto.lat}, ${dto.lng});"${dto.name}</td>
                    <td>위도(${dto.lat}) 경도(${dto.lng})</td>
                </tr>
            </c:forEach>
        </table>
    </form>


</section>


<%@ include file="/inc/init.jsp" %>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c568aa74b3a9671ee3805242fef479b3"></script>
<script>

    var container = document.getElementById('map'); //지도 태그 선택

    var options = {
        center: new daum.maps.LatLng(37.499331, 127.033181), //지도의 중앙 좌표
        level: 3 //지도의 레벨(확대,축소)
    };

    var map = new daum.maps.Map(container, options); //지도 생성(***)

    //----------------------------------------------------------------------
    var m;

    function info(lat, lng){

        if( m != null){
            m.setMap(null);
        }
        var m = new daum.maps.Marker({
            position: new daum.maps.LatLng(lat, lng)
        });

        m.setMap(map);

        map.setCenter(new daum.maps.LatLng(lat, lng));
    }
    <%--
    let list = [
        <c:forEach items="${list}" var="dto">
        {
            name : '${dto.name}',
            lat: ${dto.lat},
            lng: ${dto.lng},
        },
        </c:forEach>
    ];

    <c:forEach items="${list}" var="dto">
    var m = new daum.maps.Marker({
        position: new daum.maps.LatLng(${dto.lat}, ${dto.lng})
    });

    m.setMap(map);

    var content = '${dto.name}';
    var pos = new daum.maps.LatLng(${dto.lat}, ${dto.lng});
    var info = new daum.mpas.InfoWindow({
        position: pos,
        content: content
    });

    info.open(map, m);

    </c:forEach>
    --%>

</script>
</body>
</html>














