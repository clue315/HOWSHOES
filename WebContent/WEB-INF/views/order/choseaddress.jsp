<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, address.model.vo.Address"%>
<% ArrayList<Address> a = (ArrayList<Address>)request.getAttribute("aList"); 
	int j =0;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<%= request.getContextPath() %>/js/jquery-3.5.1.min.js"></script>
<style>
	h1{text-align: center;}
	table{border:1px solid black; border-collapse: collapse; table-layout:fixed; width:100%; margin: auto; }
	#address-table td,th{border:1px solid black; text-align:center;}
	#address-table td,th:nth-child(1){width:80px; height: 50px;}
	#address-table td,th:nth-child(2){width:50px; height: 50px;}
	#address-table td,th:nth-child(3){width:200px; height: 50px;}
	#address-table td,th:nth-child(4){width:120px; height: 50px;}
	#address-table td,th:nth-child(5){width:50px; height: 50px;}
	.table-list-head{background-color:lightgray;}
	.choseBtn{background:black; color:white; padding: 5px;}
	.choseBtn:hover{color:#4572C4;}
	.btn{margin: auto;}
	.btn-f{background:black; color:white; padding: 10px; font-weight: bold; font-size: 15px; margin:20px auto; }
	.btn-f:hover{color:#4572C4;}
	#s1{color: gray; border: 1px solid black;}
</style>
</head>
<body>
	<h1>배송지 목록</h1>
	<table id="address-table">
		<tr>
			<th class="table-list-head">배송지</th>
			<th class="table-list-head">수령자</th>
			<th class="table-list-head">주소</th>
			<th class="table-list-head">연락처</th>
			<th class="table-list-head">선택</th>
		</tr>
		<% for(int i = 0; i<5; i++){%>
			<% if(i<a.size()) { j = i; %>
				<tr>
					<td id="nameval"><%= a.get(i).getName() %>
					<% if(a.get(i).getChose().equals("Y")) {%>
						<br><span id="s1">기본선택자</span>
					<% } %>
					</td>
					<td id="parsoenval"><%= a.get(i).getPerson() %></td>
					<td id="addressval"><%= a.get(i).getAddress() %></td>
					<td id="phoneval"><%= a.get(i).getPhone() %></td>
					<td><span class="choseBtn" id="Btn" onclick="choseBtn();">선택</span></td>
				</tr>
			<% } %>
		<% } %>
	</table>
	<div id="btn">
		<input type=button class="btn-f" id="modify" value="닫기" onclick="window.close();">
	</div>
	<script>
	function choseBtn(){
		$('#address-table tr').click(function(){
			var tr = $(this);
			var td = tr.children();
			var name = td.eq(1).text();
			var address = td.eq(2).text();
			var phone = td.eq(3).text();
			
			$("#ad1",opener.document).css("display","none");//선택시 기본창 블록
			$("#ad2",opener.document).css("display","block");//선택시 입력창이 나오게됨
			$("#adcheck2",opener.document).prop("checked",true);//선택시 신규배송지로 라디오버튼 이동
			
			opener.document.getElementById('name2').value = name;
			opener.document.getElementById('phone2').value = phone;
			opener.document.getElementById('add2').value = address;
			window.close();
		});
	}
	</script>
</body>
</html>