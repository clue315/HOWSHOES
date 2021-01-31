<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<%= request.getContextPath() %>/js/jquery-3.5.1.min.js"></script>
</head>
<body>
	<h3>주문자 정보 수정</h3>
	<br>
		<input type="text" id="inputPhone" name="inputPhone">
		<input type="text" id="inputEmail" name="inputEmail">

	<input type="button" id="info" value="확인" onclick="changeinfo();">
	<input type="button" id="cancel" value="취소" onclick="window.close();">
	<script>
			$('#inputPhone').val(opener.document.getElementById('orderPhone').value);
			$('#inputEmail').val(opener.document.getElementById('orderEmail').value);										
		
		function changeinfo(){
			opener.document.getElementById('orderPhone').value=$('#inputPhone').val();
			opener.document.getElementById('orderEmail').value=$('#inputEmail').val();
			self.close();
		}
	</script>

</body>
</html>