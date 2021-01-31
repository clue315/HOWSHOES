<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member, product.model.vo.*, mypage.model.vo.*, java.text.*, java.util.ArrayList"%>
<%
	ArrayList<Shopping> s = (ArrayList<Shopping>)request.getAttribute("sList");
	ArrayList<Product> p = (ArrayList<Product>)request.getAttribute("p");
	ArrayList<ArrayList<ProductImage>> pi = (ArrayList<ArrayList<ProductImage>>)request.getAttribute("pi");
	Member member = (Member)request.getAttribute("member");
	DecimalFormat df = new DecimalFormat("###,###");
	int[] sum = new int[s.size()];
	int total =0;
	for(int i = 0; i <s.size(); i++){
		sum[i] =  p.get(i).getpPrice() * s.get(i).getSc_count();
		total += sum[i];
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyPage</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.5.1.min.js"></script>
<style>
	#section{
		margin-left: auto;
		margin-right: auto;
		width: 1150px;
		min-height: 390px;
	}
	.outer{
		border: 3px solid black;
		width: 920px;
		margin-left: 220px;
		margin-top: -326px;
		min-height: 320px;
	}
	.outerBg {
		margin-left: auto; margin-right: auto;
		background-image: url("images/title_bg.png");
		background-repeat : no-repeat;
		width: 242px; height: 35px;
	}
	.outerText {
		color: white;
		text-align: center; vertical-align: middle;
		font-family: "Typo_SsangmunDong"; font-size: 23px;
		width: 242px; height: 35px;
		display: table-cell;
	}
	
/* 사이드메뉴 */
	#subBlue{
		text-align: center;
		color: white;
	    width: 190px; 
	    height: 200px; 
	    background: #4572C4;
	}
	ul {
		margin-top: 0px;
	}
	#subMenuDiv{
		text-align: center;
	}
	.submenuLink { /* 상위 메뉴  a 태그에 공통으로 설정할 스타일 */
		text-decoration: none;
		margin-left: 45px;
		display: block;
		width: 100px;
		font-size: 15px;
		font-weight: bold;
		
	}  
	.subMenuLi { /* 상위 메뉴와 하위 메뉴의 a 태그에 공통으로 설정할 스타일 */
		display: block;
		text-align: center;
		width: 100px;
	    margin-top:  10px;
		font-size: 15px;
		font-weight: bold;
		
	} 
	.subMenuLi:hover .submenuLink{ /* 상위 메뉴의 li에 마우스오버 되었을 때 스타일 설정 */
		color: #4572C4;
	}

	.row_1{
		width: 186px;
		border: 1px solid lightgray;
	}
	.submenuLink { /* 상위 메뉴의 글씨색을 흰색으로 설정 */
		color: black;
	}	
	#userUpadteBtn{ background:white; color:black; padding: 10px; font-weight: bold; font-size: 15px;  outline: none; border: none;}
	#userUpadteBtn:hover{background:black; color:white;}

/* 장바구니  */	
	table {
    	border-collapse: collapse;
    	margin-top: -20px;
    	margin-left: auto;
    	margin-right: auto;
    	width: 90%;
	}
	#notice{
		text-align: center;
		margin-top: 20px;
	    height: 60px; 
	    color: black; 
	    font-size: 14px;
	    font-weight: bolder;
	    color: red;
	}
	#emptyCartTr{
		 height: 150px;
	}
	#emptyCart{
		font-size: 36px;
		font-weight: bolder;
		text-align: center;
	}
	#checkTr{
		height: 40px;
		border-top: 2px solid black;
		border-bottom: 2px solid black;
	}
	#checkTh{
		width: 30px;
	}
	#checkTd{
		text-align: center;
	}
	#imageTd{
		text-align: center;
	}
	#sizeTd{
		text-align: center;
	}
	#orderTd{
		text-align: center;
	}
	#orderDiv{
		font-weight: bold;
		font-size: 18px;
		margin-bottom: 5px;
	}
	#productTr{
		border-top: 1px solid black;
		border-bottom: 1px solid black;
	}
	.calcTopBorder{
		height: 40px;
		border-top: 2px solid black;
		font-weight: bold;
		font-size: 20px;
	}
	.calcBottomBorder{
		height: 40px;
		border-bottom: 2px solid black;
		font-weight: bold;
		font-size: 20px;
	}
	#calcRowspan{
		border-bottom: 2px solid black;
	}
	#allChoiceBtn{
		background: black;
		width: 70px;
		height: 30px;
		border: none;
		outline: none;
		color: white;
		font-weight: bold;
	}
	#allChoiceBtn:hover{
		background:#4572C4;
		cursor:pointer;
	}
    #cShoes_1{ /* 신발사진1  */
		text-align: center;
		color: white;
	    width: 125px; 
	    height: auto; 
	    margin-top: 10px;
	    background: rgb(182, 178, 179);
	} 
    
    #cCom_1{ /* 신발정보1 */
        margin-left: 565px;
	    margin-top: 20px;
    }
    
    #cShoes_2{
		text-align: center;
		color: white;
	    width: 125px; 
	    height: 125px; 
	    margin-left: 730px;
	    margin-top: -205px;
	    background: rgb(182, 178, 179);
	} 
	
    #cCom_2{
        margin-left: 730px;
	    margin-top: 20px;
    }
	.tr1{
		text-align: center;
		margin-top: 20px;
		margin-bottom: 20px;
	}
	.btnspan{
		background: black;
		color: white;
		margin-top: 4px;
		padding: 4px;
		cursor:pointer;
		font-weight: bold;
	}
	.btnspan:hover{
		background: #4572C4;
		color: white;
	}
	#continue{/* 버튼 css*/
		background: white;	
		border:3px solid black;
		outline: none;
		color: black;
		width: 180px;
		height: 50px;
		font-size:20px;
		font-weight: bold;
	}
	#continue:hover{
		border:3px solid #4572C4;
		cursor:pointer;
		color:#4572C4; 
	}
	#finalOrder{/* 버튼 css*/
		background: black;
		border: none;
		outline: none;
		color: white;
		width: 180px;
		height: 50px;
		font-size:20px;
		font-weight: bold;
	}
	#finalOrder:hover{
		background:#4572C4;
		cursor:pointer;
	}
	
/* footer */	
	#footer {
		margin-top: 180px;
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
	<div id="section">
	
    <!-- 사이드메뉴 -->
		<div>
			<div id="subBlue">
		    	<form action="<%= request.getContextPath() %>/updateForm.me" method="post" id="myForm" name="myForm">
				<br>
				<br><strong><%= member.getM_Name() %>님<br>
		        <br> 보유 포인트<br> <%= member.getPoint() %>원</strong><br>
		        <br>
		        <input type="submit" id="userUpadteBtn" value="회원 정보 관리">
				</form> 
			</div>
			<div id="subMenuDiv">
				<ul>
					<li class="subMenuLi">
						<a class="submenuLink" href="<%= request.getContextPath() %>/mypageList.mp">장바구니</a>
					</li>
					
					<li class="subMenuLi"><hr class="row_1"></li>
					
					<li class="subMenuLi">
						<a class="submenuLink" href="<%= request.getContextPath() %>/myPagepurchase.mp">주문내역</a>
					</li>
					
					<li class="subMenuLi"><hr class="row_1"></li>
					
					<li class="subMenuLi">
						<a class="submenuLink" href="<%= request.getContextPath() %>/reviewList.my">리뷰관리</a>
					</li>
					
					<li class="subMenuLi"><hr class="row_1"></li>
				 </ul>
			</div>
		</div>
 <!--========================= 장바구니 =====================  -->
		<div class="outer">
				<div>
					<div class="outerBg">
						<div class="outerText">장바구니</div>
					</div>
				</div>
			<div>
			</div><br>
			<form method="get" action="<%= request.getContextPath() %>/orderList.or" id="from" name="from" onsubmit=" return checkorder(this);">
			<input type="hidden" name="ad" id="ad" value="">
				<table id="orderTable">
					<tr id="noticeTr">
						<td colspan="7">
							<div id="notice">
								장바구니 상품은 최대 30일간 저장됩니다.<br>
								가격, 옵션 등 상품 정보가 변경된 경우 주문이 불가능 할 수 있습니다. 
							</div>
						</td>
					</tr>
					<% if(s.size()>0){ %>
					<tr id="checkTr">
						<th id="checkTh"><input type="checkbox" value="전체선택" id="all" onclick="selectAll();"></th>
						<th><input type="button" onclick="selectAllBtn()" value="전체선택" id="allChoiceBtn"></input></th>
						<th colspan="3">상품정보</th>
						<th>사이즈</th>
						<th>주문금액</th>
					</tr>
					<% for(int i = 0; i<s.size(); i++){ %>
					<tr id="productTr">
						<td id="checkTd"><input type="checkbox" class="chekboxsize" name="category" value="<%= i %>" id="c<%=i %>" onclick="selectOne();"></td>
						<td id="imageTd"><img src="<%= request.getContextPath() %>/productImage_uploadFiles/<%= pi.get(i).get(0).getPiChangeName() %>" id="cShoes_1"></img></td>
						<td id="productTd" colspan="3"><input type="hidden" value="<%= s.get(i).getSc_count() %>">상품명 : <%= p.get(i).getpName() %><br>수량 : <%= s.get(i).getSc_count() %> 개<br>상품 금액 : <%= df.format(p.get(i).getpPrice()) %>원</td>
						<td id="sizeTd"><%= s.get(i).getPo_size() %><input type="hidden" value="<%= p.get(i).getpNo() %>"></td>
						<td id="orderTd"><div id="orderDiv"><%= df.format(sum[i]) %>원</div><span class="btnspan" onclick="order();">해당 상품 주문하기</span></td>
					</tr>
					<%} %>
				<!-- ============ 총 주문금액 ================  -->
					<tr id="calcTr1" class="tr1">
						<td class="calcTopBorder"></td>
						<td class="calcTopBorder">총 상품금액</td>
						<td class="calcTopBorder" id="calcRowspan" rowspan="2">+</td>
						<td class="calcTopBorder">배송비</td>
						<td class="calcTopBorder" id="calcRowspan" rowspan="2">=</td>
						<td class="calcTopBorder" colspan="3">총 주문금액</td>
					</tr>
					<tr id="calcTr2" class="tr1">
						<td class="calcBottomBorder"></td>
						<td class="calcBottomBorder"><span id="span1">0</span> 원 </td>
						<td class="calcBottomBorder"><span id="span2">0</span> 원</td>
						<td class="calcBottomBorder" colspan="3"><span id="span3">0</span> 원</td>
					</tr>
					<% } else { %>
					<tr id="emptyCartTr">
						<td colspan="7" id="emptyCart">
							장바구니에 등록된 상품이 없습니다
						</td>
					</tr>
					<% } %>
				</table>
				<div class="tr1">
					<input type="button" id="continue" onclick="main()" value="쇼핑 계속하기"></input>
					<% if(s.size()>0){ %>
					<input type="submit" id="finalOrder" value="주문하기"></input>
					<% } %>
				</div>
			</form>
		</div>
	</div>
 
	<div id="footer">
		<hr id="footer_hr">
		<h4 class="footer_text" id="line1">고객센터 : 1588-0000  |  이메일 : amg@howshoes.com  |  운영시간 : 월~금 / 09:00~18:00 / 주말, 공휴일 휴무</h4>
		<h4 class="footer_text" id="line2">(주)안녕하슈  |  대표이사 : 강건강  |  주소 : 서울특별시 강남구 역삼동 남도빌딩 3층</h4>
		<h4 class="footer_text" id="line3">사업자등록번호 : 201-81-12345  |  개인정보보호 책임자 : 남나눔</h4>
	</div>
	 
    <script>	
		console.log(<%= s.size()%>);
	    function main(){
	    	 location.href='<%= request.getContextPath() %>';
	    }
	 	var all = document.getElementById("all");
	 	var category = document.getElementsByName("category");
	 	var count = 0;//전체보기버튼
	 	function selectAllBtn(){
	 		if(count == 0){
	 		all.checked = true;
	 		selectAll();
			count++; 			
	 		} else{
	 			count=0;
	 			all.checked = false;
	 	 		selectAll();
	 		}
	 	}
	 	
	 	function selectAll(){
	 		if(all.checked){
	 			for(var i = 0; i < category.length; i++){
	 				category[i].checked = true;
	 			}
	 				$('#span1').text(numberWithCommas(<%= total%>));
	 				Total = <%= total%>;
	 				allTotal = Total + 2500;
	 				$('#span2').text(numberWithCommas(2500));	
	 				$('#span3').text(numberWithCommas(allTotal));	
	 		}else{
	 			for(var i = 0; i < category.length; i++){
	 				category[i].checked = false;
	 			}
	 			Total = 0;
	 			allTotal = 0;
	 			$('#span1').text(0);
	 			$('#span2').text(0);
	 			$('#span3').text(0);
	 		}
	 	}
	 	
	 	function selectOne(){
	 		var count = 0;
	 		
	 		for(var i = 0; i < category.length; i++){
	 			if(category[i].checked){
	 				count++;
	 			}
	 		}	
		 	if(count != 4){
		 		all.checked = false;
		 	}else{
		 		all.checked = true;
		 	}
		}
	 	function numberWithCommas(x) {//금액 콤마 찍기위해서 만듬 함수
		    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}
	 	var Total = 0; //상품 금액(체크된상품)
	 	var allTotal = 0;// 배송비포함 총 상품 금액
	 	$(document).ready(function(){//체크박스 확인
	 		<% for(int i = 0; i<s.size(); i++){ %>
	 	    $("#c<%=i %>").change(function(){
	 	        if($("#c<%=i %>").is(":checked")){
	 	        	Total = Total + (<%=p.get(i).getpPrice()%> * <%=s.get(i).getSc_count()%>);
		 	        allTotal = Total + 2500;
		 	        $('#span1').text(numberWithCommas(Total));
		 	        $('#span2').text(numberWithCommas(2500));	
		 			$('#span3').text(numberWithCommas(allTotal));
	 	        }else{
	 	        	var count = 0;
	 	    		for(var i = 0; i < category.length; i++){
	 	    			if(category[i].checked){
	 	    				count++;
	 	    			}
	 	    		}
	 	    		Total = Total - (<%=p.get(i).getpPrice()%> * <%=s.get(i).getSc_count()%>);
	 	        	allTotal -= (<%=p.get(i).getpPrice()%> * <%=s.get(i).getSc_count()%>);
		        	
	 				if(count > 0){
			        	$('#span1').text(numberWithCommas(Total));
		 				$('#span3').text(numberWithCommas(allTotal));
	 				} else{//체크된것이 없으면 0원으로 보이게 만들었다.
	 					$('#span1').text(0);
	 					$('#span2').text(0);
	 					$('#span3').text(0);	
	 				}
	 	        }
	 	    });
	 	    <% } %>
	 	});
	 	
	 	function order(){//주문하기 버튼
	 		$('#orderTable tr').click(function(){
	 			var pno = [$(this).children().eq(3).children().val()];
	 			var size = [$(this).children().eq(3).text()];
	 			var count = [$(this).children().eq(2).children().val()];
	 			var test = [pno, size, count];
				location.href="<%= request.getContextPath() %>/orderList.or?ad=" + test;
	 		});
	 	}
	 	
	 	function checkorder(t){//여러상품 주문
	 		var count = 0;
	 		var pno = new Array();
	 		var size = new Array();
	 		var count1 = new Array();
	 		var c = $('input:checkbox[name=category]:checked');
			c.each(function(i){
				count++;
				var tr = c.parent().parent().eq(i); 
				var td = tr.children()
				
				var pno2 = td.eq(3).children().val();
				var size2 = td.eq(3).text();
				var count2 = td.eq(2).children().val();
							
				pno.push(pno2);
				size.push(size2);
				count1.push(count2);
			});
			test = [pno, size, count1];
	 		if(count==0){
	 			alert("상품을 선택해주세요.");
	 		}else{
	 			document.getElementById('ad').value = test;
	 		}
	 	}
   	</script>	
</body>
</html>