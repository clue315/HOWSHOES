<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.*, product.model.vo.*, java.util.*, java.text.*,review.model.vo.*"%> 
<%
	Review review = (Review)request.getAttribute("review");
	PageInfo pi = (PageInfo)request.getAttribute("pi"); 
	ArrayList<Review> pdList = (ArrayList<Review>)request.getAttribute("pdList");
	ArrayList<ReviewImage> fList = (ArrayList<ReviewImage>)request.getAttribute("fList");
 	Product p  = (Product)request.getAttribute("product");
 	ArrayList<ProductImage> fileList = (ArrayList<ProductImage>)request.getAttribute("fileList");
     ProductImage titleImage = fileList.get(0);
     ArrayList<ProductOption> option = (ArrayList<ProductOption>)request.getAttribute("option");
     DecimalFormat df = new DecimalFormat("###,###");
     String pCate = "";
     switch(p.getPcNo()){
     case 10: pCate="스니커즈"; break;
     case 20: pCate="운동화"; break;
     case 30: pCate="남성신발"; break;
     case 40: pCate="여성신발"; break;
     case 50: pCate="슬리퍼/샌들"; break;
     }
 %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세페이지</title>
<link rel="stylesheet" href="css/default.css">
<link rel="stylesheet" href="css/style.css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<style>
	
	table{ font-style: normal; font-weight: bold; font-size: 24px; }

	/* 팝업창 */
	* {padding:0;margin:0;line-height:1;} /* 기본 브라우저 리셋 스타일 */
	
	input[id*="popup"] {display:none;}
	input[id*="popup"] + label {display:inline-block;padding:20px; background: rgba( 69, 114, 196); color:#fff; font-size: 18px;}
	input[id*="popup"] + label + div {position:fixed;top:0;left:0;width:100%;height:100%;z-index:100;}
	input[id*="popup"] + label + div > div {position:absolute;top:50%;left:50%;transform:translate(-50%,-50%); width:500px;height:300px; background:#fff; z-index:2;}
	input[id*="popup"] + div > div { src:"images/installment.PNG"; }
	input[id*="popup"] + label + div > div > label {position:absolute;top:0%;right:0%;transform:translate(40%,-40%);padding:20px;background:#dd5347;border-radius:100%;z-index:1;}
	input[id*="popup"] + label + div > label {position:absolute;top:0;left:0;width:100%;height:100%;background:rgba(0,0,0,.9);z-index:1;}
	
	
	input[id*="popup"] + label + div {opacity:0;visibility:hidden;transition:all 1s;}
	input[id*="popup"]:checked + label + div {opacity:1;visibility:visible;}
	footer{height:100px;  margin:auto; clear:both; text-align:center; }

	/* 상품 상세 전체 */
	.product_view {  position: relative; padding: 0 0 0 500px; width: 1050px; box-sizing: border-box; heihgt: 10px; margin-left: 500px; margin-top: 80px;}
	
	/* 상품 이미지 */
	.product_view .img { position: absolute; top: 0; margin-left: -710px; margin-top: 50px;}
	
	/* 썸네일 사진 크기 */
	.product_view .img > img { width: 630px; height: 600px; border:1px solid #e8e8e8; } 
	.product_view .img li:after { content: ""; display: block; clear: both; }
	.product_view .img li { float: left; padding: 10px 10px 0 0; }
	.product_view .img li.on img { border-color:#0a56a9;  "list-style: none"  }
	
	/* 서브 이미지 크기 */
	.product_view .img li img { width: 90px; height: 90px; border:1px solid #e8e8e8; }
	
	/* 상품 정보 */
	.product_view h2 { margin: 0 0 50px; padding: 0 0 -80px;  border-bottom:3px solid #333; font-size: 30px; color:#232323; line-height: 50px;}
	.product_view table th,
	.product_view table td { padding: 10px 0; font-size: 22px; color:#444; text-align: left; margin-top: 500px;}
	.product_view table td.price { font-size: 22px;}
	.product_view table select { width:100%; border:1px solid #c6c6c6; box-sizing: border-box;  background: url("../images/ico_select.png") no-repeat right 11px center;appearance:none; -webkit-appearance:none; -moz-appearance:none;}
	.product_view table select::-ms-expand { display: none;}
	.product_view .btns { padding: 45px 0 0; text-align: center;}
	.product_view .btns > a { display: inline-block; width: 136px; height: 42px;border-radius: 2px; font-size: 16px; color:#fff; line-height: 42px; }
	.product_view .btns > a.btn1 { background: #666;}
	.product_view .btns > a.btn2 { background: #0a56a9;}
	.btn_update{
		width:100px;
		background-color: white;
		color:black;
		font-size:20px;
		font-weight:bold;
		
	}
	#footer {
		margin-top: 50px;
		text-align: center;
	}
	.footer_text {
		font-family: "맑은 고딕";
		font-size: 12px;
		color: #969696;
	}
	table{
		margin-left: auto;
		margin-right: auto;
		table-layout: fixed;
		word-break: break-all;
		margin-top: 20px;
		width: 1000px;
		text-align: center;
		border-collapse: collapse;
	}
	/* 테이블 */
	table{
		margin-left: auto;
		margin-right: auto;
		table-layout: fixed;
		word-break: break-all;
		margin-top: 20px;
		width: 1000px;
		text-align: center;
		border-collapse: collapse;
	}
	#reviewEmpty {
		margin-top: auto;
		margin-bottom: auto;
		height: 270px;
		font-size: 20px;
	}
	.topLine{
		border-top: 1px solid lightgray;
	}
	.bottomLine{
		border-bottom: 1px solid lightgray;
	}
	#starTd{
		width: 300px;
		height: 50px;
	}
	#starOn {
		color: #D1141B;
		font-size: 25px;
		padding-bottom: 2px
	}
	#starOff {
		color: lightgrey;
		font-size: 25px;
		padding-bottom: 2px
	}
	#dateTd{
		width: 150px;
	}
	#dateDiv {
		width: 150px;
		text-align: left;
		padding-right: 20px;
		font-weight: lighter;
		font-size: 14px;
		margin-top: 2px;
	}
	#dateLabel {
		display: inline-block;
		font-size: 16px;
		font-weight: bolder;
	}
	#writerTd{
		width: 150px;
	}
	#writerDiv {
		text-align: left;
		padding-right: 20px;
		font-weight: lighter;
		font-size: 14px;
		margin-top: 2px;
	}
	#writerLabel {
		display: inline-block;
		font-size: 16px;
		font-weight: bolder;
	}
	#footinfoDiv {
		text-align: left;
		padding-right: 20px;
		font-weight: lighter;
		font-size: 14px;
		margin-top: 2px;
	}
	#footinfoLabel {
		display: inline-block;
		font-size: 16px;
		font-weight: bolder;
	}
	#imageTd {
		padding: 10px;
	}
	#reviewImage {
		width: 180px;
		height: auto;
	}
	#contentTd {
		padding: 5px;
		text-align: left;
		font-size: 14px;
		padding-bottom: 10px;
	}
	#contentDiv {
		width: 410px;	
	}
	#contentArea {
		font-family: "맑은 고딕";
		white-space: pre-wrap;
		font-weight: lighter;
		font-size:20px;
	}
	#buttonTd {
		border-bottom: 3px solid black;
		height: 60px;
	}
	
	/* 페이징버튼 */
	.pagingArea button{
		margin-top: 45px;
		border: 0px;
		outline: 0px;
		background: none;
		font-size: 15px;
		font-weight: bold;
		cursor: pointer;
	}
	#pagingAreaTop{
		margin-top: -70px;
		margin-left: 400px;
	}
	#pagingAreaBottom{
		margin-left: 400px;
		margin-top: -30px;
		margin-bottom: 10px;
	}
 	.btn {
		border: 0;
		outline: 0;
		font-size: 14px;
		font-weight: bolder;
		width: 620px;
		height: 35px;
		background: black;
		color: white;
	}
	.btn:hover {
		background: #4572C4;
		cursor: pointer;
	}
	
	
	/*구매 수량*/
	#opnum{ width: 209px; height: 38px; test-align: center;
		    font-style: normal; font-size: 21px; }
		    
	#opsize{ width: 213px; height: 38px; test-align: center; 
	         font-style: normal; font-size: 21px; }
	
	/* 상품상세, 상품리뷰, 배송관련 버튼  */
	.btn:hover { background : white;  font-color: white;}
	/* detail  */
	.detailimg1{  
			position:relative;
            width:150px; height:200px;
        }
        div.detailimg1 > img {
            position:absolute;
            max-width:100%; max-height:100%;
            width:auto; height:auto;
            margin:auto;
            top:0; bottom:0; left:0; right:0;
        }
        div.detailimg2 > img {
            position:absolute;
            max-width:100%; max-height:100%;
            width:auto; height:auto;
            margin:auto;
            top:0; bottom:0; left:0; right:0;
        }
</style>
</head>
<body>
	 <%@ include file="../common/menubar.jsp" %>
	
<section>
	  <form action="<%= request.getContextPath() %>/ImageUpdateForm.to" id="detailForm" method="post">
		 <hr style="height: 5px; width: 1300px;  background-color: black; margin-left: 280px; margin-top: 10px;" >	       
	       <div class="product_view">
			  <h2 name="pName"  style="resize: 10px; margin-top: 10px;" ><%= p.getpName() %></h2>
				<input type="hidden" name="pNo" value="<%= p.getpNo() %>">
			    <table id="table">
					<col style="width:320px;"> 
					<tbody>
					<tr>
						<th>판매가격</th>
						<td  class="price" style="resize:none;"><%= df.format(p.getpPrice()) %></td>
					</tr>
					<tr>  
						<td>상품 카테고리</td>
						<td colspan="2" name="pcNo" rows="3" cols="20" style="resize:none;"><%= pCate %></td>
					</tr>
					<tr>
				    </tr>
				    <tr>
						<th>상품코드<th>
						</td><%= p.getpNo() %></td>
					</tr>
					<tr>
						<td>배송유형</td>
						<td>2,500원 | KH택배</td>
					</tr>
					<tr>
						<td>평균 출고일</td>
						<td>1.5일 | 평균 배송기간</td>
					</tr>
					<tr>
						<td>구매 수량</td>
						<td><input type="number"  id="opnum" value="1" min="1" max="30"></td>
					</tr>
					<tr>
               <td>사이즈</td>
                  <td>
                   <select name="size" id="opsize" size="1" >
                  <center><option selected value="0">사이즈 선택</option></center>
                  <% for(int i = 0; i < option.size(); i++) { %>
                     <% ProductOption po = option.get(i);  %>
                     <%  if( po.getPoInventory() == 0 ) { %>
                          <option disabled>품절</option>   
                        <% }else{  %>
                         <option  value="<%= po.getPoSize() %>"><%= po.getPoSize() %></option>
                        <% }  %> 
                     <% }  %>
                   </select>
                   </td>
               </tr>
				   <tr>						
						<td rowspan="2" colspan="2" name="pInfo" rows="3" cols="20" style="resize:none; color:#4572C4; text-align:center;"><%= p.getpInfo() %>에 추천하는 상품입니다.</td>
					</tr>
				</tbody>
			</table >
			    <div class="img">
							<img id="titleImg" src="<%= request.getContextPath() %>/productImage_uploadFiles/<%= titleImage.getPiChangeName() %>"> 					      	
				</div>
			<div class="btns">
			<input type="button" class="btn1" id="btn1" value="바로구매" style="width: 260px; height: 61px; background: black; color: white; font-weight: bold; font-size: 17px" onclick="purchase();">
			<input type="button"  class="btn2" value="장바구니 담기" style="width: 200px; height: 61px; background: white; color: black; font-weight: bold; font-size: 17px " onclick="cart();">
			</div>
       </div>
		<br><br><br>
		<br><br><br>
		
		<!-- 상품상세, 상품리뷰, 배송관련버튼  -->
		<div class="wrapper"> 
			<input type="button" class="btn" value="SIZE CHART" onclick="selected(this);" style="width: 260px; height: 61px;  margin-top: 140px; margin-left: 550px;  font-size: 17px; font-weight: bold; " >
			<input type="button"  class="btn" value="REVIEW" onclick="selected(this);" style="width: 260px; height: 61px;   margin-left: -7px; font-size: 17px; font-weight: bold;  ">		
			<input type="button"  class="btn" value="RETURN & DELIVERY" onclick="selected(this);" style="width: 260px; height: 61px; margin-left: -7px; font-size: 17px; font-weight: bold;  ">		
			<hr style="height: 1px; width: 1300px;  background-color: gray; margin-left: 280px; margin-top: -1px;" >
		</div>
		<br><br>
		<br><br>
		
		<center>
			<div id="detailImage">
	     	 <img src="Image/size_chart.PNG" >
			 </div>
		 </center>
		
		<div id="productreview">
			<h4 style="font-size: 25px; margin-top: 100px; margin-left: 300px;">REVIEW </h4> 
			<hr>
			<table id="tableArea">
					<% if(pdList.isEmpty()) { %>
					<tr>
						<th id="reviewEmpty">
							리뷰를 작성해주세요.
						</th>
					</tr>
					<% } else { %>
						<% for(int i = 0; i < pdList.size(); i++) { %>
							<% Review r = pdList.get(i); %>
							<tr>
								<td id="starTd" class="topLine">
									<div id="starDiv">
										<% for(int j = 1; j <= 5; j++) { %>
											<% if(j <= r.getR_score()) {%>
												<label id="starOn">
													&#9733;
												</label>
											<% } else { %>
												<label id="starOff">
													&#9733;
												</label>
											<% } %>
										<% } %>
									</div>
								</td>
								<td id="dateTd" class="topLine">
									<div id="dateDiv">
										<div id="dateLabel">| 작성일  </div> <%= r.getR_date() %>
										<input type="hidden" value="<%= r.getR_no() %>">
										<input type="hidden" value="<%= r.getR_writer()%>">
									</div>
								</td>
								<td id="writerTd" class="topLine">
									<div id="writerDiv">
										<div id="writerLabel">| 작성자  </div> <%= r.getR_writer() %>						
									</div>
								</td>
								
							</tr>
							<tr>
								<td id="imageTd" class="bottomLine">
									<div id="imageDiv">
										<img id="reviewImage"
											 src="<%= request.getContextPath() %>/review_uploadFiles/<%= fList.get(r.getR_no() -1).getRi_changeName() %>">
									</div>
								</td>
								<td colspan="3" id="contentTd" class="bottomLine">
									<div id="contentDiv">
										<pre id="contentArea"><%= r.getR_content() %></pre>
									</div>
								</td>
							</tr>
						<% } %>
					<% } %>
				</table>
			
		</div>
		<div id="return">
			<br><h4 style=" font-size: 25px; margin-top: 10px; margin-left: 300px;" >RETURN & DELIVERY</h4><br>
			<hr style="height: 1px; width: 1300px;  background-color: gray; margin-left: 280px; margin-top: 10px;" >
			<center><img src="Image/delivery.PNG" width="1320px" height="900px" margin-left= 100px;  margin-top= 10px; ></center>
		</div>
	    <hr style="height: 1px; width: 1300px;  background-color: black; margin-left: 280px; margin-top: 10px;" >
		<br>
		<div align="center" id="adminBtn">
				     <% if(  loginUser != null && loginUser.getM_Id().equals("admin") ) { %> 
					<input type="submit" class="btn_update" id="updateNoBtn" value="수정" >
					<input type="button" class="btn_update" id="deleteNoBtn" value="삭제" onclick="deleteProduct();"> 
					<input type="button" class="btn_update" onclick="location.href='javascript:history.go(-1);'" id="cancelBtn" value="취소" style="width: 80px; height: 20px; background: white; color: black;font-size: 17px; font-weight: bold; border: 2px solid gray;">
	   				<%} %>
	    </div>
	  </form>
   </section>
	  <script type="text/javascript">
		
	  $('#opsize').change(function(){
	         
	         var count = $('#opnum').val(); //현재값
	         var num = $(this).val();// 220,,
	         
	         var c = 0; 
	         <% for(int i=0; i<option.size();i++){%>        
	         if(<%= option.get(i).getPoSize() %> == num){ 
	            c = <%= option.get(i).getPoInventory() %>;           
	         }        
	         <% } %> 
	         if(count > c){
	            alert('현재재고에서 주문하신 수량이 부족합니다.'+ '' + c + '개 남았습니다.');
	         }
	      })
	  
	  
	function cart(){
         
         var opnum = document.getElementById('opnum').value;
         var opsize = document.getElementById('opsize').value;
         var no = [opnum, opsize, <%= p.getpNo() %>];
         console.log(opnum);
         console.log(opsize);

            <% if(loginUser == null){%>
               alert('로그인을 해주세요.');   
             <% } else {%>
               if(opsize != "0"){
            $.ajax({
               url : 'insertShopping.is',
               data : {opnum : opnum, 
                     opsize: opsize,
                     pno : <%= p.getpNo() %>}
               
            });
               alert('장바구니 등록되었습니다.');
            
            }else{
               alert('사이즈를 선택해주세요.');
            }         
          <% }%>
      }
		
		function selected(cate){
			if(cate.value == "SIZE CHART"){
				document.getElementById("detailImage").style.display = "block";
				document.getElementById("productreview").style.display = "none";
				document.getElementById("return").style.display = "none";
			} else if(cate.value == 'REVIEW'){
				document.getElementById("detailImage").style.display = "none";
				document.getElementById("productreview").style.display = "block";
				document.getElementById("return").style.display = "none";
			} else{
				document.getElementById("detailImage").style.display = "none";
				document.getElementById("productreview").style.display = "none";
				document.getElementById("return").style.display = "block";
			}
		}
		
		function deleteProduct(){
			var bool = confirm("정말 삭제하시겠습니까?");
			if(bool){
				location.href="<%= request.getContextPath() %>/delete.to?pNo=" + <%= p.getpNo() %>; 
			}
		}
		
		$("#btn1").click(function(){
	         var opnum = document.getElementById('opnum').value;
	         var opsize = document.getElementById('opsize').value;
	         var ad = [<%= p.getpNo() %>, opsize, opnum];
	         <% if(loginUser == null) { %>
	         alert('로그인을 해주세요.');  
	         <% } else { %>
	         if(opsize == "0"){
	            alert("사이즈를 선택해 주세요.");   
	         } else {
	            console.log("들어옴");
	            location.href="<%= request.getContextPath() %>/orderList.or?ad=" + ad;
	         }
	         <% } %>
	      });
	  </script>
	  <br><br><br>
	<<div id="footer">
		<hr id="footer_hr">
		<h4 class="footer_text" id="line1">고객센터 : 1588-0000  |  이메일 : amg@howshoes.com  |  운영시간 : 월~금 / 09:00~18:00 / 주말, 공휴일 휴무</h4>
		<h4 class="footer_text" id="line2">(주)안녕하슈  |  대표이사 : 강건강  |  주소 : 서울특별시 강남구 역삼동 남도빌딩 3층</h4>
		<h4 class="footer_text" id="line3">사업자등록번호 : 201-81-12345  |  개인정보보호 책임자 : 남나눔</h4>
	</div> 
</body>
</html>