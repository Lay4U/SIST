<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
	<div class="container">
		<h1 class="page-header"></h1>
<form method="POST" action="/jsp/editok.do">
			<table class="table table-bordered">
			<c:forEach items="${list}" var="map">
				<tr>
					<th>이름</th>
					<td><input type="text" name="name" class="form-control" value=${map.name}></td>
				</tr>
				<tr>
					<th>나이</th>
					<td><input type="number" name="age" min="19" max="100"
						class="form-control" value=${map.age}></td>
				</tr>
				<tr>
					<th>성별</th>
					<td><select name="gender" class="form-control" value=${map.gender}>
							<option value="m">남자</option>
							<option value="f">여자</option>
					</select></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input type="text" name="address" class="form-control" value=${map.address}></td>
				</tr>
			</table>
			<div class="btns">
				<input type="submit" value="추가하기" class="btn btn-default"
				 onclick="href.location='/jsp/editok.do?seq=${map.seq}';"> 
				<input type="button" value="목록보기" class="btn btn-default"
				 onclick="history.back();">
			</div>
			<input type="hidden" value=${map.seq} name="seq">
		</form>
		</c:forEach>
		
	</div>

	<script>
		
	</script>
</body>
</html>






