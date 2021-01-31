<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="address.model.vo.*"%>
<% 
	Address a = (Address)request.getAttribute("a");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<b>배송지 추가, 수정 페이지</b>
	<br><!--  onsubmit="reflash();" -->
	<form action="<%= request.getContextPath() %>/update.ad" id="updateAddressForm" method="get">
		<table>
		<tr>
			<td>배송지 : <input type="hidden" name="id" value="<%= a.getMId() %>"> <input type="hidden" name="no" value="<%= a.getNo() %>"></td>
			<td><input type="text" id="inputName" name="inputName" value="<%= a.getName()%>"></td>
		</tr>
		<tr>
			<td>받는사람 : </td>
			<td><input type="text" id="inputPerson" name="inputPerson" value="<%= a.getPerson()%>"></td>
		</tr>
		<tr>
			<td>주소 : </td>
			<td><input type="text" id="inputAddress" name="inputAddress" value="<%= a.getAddress()%>"></td>
		</tr>
		<tr>
			<td>연락처 : </td>
			<td><input type="text" id="inputPhone" name="inputPhone" value="<%= a.getPhone()%>"></td>
		</tr>
		</table>
		<br>
	<input type="submit" id="usedId" value="저장">
	<input type="button" id="cancel" value="취소" onclick="window.close();">
	</form>
</body>
</html>