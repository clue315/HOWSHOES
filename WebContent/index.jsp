<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body onload="goMain();">
<script>
	function goMain(){
		var no = 1;
		location.href='<%= request.getContextPath() %>/rank.po?no=' + no;	
	}
	
</script>
</body>
</html>