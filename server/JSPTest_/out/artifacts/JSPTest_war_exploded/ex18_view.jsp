<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
//디렉토리 목록 읽기
String path = application.getRealPath("/Files");

File dir = new File(path);
File[] list = dir.listFiles();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<%@ include file="/inc/asset.jsp"%>

<style>
.list {
	margin: 20px;
}

.list .item {
	width: 200px;
	height: 200px;
	border: 1px solid #AAA;
	background-repeat: no-repeat;
	background-position: center center;
	background-size: contain;
	background-color: #777;
	cursor: pointer;
	
}

.img1 {
	display: block;
	margin: 20px auto;
}
</style>
</head>
<body>
	<div class="container">
		<h1 class="page-header"></h1>

		<div class="list">
			<%
			for (File f : list) {
			%>
			<div class="item"
				style="background-image:url(/jsp/files/<%=f.getName()%>);"
				data-toggle="modal"
				data-target="#myModal"
				onclick="view('<%=f.getName()%>');">
				</div>
			<%-- <img src="/jsp/files/<%= f.getName() %>"> --%>
			<%
			}
			%>
		</div>

		<div class="btns">
			<input type="button value=" Add Image" class="btn btn-default">
		</div>

	</div>

	<!-- Button trigger modal -->
	<button type="button" class="btn btn-primary btn-lg"
		data-toggle="modal" data-target="#myModal">Launch demo modal
	</button>

	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				</div>
				<div class="modal-body">
					<img class="img1">
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-danger">Delete</button>
				</div>
			</div>
		</div>
	</div>
	<script>
		function vew(img){
			//alert(img);
			$('.img1').attr('src', '/jsp/files/' + img);
			
			setTimeout(function(){
				// alert($('.img1').width()); 
				if ($('.img1').width() > 800) {
					tmp = $('.img1').width();
					$('.img1').width(800);
				} else {
					$('.img1').width(tmp);
				}
			}. 200);
		}
	</script>
</body>
</html>






