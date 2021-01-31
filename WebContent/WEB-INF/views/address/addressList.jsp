<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, member.model.vo.*, address.model.vo.*"%>
<%
 	ArrayList<Address> aList = (ArrayList<Address>)request.getAttribute("aList");
	String[] checked = new String[5];
	String num = "";
	if(aList != null){
	for(int i =0; i<aList.size(); i++){
		if(aList.get(i).getChose().equals("Y")){
				switch(i+1){
				case 1: checked[0] = "checked"; num = "1";break;
				case 2: checked[1] = "checked"; num = "2";break;
				case 3: checked[2] = "checked"; num = "3";break;
				case 4: checked[3] = "checked"; num = "4";break;
				case 5: checked[4] = "checked"; num = "5";break;
				}
			}
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/jquery-3.5.1.min.js"></script>
<style>
	/* 태그 속성  */
	*{padding:0; margrin:0;}
	ul > li{list-decoration:none;  font-weight:bold; font-size:15px; display:inline-block; padding: 0 10px;}
	ul{text-align:center;}
	html, body {height: 100%;}
	small, sub{color:#AFA8A8;}
	
	/*주소 테이블 속성값  */
	table{border:1px solid black; border-collapse: collapse; table-layout:fixed; width:100%; margin: auto; }
	#address-table td,th{border:1px solid black; text-align:center;}
	#address-table td,th:nth-child(1){width:50px; height: 50px;}
	#address-table td,th:nth-child(2){width:150px; height: 50px;}
	#address-table td,th:nth-child(3){width:100px; height: 50px;}
	#address-table td,th:nth-child(4){width:300px; height: 50px;}
	#address-table td,th:nth-child(5){width:100px; height: 50px;}
	
	/*중앙 */
	article{margin:10px auto;  box-sizing:border-box;}
	footer{height:100px;  margin:auto; clear:both; text-align:center; }
	section{margin:0 auto 20px auto; box-sizing:border-box; padding:0 100px;}
	
	/*중앙 컨텐츠 */
	#category{display:relative; background-image: url('image/trapezoid.png'); background-size:cover; width:auto; font-weight:bold;  }
	#category-list {color:white; margin:0 auto;}
	
	#comment{display:inline-block; width:90%;  margin:30px auto 0 auto;}
	#address-table{margin:0 auto; positon:absolute;}
	.table-list-head{background-color:lightgray;}
	
	/*적립금, 유저 정보 테이블*/ 
	.user{display:inline-block;text-align:center;}
	#link-location{margin:30px auto 0 auto;}
	#mypage-user-info{ border:1px solid #DBDBDB;}
	#user-modify{float:right;}
	#user-level{background-color:#DBDBDB; padding: 10px 50px;}
	#user-info-table td{border:1px solid black; text-align:center;}
	#user-info-table td:nth-child(1){width:40px;}
	#user-info-table td:nth-child(2){width:400px;}
	#user-info-table td:nth-child(3){width:50px;}
	#user-info-table td:nth-child(4){width:50px;}
	
	/*테이블 버튼*/
	.btn-f{position: relative; background:black; color:white; padding: 10px; font-weight: bold; font-size: 15px; margin:20px auto; }
	.btn-f:hover{color:#4572C4;}
	#btn{float:right;}
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	<section>
	<article>
		<div id="Mypage-link">
			<div id="link-location">
				<small>홈 > 정보수정</small>
				<h2 style="maring:10px auto;">MY PAGE</h2>
			</div>
			
			<table id="user-info-table">
				<tr>
					<td id="user-level"><strong>회원등급</strong><h3>WELCOME</h3></td>
					<td id="user-info"><p><strong>홍길동</strong>님 안녕하세요. </p>  </td>
					<td id="user-saved-money"><p>적립금</p><strong>0원</strong></td>
					
				</tr>
			</table>
		</div>
		
		<div id ="comment"><p><strong>배송지 관리</strong> | <sub>자주쓰는 배송지를 등록 및 관리 하실 수 있습니다.</sub></p></div>
		<hr><br><br>
		
		<div>
		<form id="from" name="from">
			<input type="hidden" name="id" value="<%= aList.get(0).getMId() %>">
			<input type="hidden" id="no" name="no" value="1">
			<input type="hidden" id="size" name="size" value="<%= aList.size() %>">
				<table id="address-table"> 
					<thead><p><strong>배송지 목록</strong> | <sub>고객님께서 주문시 사용하셨던 배송지 목록입니다.(최대 5개)</sub></p></thead>
					<tr>
						<th class="table-list-head">선택</th>
						<th class="table-list-head">배송지</th>
						<th class="table-list-head">받는사람</th>
						<th class="table-list-head">주소</th>
						<th class="table-list-head">연락처</th>
					</tr>
					<% for(int i = 0; i<5; i++){%>
						<% if(i<aList.size()) {%>
							<% if(i == 0) {%>
							<tr>
								<td>
									<input type="radio" name="ra" class= "select-add"  value="<%= aList.get(i).getNo() %>" <%= checked[i]%>>
								</td>
								<td id="nameval"><%= aList.get(i).getName() %> <input type="hidden" name="name<%= i %>" value="<%= aList.get(i).getName() %>"></td>
								<td id="personval"><%= aList.get(i).getPerson() %><input type="hidden" name="person<%= i %>" value="<%= aList.get(i).getPerson() %>"></td>
								<td id="addressval"><%= aList.get(i).getAddress() %><input type="hidden" name="address<%= i %>" value="<%= aList.get(i).getAddress() %>"></td>
								<td id="phoneval"><%= aList.get(i).getPhone() %><input type="hidden" name="phone<%= i %>" value="<%= aList.get(i).getPhone() %>"></td>
							</tr>
							<% } else {%>
							<tr>
								<td>
									<input type="radio" name="ra" class= "select-add" value="<%= aList.get(i).getNo() %>" <%= checked[i]%>>
								</td>
								<td id="nameval"><%= aList.get(i).getName() %><input type="hidden" name="name<%= i %>" value="<%= aList.get(i).getName() %>"></td>
								<td id="personval"><%= aList.get(i).getPerson() %><input type="hidden" name="person<%= i %>" value="<%= aList.get(i).getPerson() %>"></td>
								<td id="addressval"><%= aList.get(i).getAddress() %><input type="hidden" name="address<%= i %>" value="<%= aList.get(i).getAddress() %>"></td>
								<td id="phoneval"><%= aList.get(i).getPhone() %><input type="hidden" name="phone<%= i %>" value="<%= aList.get(i).getPhone() %>"></td>
							</tr>
							<% } %>
						<% } else {%>
							<tr>
								<td>
									<input type="radio" name="ra" class= "select-add" <%= checked[i]%>>
								</td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
						<% } %>
					<% } %>
				</table>
				<div id="btn">
					<input type ="button" class="btn-f" value="기본배송지로설정" onclick="changeAddress();">
					<input type ="button" class="btn-f" id="modify" value="배송지 추가" onclick="insertAddress();">
					<input type ="button" class="btn-f" id="modify" value="수정" onclick="checkNo(this.form);">
					<input type ="button" class="btn-f" value="삭제" onclick="deleteAddress()">
				</div>
			</form>

	</div>
		<script>
			function deleteAddress(){
				var no = document.getElementById('size').value;
				if(no == 1){
					alert("배송지는 최소 1개이상있어야합니다.");
				} else {
					var bool = confirm("정말 삭제하시겠습니까?");
					var no = $('input[name="ra"]:checked').val();
					if(bool){
						location.href="<%= request.getContextPath() %>/delete.ad?ad=" + no;
					}
				}
			}
			
			function changeAddress(){
				var no = $('input[name="ra"]:checked').val();
				if(no != <%= num %>  ){
					location.href="<%= request.getContextPath() %>/change.ad?ad=" + no;
					alert("수정되었습니다.");
				} else{
					alert("수정실패");
				}
			}
			
			function checkNo(frm){
				var no = $('input[name="ra"]:checked').val();
				document.getElementById('no').value = no;
				window.open('', 'updateAddressForm', 'width=300, height=200');
				frm.target = 'updateAddressForm';
				frm.action='<%= request.getContextPath() %>/address.ad';
				frm.method = 'get';
				frm.submit();
			}
			
			function insertAddress(){
				var no = document.getElementById('size').value;
				if(no >5){
					alert("배송지 저장은 최대 5개만 가능합니다.");
				} else{
					window.open('insert2.ad', 'insertAddressForm', 'width=300, height=200');
				}
			}
		</script>
	</article>
	</section>

	<footer><p><strong>통합고객센터</strong> 080-000-0000 &nbsp; 1588-0000 &nbsp; 월 ~ 금  &nbsp; 09:00 ~ 18:00(주말, 공휴일 휴무)<br>
					 <small> (주)안녕하슈  &nbsp; |  &nbsp; 대표이사: 아무개  &nbsp;| &nbsp;주소 : 서울특별시 강남구 역삼동 <br>
					   	사업자 등록번호 : 201-81-12341  &nbsp;|&nbsp; 개인정보보호 책임자 : 아무개  &nbsp;|&nbsp;이메일 : amg@helloshoeskorea.com</small>	
			</p></footer>
			
</body>
</html>