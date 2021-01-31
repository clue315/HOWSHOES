<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, java.text.*, order.model.vo.*, product.model.vo.*, member.model.vo.*"%>
<%
	ArrayList<Order> o = (ArrayList<Order>)request.getAttribute("o");
	ArrayList<Product> p = (ArrayList<Product>)request.getAttribute("p");
	ArrayList<ArrayList<ProductImage>> pi = (ArrayList<ArrayList<ProductImage>>)request.getAttribute("pi");
	
	DecimalFormat df = new DecimalFormat("###,###");
	int total=0;
	for(int i =0; i<o.size(); i++){
		total += o.get(i).getoTotal();
	}
	int point = total;
	point *= 0.01;
	int useP = (int)request.getAttribute("point");
	int pp = 2500;
	int sum = (total) + pp - useP;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	html, body {
        margin: 0px;
        padding: 0px;
        height: 100%
    }
	
/* section */
	section {
		margin-top: 60px;
		margin-left: auto;
		margin-right: auto;
		width: 600px; 
	}
	table {
		border-collapse: collapse;
		line-height: 1.5;
	}
	td {
		padding: 5px;
	}
	.bold_underLine {
		border-bottom: 4px solid black;
	}
	.underLine {
		border-bottom: 2px solid black;
	}
	.main_title {
		font-weight: bold;
		font-size: 30px;
		text-align: center;
	}
	.sub_title {
		font-weight: bold;
		font-size: 20px;
	}
	.sum {
		font-weight: bold;
	}
	.button {
		text-align: center;
		margin-top: 12px;
	}
	#myPageBtn {
		border: 0px;
		outline: 2px solid black;
		background: white;
		color: black;
		font-weight: bold;
		font-size: 20px;
		width: 290px; height: 40px;
		cursor: pointer;
	}
	#myPageBtn:hover {
		color: #4572C4; cursor:pointer;
	}
	#shoppingBtn {
		margin-left: 10px;
		border: 0px;
		outline: 2px solid black;
		background: black;
		color: white;
		font-weight: bold;
		font-size: 20px;
		width: 290px; height: 40px;
		cursor: pointer;
	}
	#shoppingBtn:hover {
		color: #4572C4; cursor:pointer;
	}

/* footer */	
	footer {
		text-align: center;
	}
	.footer_text {
		font-family: "맑은 고딕";
		font-size: 12px;
		color: #969696;
	}

</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	<section>
		<table>
			<tr class="bold_underLine">
				<td class="main_title" colspan="3">주문이 완료되었습니다. 감사합니다!</td>
			</tr>
			<!-- 여기부터 -->
			<% for(int i = 0; i<p.size(); i++){ %>
			<% if(i==0){ %>
			<tr>
				<td class="sub_title" colspan="2">주문상품 정보</td>
				<td style="margin-top:5px;" id="image" width="200px" rowspan="4">
					<img  src="<%= request.getContextPath() %>/productImage_uploadFiles/<%= pi.get(i).get(0).getPiChangeName() %>" width="200px">
				</td>
			</tr><tr>
				<td width="120px">상품명</td>
				<td width="280px"><%= p.get(i).getpName() %></td>
			</tr>
			<% } else { %>
			<tr>
				<td width="120px">상품명</td>
				<td width="280px"><%= p.get(i).getpName() %></td>
				<td style="margin-top:5px;" id="image" width="200px" rowspan="3">
					<img  src="<%= request.getContextPath() %>/productImage_uploadFiles/<%= pi.get(i).get(0).getPiChangeName() %>" width="200px">
				</td>
			</tr>
			<% } %>
			<tr>
				<td>사이즈</td>
				<td><%= o.get(i).getPoSize() %>원</td>
			</tr>
			<tr>
				<td>상품가격</td>
				<td><%= df.format(p.get(i).getpPrice()) %>원</td>
			</tr>
			<tr class="underLine">
				<td>수량</td>
				<td><%= o.get(i).getoCount() %>개</td>
			</tr>
			<% } %>
			<!-- 여기까지 포문 돌리기 만들어야한다. -->
			<tr>
				<td class="sub_title" colspan="3">받는사람 정보</td>
			</tr>
			<tr>
				<td>받는사람</td>
				<td colspan="2"><%= o.get(0).getoName() %></td>
			</tr>
			<tr>
				<td>받는주소</td>
				<td colspan="2"><%= o.get(0).getoAddress() %></td>
			</tr>
			<tr class="underLine">
				<td>요청사항</td>
				<% if(o.get(0).getoComment() != null){ %>
				<td colspan="2"><%= o.get(0).getoComment() %></td>
				<% } else { %>
				<td colspan="2"></td>
				<% } %>
			</tr>
			
			<tr>
				<td class="sub_title" colspan="3">결제 정보</td>
			</tr>
			<tr>
				<td>주문금액</td>
				<td colspan="2"><%= df.format(total) %>원 (주문금액의 1% 적립 예정 : <%= df.format(point) %>원)</td>
			</tr>
			<tr>
				<td>사용한 포인트</td>
				<td colspan="2"><%= df.format(useP) %>원</td>
			</tr>
			<tr>
				<td>배송비</td>
				<td colspan="2"><%= df.format(pp) %>원</td>
			</tr>
			<tr class="underLine">
				<td class="sum">총 결제금액</td>
				<td colspan="2" class="sum"><%= df.format(sum) %>원</td>
			</tr>
		</table>
		<div class="button">
			<input type="button" id="myPageBtn" onclick="location.href='<%= request.getContextPath() %>/myPagepurchase.mp'" value="마이페이지">
			<input type="button" id="shoppingBtn" onclick="location.href='<%= request.getContextPath() %>'" value="쇼핑 계속하기">
		</div>
	</section>
	<footer>
		<hr id="footer_hr">
		<h4 class="footer_text" id="line1">고객센터 : 1588-0000  |  이메일 : amg@howshoes.com  |  운영시간 : 월~금 / 09:00~18:00 / 주말, 공휴일 휴무</h4>
		<h4 class="footer_text" id="line2">(주)안녕하슈  |  대표이사 : 강건강  |  주소 : 서울특별시 강남구 역삼동 남도빌딩 3층</h4>
		<h4 class="footer_text" id="line3">사업자등록번호 : 201-81-12345  |  개인정보보호 책임자 : 남나눔</h4>
	</footer>
</body>
</html>