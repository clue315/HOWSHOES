<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, java.text.*, member.model.vo.*, product.model.vo.*, order.model.vo.*, address.model.vo.*"%>
<%
	ArrayList<Product> p = (ArrayList<Product>)request.getAttribute("p");
	ArrayList<ArrayList<ProductImage>> pi = (ArrayList<ArrayList<ProductImage>>)request.getAttribute("pi");
	ArrayList<Integer> inventry = (ArrayList<Integer>)request.getAttribute("inventry");
	boolean checkcount = true;
	Member m = (Member)request.getAttribute("m");
	Address a = (Address)request.getAttribute("a");

	DecimalFormat df = new DecimalFormat("###,###");
	int[] pcount = (int[])request.getAttribute("count");
	int[] total = new int[p.size()];
	int[] point = new int[p.size()];
	int t = 0;
	int po = 0;
	for(int i = 0; i<p.size(); i++){
		
		total[i] = p.get(i).getpPrice() * pcount[i];
		point[i] = p.get(i).getpPrice();
		t += total[i];
		point[i] *= 0.01;
		po += point[i];
		if(inventry.get(i) < pcount[i]){
			checkcount=false;
		}
	}
	
	String total2 = df.format(t);//상품총 금액
	int pp = 2500; // 배송비
	String pp2 = df.format(pp);
	int sum = t + pp; //상품+배송비-적릭금
	String sum2 = df.format(sum);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문/결제</title>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet"> 
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<style>
	ul > li{list-decoration:none;  font-weight:bold; font-size:15px; display:inline-block; padding: 0 10px;}
	ul{text-align:center;}
	html, body {height: 100%;}
	small, sub{color:#AFA8A8;}

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
	section{margin-left: 50px;margin-right: 50px; box-sizing:border-box; padding:0 100px;}	
	#order{
	margin: 20px;
	font-size: 40px;
	}
	.jang{
		margin-right: 300px;
		padding-right: 20px;
		font-size: 10px;
		list-style-type: none;
		float: right;
		margin: 5px;
		text-align: center;
		display: block;
	}
	
	.line{
 		margin-left: 30px;
		font-size: 40px;
	}
	
	.container {    /*결제상품전체박스*/
	    width: 100%;
 	    min-width: 768px;   
	    font-size: 30px;   
	}
	.container div {
	    border: 1px solid #ccc;
		height: 100px;
	    display: table-cell;
	    vertical-align: middle;
	    padding: 0 25px;
	}
	.container div:first-child {
	    padding: 0;
	}
	.container img {
	/* 	margin-left: 100px; */
	    vertical-align: bottom;
	}
	.container div:nth-child(2) {  
	    width:60%;
	}
	.container div:nth-child(3) {
	    text-align: right;
	    line-height: 2;
	}
	
	#pointlabel{
		font-size: 20px;
		color: green;
	}
	/*적립금 텍스트박스*/
	.save{
		margin-left: 100px;
		width: 455px;
		height: 40px;
		font-size: 30px;
	}
	.saveBtn{
		background: black;
		color: white;
		width: 180px;
		height: 40px;
		font-size: 26px;
		margin-left:20px;
	}
	.saveBtn:hover{
		color: #4572C4;
	}
	label{margin-left: 470px;}
	/* 전체적인 글자 css*/
	.text{
	margin-left: 150px;
	font-size:30px;
	padding: 30px;
	}
	
	.textfield{ 
	margin-left: 100px;
	width: 885px;
	height: 60px;
	font-size: 30px;
	}
	.addr_1{
		margin-left: 70px;
	}
	
	.container2{
	text-align: center;
	display: table;
	table-layout: fixed;
	width: 100%;
	min-width: 768px;
	font-size: 28px;
	}
	.container2 div {
	background: #FBEEFE;
	height: 100px;
    display: table-cell;
    vertical-align: middle;
    padding: 0 25px;
    border: 1px solid #ccc;
    }
   
	.conteiner2 div:nth-child(4){
	 text-size: 20px;
	}
    .inputbtn{
    background: black;
    color: white;
    width: 180px;
    height: 50px;
    font-size: 26px;
    }
	.orderinfo{
 	display: table; 
	table-layout: fixed;
	width: 100%;
	min-width: 768px;
	
	}
	.orderinfo div {
	height: 50px;
     display: table-cell; 
    text-align: none;
    }
    
 	.orderinfo div:first-child{
  	text-align: none;
 	}

	.orderinfo div:nth-child(2){
 	text-align: right;
 	margin-bottom: 15px;	
 	}
 	 
	.pay{
 	margin: 50px;
	text-align: center;
	display: table;
	table-layout: fixed;
	width: 100%;
	min-width: 768px;
	font-size:30px;
	}
	
	.rpay{
	 width: 20px; 
	 height: 20px;
	}
	.pay div {
		height: 10px;
	    display: table-cell;
	    vertical-align: middle;
	}
	    
	.pay2{
		table-layout: fixed;
		margin-left: 140px;
		text-align: middle;
		min-width: 768px;
		
	}
	.pay2 div {

    width: 20%;
	height: 20px;
	text-align: left;
    display: table-cell;
    vertical-align: middle;
    }
    .pay2 div:nth-child(2) {
    width:100%;
    font-size: 20px;
	}
	
	.pay3{
	table-layout: fixed;
	margin-left: 140px;
	text-align: middle;
	min-width: 768px;
	
	}
	.pay3 div {
    width: 20%;
	height: 20px;
    display: table-cell;
    vertical-align: middle;
    }
	.pay3 div:nth-child(2) {
    width: 50%; 
    font-size:25px;
    }
    #infotext{
    width:100%;
    font-size: 20px;
    }
    #checkorder{
    	width: 20px;
    	height: 20px;
    }
    #pay3span{
    color: #9D9B9B;
    }
	.pay3 div:nth-child(4) {
	text-align: left;
    border: 1px solid #ccc;
    font-size:30px;
    }
    
	.card{
	font-size: 12px;
	text-align: center;
	display: table;
	table-layout: fixed;
	width: 100%;
	min-width: 768px;
		
	}
	.card div {
	height: 100px;
    display: table-cell;
    vertical-align: middle;
    padding: 0 25px;
    }
   
	.card div:nth-child(4){
	 text-size: 15px;}
	 
	 #paybtndiv{
	  text-align :center;
	 }
	 #payment{
	 background: black;
	 color: white;
	 width: 300px;
	 height: 50px;
	 font-size: 20px;
	 }
	
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	<section>
		<ul>
			<a id="order"><center>주문결제</center></a>
			<li class="jang"><img src="Image/cart.png" width="50px" height="50p"><br>주문완료</li>
			<li class="jang"><img src="Image/wallet.png" width="50px" height="50p"><br>주문결제</li>
			<li class="jang"><img src="Image/vans.png" width="50px" height="50px"><br>장바구니</li>
		</ul>
	<br>
	<hr>

<br><div class="line">결제상품</div><br>
<div class="container">
    <% for(int i =0; i<p.size(); i++) {%>
    <div style="border-right:none;  padding: 0;">
        <img src="<%= request.getContextPath() %>/productImage_uploadFiles/<%= pi.get(i).get(0).getPiChangeName() %>"  width="291px" height="212px" alt="">
    </div>
    <div style="border-left:none; border-right:none; width:80%;">
        상품명 : <%= p.get(i).getpName() %><br>
        수량&nbsp;&nbsp;&nbsp; : <%= pcount[i] %>개<br>
        사이즈 : <%= p.get(i).getPoSize() %>mm
    </div>
    <div style="border-left:none; text-align: right; width:100%; line-height: 2;">
        상품 가격<br><%= df.format(total[i]) %>원
    </div><br>
    <% } %>
</div>

<br><br><div class="line">할인혜택</div><br>
<hr>

<div>
<dl>
	<dt class="text">적립금사용  <input type="number" class="save" id="save" name="save">
		<button class="saveBtn" onclick="pointUse();">포인트 사용</button>
		<button class="saveBtn" onclick="pointAllUse();">전액 사용</button>
	</dt>
	<dt><label id="pointlabel"> <%= m.getPoint() %> 포인트가 있습니다.</label></dt>
</dl>
</div>
 <h5><center>현재 <%= df.format(po) %> 포인트만큼 적립됩니다. 일부 상품의 경우 적립금 적용이 되지 않습니다.</center></h5>

 <div class="container2">
    <div>
        상품가격<br><br>
      <%= total2 %>원
    </div>
    <div>
        총배송비<br><br>
        + <%= pp2 %>
    </div>
    <div>
        적립금 사용<br><br>
       - <span id="saveuse"><%= m.getPoint() %></span> 원
    </div>
    <div id="chong"><h3>
    총 결제금액<br><br>
    <span id="saveuse2"><%= sum2 %></span>원    
    </h3>
    </div>
</div>
<br>


<div class="orderinfo"><!-- 주문자정보 -->
	<div class="line">주문자정보</div>	
	<div><input type="button" value="정보수정" class="inputbtn" onclick="orderinfo();"></div>
</div>	
<hr>
  <form method="post" action="<%= request.getContextPath() %>/orderEnd.or" id="orderFrom" >
	<div>
	<input type="hidden" id="point" name="point" value="0"><!-- 사용 포인트 -->
	<input type="hidden" name="countno" value="<%= p.size() %>"><!-- 상품수 반환 -->
	<input type="hidden" id="point2" name="point2" value="<%= po %>">
	<% for(int i = 0; i<p.size();i++){ %>
	<input type="hidden" name="pno<%= i %>" value="<%= p.get(i).getpNo() %>"><!-- 상품번호 -->
	<input type="hidden" name="size<%= i %>" value="<%= p.get(i).getPoSize() %>"><!-- 신발사이즈 -->
	<input type="hidden" name="pcount<%= i %>" value="<%= pcount[i] %>"><!-- 수량 -->
	<input type="hidden" name="total<%= i %>" value="<%= total[i] %>"><!-- 토탈금액(하나의 상품) -->
	<% } %>
	<input type="hidden" name="id" value="<%= m.getM_Id()%>"><!-- 회원아이디 -->
		<dl>
			<dt class="text">주문자   : &nbsp;&nbsp;<input type="text" class="textfield" readonly value="<%= m.getM_Name() %>"></dt>
			<dt class="text">전화번호 :<input type="text" class="textfield" id="orderPhone" name="orderPhone" readonly value="<%= m.getPhone() %>"></dt>
			<dt class="text">이메일    : &nbsp;&nbsp;<input type="text" class="textfield" id="orderEmail" name="orderEmail"readonly value="<%= m.getEmail() %>"></dt> 
		</dl>
	</div>

	<br>
	<div class="line">배송정보</div>
	<hr>
	<div>
			<div class="text">배송지선택  
				<input type="radio" class="rpay" id="adcheck1" name="address" value="1" checked>기본주소 
				<input type="radio" class="rpay" id="adcheck2" name="address" value="2">신규배송지 
				<input type="button" class="inputbtn" value="주소록선택" onclick="addrChose();">
			</div>
			<div class="addr_list_1" id="ad1" style="display: block">
				<dl>
					<dt class="text">수령인  &nbsp;&nbsp;&nbsp;<span class="addr_1"><%= a.getPerson() %></span><input type="hidden" id="name" name="name" value="<%= a.getPerson() %>"> <!-- 수령인 --></dt>
					<dt class="text">전화번호   &nbsp;<span class="addr_1"><%= a.getPhone() %></span>	<input type="hidden" name="phone" id="phone" value="<%= a.getPhone() %>"><!-- 수령인 전화번호 --></dt>
					<dt class="text">주소    &nbsp;  &nbsp; &nbsp; <span class="addr_1"><%= a.getAddress() %></span><input type="hidden" id="ad" name="ad" value="<%= a.getAddress() %>"><!-- 수령인 주소 --></dt>
				</dl>
			</div>
			<div class="addr_list_2" id="ad2" style="display: none">
				<dl>
					<dt class="text">수령인  &nbsp;  &nbsp;<input type="text" id="name2" name="name2" class="textfield" placeholder="받으실 분 성함을 입력하세요"></dt>
					<dt class="text">전화번호  <input type="text" id="phone2" name="phone2" class="textfield" placeholder="Ex) 010-****-****"></dt>
					<dt class="text">주소    &nbsp;  &nbsp; &nbsp; <input type="text" id="add2" name="ad2" class="textfield" placeholder="Ex) 서울시 강남구 역삼동"></dt>
				</dl>
			</div>
			<div class="text">배송메세지 <input type="text" name="masege" class="textfield" placeholder="배송시 요청사항을 입력하세요" style="margin-left: 70px;"></div> 
	</div>
	<br>

 <div class="line">결제방법</div>
 <hr>
  		
  <div class="pay2">
  <div class="text">결제안내</div>
  <div><pre>꼭 읽어보세요!
  
·상품 수량이 한정적이기 때문에 주문하신 상품은 결제완료 순서대로 배송이 진행됩니다. 
  입금이 늦어진 경우 결제가 되었더라도 품절 및 재고 부족으로 주문이 취소될 수 있습니다.
  	
·상품 품절 및 단종, 분실 등에 의해 배송이 불가능할 경우, 전자상거래등에서의 소비자보호에 
  관한 법률 제 15조 2항에 의하여 3영업일(공휴일제외)이내에 자동으로 환불 될 수 있으며, 
  이 경우 환불 안내 문자가 주문자분께 발송되오니 양지 바랍니다.
  	
·전용계좌번호(가상계좌) 발급으로 입금인의 명의와 상관없이 입금 가능하며, 
  입금시 자동으로 결제확인처리 되므로 별도의 문의나 확인이 필요하지 않습니다.
  	
·입금시 금액은 주문결제 금액과 일치해야만 입금이 되므로 정확한 금액을 입금해주세요.
  	
·환불 받으실 때에는 별도의 계좌 확인이 필요치 않으며, 입금 시 이용하신 계좌로 환불 됩니다.
  	
·현금영수증 발행은 결제 시 신청하셔야만 발급이 가능합니다.
  	
·휴일계좌 이용시 주문자와 입금자 성함이 다를 경우 고객센터(1566-1677)또는 
  1:1 친절상담게시판으로 꼭 연락주세요.
  	</pre>
  	
  </div>
  </div>
  		
  	<hr>
  <div class="pay3">
  <div class="text">주문동의</div>
  <div>
  	<input  type="checkbox" id="checkorder"> 주문하실 상품 및 결제, 주문정보 등을 최종 확인하고 구매에 동의합니다.(필수)<br>
  	<span id="pay3span">*원활한 배송을 위해 판매자에게 아래 정보가 제공됩니다.</span>
  	<div id="infotext"><pre>
  공유받는 자 [위탁]안녕하슈

  목적        판매자와 구매자의 거래의 원활한 진행, 본인의사의 확인, 고객상담 및 불만처리, 
  	      상품과 경품배송을 위한 배송지 확인등
  		 
  항목        구매자 이름, 전화번호, ID, 휴대폰번호, 이메일주소, 상품구매정보, 상품수취인
              정보(이름, 주소, 전화번호)
  		 
  보유기간    배송완료 후 한달 간 보유
  		 
  동의거부시  본 개인정보 공유에 동의하지 않으시는 경우, 동의를 거부할 수 있으며, 이 경우
  불이익      거래가 제한됩니다.
  		 </pre>
  	</div>
  </div>
  </div>
  
  
  <hr>
  <div id="paybtndiv"><input type="button" value="결제하기" id="payment" onclick="checkValidate(this)"></div>
  </form>
  <script>
      function checkValidate(frm){//필수 동의 체크 확인
    	  console.log(frm); 
			var check = document.getElementById('checkorder').checked; // 필수 확인버튼
			var address;
			var phone;
			if($('#adcheck1').is(":checked")){
				phone = '<%= a.getPhone() %>';
				address = '<%= a.getAddress() %>';
	        } else {
	        	phone = $("#phone2").val();
		    	address = $("#add2").val();
	        }
			 if(<%= checkcount %>){
				if(check){
					IMP.init('imp55482031');//내가맹점고유번호
				    IMP.request_pay({
				          pg : 'html5_inicis', // version 1.1.0부터 지원.
				          pay_method : 'card',
				          merchant_uid : 'merchant_' + new Date().getTime(),
				          name : '안녕하쇼',
				          amount : 100, //판매 가격
				          buyer_email : 'iamport@siot.do',
				          buyer_name : '<%= m.getM_Name() %>',
					      buyer_tel : phone,
					      buyer_addr : address,
				          buyer_postcode : '123-456'
				      }, function(rsp) {
				          if ( rsp.success ) {
							$('#orderFrom').submit();
				          } else {
				        	  alert('결재에 실패하였습니다.');
				          }
				      });
				} else {
					alert('주문 동의를 해주세요.');
					return false;
				}
				} else {
					alert('구매하려는 수량보다 현재 신발의 재고가 더 적습니다. 수량을 채크해주세요.');
					history.back();
				}
		}
		function pointUse(){//입력한 값만큼만 포인트 사용
			var val = document.getElementById('save').value;
			if(val > <%= m.getPoint() %>){//포유포인트보다 많이 적을시
				var me = <%= m.getPoint() %>;
				alert("보유 포인트금액보다 많습니다.");
				document.getElementById('save').value = me;// 최대포인트로 반환한다.
				document.getElementById('save').focus();//포커스로 다시 한번 쓸수있게 만든다.
			}else{//사용 포인트만금 큼액 줄어들고 
				document.getElementById('point').value = val;
				document.getElementById('saveuse').innerHTML = val;
				me = <%= sum %> - val;
				document.getElementById('saveuse2').innerHTML = numberWithCommas(me);
			}
		}
		
		function pointAllUse(){//모든 포인트 사용
			var val = <%= m.getPoint() %>;
			document.getElementById('point').value = val;
			document.getElementById('saveuse').innerHTML = val;
			me = <%= sum %> - val;
			document.getElementById('saveuse2').innerHTML = numberWithCommas(me);
		}
		
		function numberWithCommas(x) {//금액 콤마 찍기위해서 만듬 함수
		    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}
		
		$('input[type=radio][name=address]').change('click',function(){ //라디오 버튼으로 배송지보여주는것(기본 신규에따른 display조작)
			var chkValue = $('input[type=radio][name=address]:checked').val();
			if(chkValue == '1'){
				$('.addr_list_1').css('display', 'block');
				$('.addr_list_2').css('display', 'none');
			} else {
				$('.addr_list_1').css('display', 'none');
				$('.addr_list_2').css('display', 'block');
				document.getElementById('name2').value = null;
				document.getElementById('phone2').value = null;
				document.getElementById('add2').value = null;
			}
		});

		
		
		function orderinfo(){//주문자 정보 수정 팝업창
			window.open('ChangeInfo.me', 'changeinfo', 'width=300, height=200');
		}
		function addrChose(){//배송지 정보 수정 팝업창
			window.open('choseaddress.ad', 'choseaddress', 'width=600, height=700');
		}
	</script>
 <div class="line">무이자혜택</div>
  		<hr>
  		<div class="card">
  		<div>비씨카드<br>
  		2,3,4,5,6개월(5만원이상)<br>
  		7~10개월(1~1회차 고객부담)<br>
  		11~12개월(1~3회차 고객부담)<br>
  		</div>
  		
  		<div>
  		삼성카드<br>
  		2,3,4,5,6개월(5만원이상)<br>
  		10개월(1~4회차 고객부담)<br>
  		12개월(1~5회차 고객부담)<br>
  		18개월(1~7회차 고객부담)
  		</div>
  		
  		<div>
  		KB국민카드<br>
  		2,3,4,5,6개월(5만원이상)<br>
  		10개월(1~3회차 고객부담)<br>
  		12개월(1~4회차 고객부담)
  		</div>
  		
  		<div>
  		NH농협카드 <br>
  		2,3,4,5,6개월(5만원이상)<br>
  		7~10개월(1~2회차 고객부담)<br>
  		11~12개월(1~3회차 고객부담)<br>
  		</div>
  		
  		<div>
  		신한카드<br>
  		2,3,4,5,6개월(5만원이상)<br>
  		10개월(1~3회차 고객부담)<br>
  		12개월(1~4회차 고객부담)
  		</div>
  		</div>
  		<hr>
  		
	<div class="card">
  		 <div>시티카드<br>
  		2,3,4,5,6개월(5만원이상)<br>
  		</div>
  		
  		<div>하나카드(외환포함)<br>
  		2,3,4,5,6개월(5만원이상)<br>
  		</div>
  		
  		<div>
  		롯데카드<br>
  		2,3,4,5,6개월(5만원이상)<br>
  		</div>
  		
  		<div>
  		현대카드 <br>
  		2,3,4,5,6개월(5만원이상)<br>
  		</div>
  		
  		<div></div>
  		</div>
  		<hr>
  		<br>
	</section>

	<div id="footer">
		<hr id="footer_hr">
		<h4 class="footer_text" id="line1">고객센터 : 1588-0000  |  이메일 : amg@howshoes.com  |  운영시간 : 월~금 / 09:00~18:00 / 주말, 공휴일 휴무</h4>
		<h4 class="footer_text" id="line2">(주)안녕하슈  |  대표이사 : 강건강  |  주소 : 서울특별시 강남구 역삼동 남도빌딩 3층</h4>
		<h4 class="footer_text" id="line3">사업자등록번호 : 201-81-12345  |  개인정보보호 책임자 : 남나눔</h4>
	</div>

</body>
</html>