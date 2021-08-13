<%--
  Created by IntelliJ IDEA.
  User: HR
  Date: 2021-08-11
  Time: 오후 2:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>

    <%@ include file="/inc/asset.jsp" %>

    <style>

    </style>

</head>
<body>
<!--  -->
<div class="container">
    <h1 class="page-header">데이터 입력하기</h1>

    <form method = "POST" action="/spring/data/addok.action">
        <table class="table table-bordered">
            <tr>
                <th>이름</th>
                <td><input type="text" name="name" class="form-control" required></td>
            </tr>
            <tr>
                <th>나이</th>
                <td><input type="text" name="age" class="form-control" required></td>
            </tr>
            <tr>
                <th>주소</th>
                <td><input type="text" name="address" class="form-control" required></td>
            </tr>
            <tr>
                <th>전화번호</th>
                <td><input type="text" name="tel" class="form-control" required></td>
            </tr>
            <tr>
                <th>이메일</th>
                <td><input type="text" name="email" class="form-control" required></td>
            </tr>
        </table>
        <div>
            <input type="submit" value="보내기" class="btn btn-default">
        </div>
    </form>

</div>

<script>

</script>
</body>
</html>
