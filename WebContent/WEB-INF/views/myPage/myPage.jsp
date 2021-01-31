<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member, product.model.vo.*,order.model.vo.*, mypage.model.vo.*, java.text.*, java.util.ArrayList"%>
<%
	ArrayList<Order> o = (ArrayList<Order>)request.getAttribute("oList");
	ArrayList<Shopping> s = (ArrayList<Shopping>)request.getAttribute("sList");
	ArrayList<Product> p = (ArrayList<Product>)request.getAttribute("p");
	ArrayList<ArrayList<ProductImage>> pi = (ArrayList<ArrayList<ProductImage>>)request.getAttribute("pi");
	ArrayList<Product> p2 = (ArrayList<Product>)request.getAttribute("p2");
	ArrayList<ArrayList<ProductImage>> pi2 = (ArrayList<ArrayList<ProductImage>>)request.getAttribute("pi2");
	Member member = (Member)request.getAttribute("member");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyPage</title>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet"> 
<style>
	#userUpadteBtn{  background:black; color:white; padding: 10px; font-weight: bold; font-size: 15px;  }
	#userUpadteBtn:hover{color:#4572C4;}
	#userName{color:black; width:auto; text-align: center; font-weight: bold; 
		vertical-align: middle;  height: 50px; display: table-cell;}
	.longLink { /* 좀 더 긴 메뉴 스타일 설정 */
		left:0px; 
		bottom:0px; 
		height:70px; 
		width:100%;
	}   
	section{
		position:relative;
 		margin-left: 300px;
 		margin-right: auto;
 		padding:0 100px;
 		height:auto; 
 		margin-bottom:100px;
	}
	#notice_1{
	    width: 1200px; 
	    height: 30px; 
	    border: 2px solid black; 
	    color: black; 
	    margin-top: 30px;
	    margin-bottom: 30px;
	    padding: 10px; 
	    font-family: 'Do Hyeon', sans-serif;
	    font-size: 23px;
		text-align: center;
	}
	#cAll{ /* 전체보기 버튼 */
	    margin-left: 1300px;
	}
	
	#cNotice{
	    width: 962px; 
	    height: 30px; 
	    border: 1px solid black; 
	    color: black; 
	    padding: 10px; 
	    font-size: 13px;
	    background: rgb(241, 240, 239);
	    
	    margin-left: 240px;
	}
/*===================== 장바구니 ================== */	
	#cart{ /* 장바구니 글자 */
		font-style: bold;
	    font-size: 25px;
	   	margin-bottom:0;
	   	margin-left: 240px;
	}
	#orderList{
		font-style: bold;
	    font-size: 25px;
	   	margin-bottom:0;
	    margin-left: 240px;
	}
	
	#line_1{ 
		width: 810px;
		margin-top: -40px;
		margin-left: 565px;
	}
	
    #cShoes_1{ /* 신발사진1  */
		text-align: center;
		color: white;
	    width: 125px; 
	    height: 125px; 
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
    /* wrap */
   
    
    /*===================== 서브메뉴바 ================== */	
	#subBlue{
		position:relative;
		text-align: center;
		color: white;
	    width: 214px; 
	    height: 224px; 
	    top:-130px;
	    background:rgb(69, 114, 196);
	     
	}
	
 	 #subMenui  li { /* 메인 메뉴 안에 ul 태그 안에 있는 li 태그의 스타일 적용(상위/하위메뉴 모두) */
		color: black;
		background-color: #2d2d2d;
	}   
	
	.submenuLink { /* 상위 메뉴  a 태그에 공통으로 설정할 스타일 */
		text-decoration: none;
		text-align: center;
		display: block;
		width: 200px;
		font-size: 15px;
		font-weight: bold;
		text-align: left;
		
	}  
	.subMenuLi { /* 상위 메뉴와 하위 메뉴의 a 태그에 공통으로 설정할 스타일 */
		position:relative;
		display: block;
		width: 150px;
		font-size: 15px;
		font-weight: bold;
		top:-190px;
	} 
	.subMenuLi:hover .submenuLink{ /* 상위 메뉴의 li에 마우스오버 되었을 때 스타일 설정 */
		color: rgb(69, 114, 196);
	}

	.row_1{
		width: 120px;
	}
	.submenuLink { /* 상위 메뉴의 글씨색을 흰색으로 설정 */
		color: black;
	}
/* ================== 푸터 =====================  */	
	#footer {
		margin-top: 50px;
		text-align: center;
	}
	.footer_text {
		font-family: "맑은 고딕";
		font-size: 12px;
		color: #969696;
	}
	/* 테스트 스타일*/
	table {
		border-top: 1px solid #444444;
    	border-collapse: collapse;
    	margin-left: 240px;
    	margin-top: 20px;
	}

	tr{
	 border-bottom: 1px solid #444444;
	}
	td{
	padding: 10px;
	font-size: 20px;
	}
	.space{
	width: 220px;
	}
	.cspace{
	width: 10px;
	}
	#tr1{
	text-align: center;
	margin-top: 5px;
	
	}
	.btnspan{
		border: 1px solid black;
		background: #4572C4;
		color: white;
		padding: 2px;
	}
	#continue{/* 버튼 css*/
		background: white;
		color: black;
		width: 180px;
		height: 50px;
		font-size:20px;
		font-weight: bold;
	}
	#continue:hover{
		color: red;
	}
	#finalOrder{/* 버튼 css*/
		background: #4572C4;
		color: white;
		width: 180px;
		height: 50px;
		font-size:20px;
		font-weight: bold;
	}
	#finalOrder:hover{
		color: red;
	}
</style>
</head>
<body>
<%@ include file="../common/menubar.jsp" %>
	<section>
	<div   id="notice_1">회원정보 수정에서 발 정보 입력 후 리뷰를 작성하시면 구매금액의  <strong style="color:red;">5%를</strong> 포인트로 적립해드립니다!</div>
	

<!-- ======================== 서브 메뉴 ============================= -->  
	<div>
		
		<div id="cNotice">
			장바구니 상품은 최대 30일간 저장됩니다<br>
			가격, 옵션 등 상품 정보가 변경된 경우 주문이 불가능 할 수 있습니다. 
		</div>	
		<h3 id="cart">장바구니</h3>
		<hr style="width:65%; margin-left: 240px; ">
	</div><br>
	
	<div id=wrap>
		<div id=wrap1>
			<div  id="subBlue">
	    		<form action="<%= request.getContextPath() %>/updateForm.me" method="post" id="myForm" name="myForm">
			        <br><br>
			         
			      <strong><%= member.getM_Name() %>님<br><br>
			    	   보유 포인트<br>
			        <%= member.getPoint() %>원</strong><br><br>
			         
			        <input type="submit" id="userUpadteBtn"value="회원 수정하기">
				</form> 	     			
  		 	</div>
  		 	<div style="margin-left:240px; position:absolute; top:200px; ">
	  		 	<% if(s.size()>0){ %>
		     	<% for(int i = 0; i<s.size(); i++){ %>
			
				<div style="display:inline-block; width:200px; height:170px; " >
				<img src="<%= request.getContextPath() %>/productImage_uploadFiles/<%= pi.get(i).get(0).getPiChangeName() %>" id="cShoes_1"></img><br>
				<input type="hidden" value="<%= s.get(i).getSc_count() %>"><p style="overflow:hidden;"><strong>상품명 :</strong> <%= p.get(i).getpName() %><br><strong>금액 :</strong> <%= p.get(i).getpPrice() %>원<br>
				<input type="hidden" value="<%= p.get(i).getpNo() %>">
				<strong>size :</strong> <%= s.get(i).getPo_size() %><br>
				<strong>수량 :</strong> <%= s.get(i).getSc_count() %></p>
				</div>
			
		<%} %>
		<%} else {%>
		<%} %>
  		 	</div>
		</div>
		
		
		
		<div id="wrap2"> <!--두번째 줄 wrap  -->
			<h3 id="orderList" style="display:inline-block;">주문내역</h3>
			<hr style="width:65%; margin-left: 240px; ">
			<ul>
				<li class="subMenuLi">
					<a class="submenuLink" href="<%= request.getContextPath() %>/myPage.me">마이페이지 메인</a>
				</li>
				<li class="subMenuLi"><hr class="row_1"></li>
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
			</ul>
				<div style="margin-left:240px; position:absolute; top:530px ">
	  		 	<% if(o.size()>0){ %>
		     	<% for(int i = 0; i<o.size(); i++){ %>
			
				<div style="display:inline-block; width:200px; height:170px; " >
				<img src="<%= request.getContextPath() %>/productImage_uploadFiles/<%= pi2.get(i).get(0).getPiChangeName() %>" id="cShoes_1"></img><br>
				<input type="hidden" value="<%= o.get(i).getoCount() %>"><p style="overflow:hidden;"><strong>상품명 :</strong> <%= p2.get(i).getpName() %><br><strong>금액 :</strong> <%= p2.get(i).getpPrice() %>원<br>
				<input type="hidden" value="<%= p2.get(i).getpNo() %>">
				<strong>size :</strong> <%= o.get(i).getPoSize() %><br>
				<strong>수량 :</strong> <%= o.get(i).getoCount() %></p>
				</div>
			
		<%} %>
		<%} else {%>
		<%} %>
  		 	</div>
		</div>
	</div>
	<br><br>
   
   
   
  
	
   
	
 </section>
	<div id="footer">
		<hr id="footer_hr">
		<h4 class="footer_text" id="line1">고객센터 : 1588-0000  |  이메일 : amg@howshoes.com  |  운영시간 : 월~금 / 09:00~18:00 / 주말, 공휴일 휴무</h4>
		<h4 class="footer_text" id="line2">(주)안녕하슈  |  대표이사 : 강건강  |  주소 : 서울특별시 강남구 역삼동 남도빌딩 3층</h4>
		<h4 class="footer_text" id="line3">사업자등록번호 : 201-81-12345  |  개인정보보호 책임자 : 남나눔</h4>
	</div> 
    <script>	
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
 	</script>
</body>
</html>