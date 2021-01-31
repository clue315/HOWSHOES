<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%
   	String msg=  (String)request.getAttribute("msg");
   %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	#homebtn{color:white; background-color:black; font-size:25px; font-weight:bold;}
	#backbtn{color:black; background-color:white; border:3px solid black; font-size:25px; font-weight:bold;}
</style>
<title>Insert title here</title>
</head>
<body>
 <%@ include file="../common/menubar.jsp" %>
	<h1 align="center"><%= msg %></h1>
	<div align="center">
		<button id="backbtn" onclick="history.back();">이전 페이지</button>
		<button id="homebtn" onclick="location.href='<%= request.getContextPath() %>'" >홈으로 돌아가기</button>
	</div>
</body>
</html>