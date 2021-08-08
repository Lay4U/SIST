<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<%@ include file="/inc/asset.jsp"%>

<style>
</style>
</head>
<body>
   <!--   -->
   <div class="container">
      
      <h1 class="page-header"></h1>
      
   </div>

   <script>
      
   </script>
</body>
</html>


<!-- 
쿠키
-	브라우저가 관리하는 데이터 저장 파일(저장소)
-	텍스트 파일
-	특정 사이트에 현재 접속한 브라우저(사용자)에 대한 개인 정보를 저장하는 공간
-	웹서버가 사용자에 대한 정보를 저장하는 용도 사용
-	
-	쿠키에 대한 접근: JavaScript, Servlet(JSP)

회원 + 카페
- 각 사용자의 정보를 관리
- 접속 횟수, 마지막 로그인 시각, 하루 평균 이용 시간(통계정보) 지속적으로 유지/관리
1. DB(Oracle)
	- 각 사용자별로 데이터를 저장
	- 장점: 전문적이다.
	- 단점: 비싸다(비용, 노동력 등)

ㅡㅡㅡㅡ DB와 Session은 서로 성격이 완전 다름 ㅡㅡㅡㅡㅡ

2. Session(Servlet/JSP)
	- 개인 정보 저장 객체
	- 서버 메모리에 위치
	- 장점 : 가볍고 빠르다. 추가 설치 비용X
	- 단점 : 대용량 데이터 저장X, 접속 종료시 소멸(***)
	
3. cookie
	- 개인 정보 저장 파일
	- 클라이언트 보조 기억장치에 위치
	- 장범: 가볍고 빠르다. 추가 설치 비용 X 접속 종료되도 유지(***)
	- 단점: 대용량 데이터 저장X(최대 4KB)	
	
로그인(인증) > 인증 티켓 발급
1. session
	- 개인 공간
	- 전역 공간(사이트내의 페이지를 이동해서 계속 유지)
	- 유효 기간(접속 종료시)

2. cookie
	- 개인 공간
	- 전역 공간(사이트내의 페이지를 이동해서 계속 유지)
	- 유효 기간(개발자 지정)
	
	

	


회원 + 여행
- 각 사용자의 여행일정을 관리
- 여행일정을 생성해 선택한 음식점, 명소, 숙소등을 지속적으로 유지 관리
1. DB
	- 각 사용

 -->