<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myapp</title>

<%@ include file="/inc/asset.jsp"%>

<style>

</style>

</head>
<body>
	<!-- views > member > login.jsp -->
	<%@ include file="/inc/header.jsp"%>

	<section class="main-section">

		<h1>Option</h1>

		<h2>Header Color</h2>

		<h3>Menu</h3>
		<div class="well well-sm">
			<label><input type="radio" name="munucolor" class="menucolor" value="tomato">
			<span style="background-color: tomato; display: inline-block; border-radius: 3px; width: 10px heigth: 10px;">&nbsp;</span></label>
			<label><input type="radio" class="menucolor" value="cornflowerblue">
			<span style="background-color: cornflowerblue; display: inline-block; border-radius: 3px; width: 10px heigth: 10px;">&nbsp;</span></label>
			<label><input type="radio" class="menucolor" value="gold"><span>&nbsp;</span></label>
		</div>


		<h3>Member</h3>
		<div class="well well-sm">
			<label><input type="radio" class="membercolor" value="tomato"><span>&nbsp;</span></label>
			<label><input type="radio" class="membercolor" value="cornflowerblue"><span>&nbsp;</span></label>
			<label><input type="radio" class="membercolor" value="gold"><span>&nbsp;</span></label>
		</div>

		<div class="user-list">

			<!-- loginok.do?id=hong&pw=1111 -->

			<button type="button" class="btn btn-default"
				onclick="location.href='/myapp/member/loginok.do?id=hong&pw=1111';">홍길동</button>
			<button type="button" class="btn btn-default"
				onclick="location.href='/myapp/member/loginok.do?id=test&pw=1111';">테스트</button>
			<button type="button" class="btn btn-default"
				onclick="location.href='/myapp/member/loginok.do?id=admin&pw=1111';">관리자</button>
		</div>

	</section>


	<%@ include file="/inc/init.jsp"%>
	<script>
	$('.menucolor').eq(0).prop('checked', true);	
	$('.menucolor').eq(1).prop('checked', true);
	
	$('.menucolor').change(function() {
		//3가지 색상 중 누구를 선택했는지?
		$('.menucolor').each(function(index, item){
			if($(item).prop('checked')){
				//alert($(item).val());
				$('.main-header > section > nav > ul > li').css('color', "$(item).val()");
				
				//선택한 색상을 쿠키에 저장
				setCookie('menucolor', $(item).val(), 365)
			}
		});
	});
	
	$('.membercolor').change(function() {
		//3가지 색상 중 누구를 선택했는지?
		$('.membercolor').each(function(index, item){
			if($(item).prop('checked')){
				//alert($(item).val());
				$('.main-header > section > .auth > .btn-auth').css('color', "$(item).val()");
				
				setCookie('membercolor', $(item).val(), 365)
			}
		});
	});
	
	</script>
</body>
</html>















