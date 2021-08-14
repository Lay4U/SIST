<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<%-- <%@ include file="/inc/asset.jsp" %>
<%@ include file="/inc/asset_member.jsp" %> --%>
<tiles:insertAttribute name="asset"></tiles:insertAttribute>
<tiles:insertAttribute name="asset_member"></tiles:insertAttribute>
<style>
</style>

</head>
<body>
	<!-- member/info.jsp > layout/member.jsp -->
	<main>
		
		<!--  Tiles 장점: 현재 페이지(레이아웃 페이지, 템플릿 페이지) > 레이아웃만 구성하는 전문 페이지 -->
		<tiles:insertAttribute name="mainmenu"></tiles:insertAttribute>
		<tiles:insertAttribute name="submenu"></tiles:insertAttribute>
		<tiles:insertAttribute name="content"></tiles:insertAttribute>
	


		<div id="content">회원의 정보를 확인합니다.</div>
	</main>

	<script>
		
	</script>
</body>
</html>












