<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%

   

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<%@ include file="/inc/asset.jsp" %>

<style>
	input[type=file].form-control{
		display: inline-block;
		width: 90%
	}
	td > input {
		float: left;
	}
</style>
</head>
<body>
   <!--  -->
   <div class="container">
   
      <h1 class="page-header">Gallery <small>Add Image</small></h1>
      
      <form method="POST" action="/jsp/ex18_file_ok.jsp" enctype="multipart/form-data">
      
		<table class = "table table-bordered">
			<tbody>
				<tr>
					<th>이미지: </th>
					<td>
					<input type="file" name="attach" class="form-control">
					</td>
					
				</tr>
			</tbody>
		</table>
		
		<div class="btns">
			<input type="button" value="이미지 추가하기" class="btn btn-default" id="btnAdd" accept=".gif, .jpg, .png">
			<input type="submit" value="등록하기" class="btn btn-default">
		</div>
	</form>      
      
      
   
   </div>
   
   
   <script>
   
   let indedx =1;
   
   	$("#btnAdd").click(function(){
   		index++;
   		$("table tbody").append("
				<tr>
				<th>이미지: </th>
				<td><input type=\"button\" value=\"delete\" class\"file\" name=\"attach\" class=\"form-control\">
				
				</td>
				</tr>
   				");
   	});
   	
   	function delBtn(){
   		$(event.srcElement).parent().parent().remove();
   	}
   </script>
</body>
</html>






