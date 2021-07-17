<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%

   //1. 파일 업로드 처리
   //2. ex18_view.jsp로 이동하기(목록보기)
   
   //1. 경로
   String path = application.getRealPath("/files");

	//2. 
	int size = 1024 * 1024 * 100;
	
	//3. 첨부 파일의 갯수?
	// - filename: 실제 파일명
	// - orgfilename: 원본 파일명
	ArrayList<String> filename = new ArrayList<String>();
	
	try{
		
		//단일 파일 업로드 == 다중 파일 업로드
		MultipartRequest multi = new MultipartRequest(
				request,
				path,
				size,
				"UTF-8",
				new DefaultFileRenamePolicy()
				);
		
		//올린 업로드 파일들의 파일명??
		// String[] temp = multi.getParameterValues("attach");
		
		multi.getFileNames();
		Enumeration e = multi.getFileNames();
		
		while( e.hasMoreElements()){
			System.out.println(e.nextElement());
		}
		
	} catch(Exception e){
		System.out.println(e);
	}
	
		

%>
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
   
      <h1 class="page-header"></h1>
   
   </div>
   
   
   <script>
   
   </script>
</body>
</html>






