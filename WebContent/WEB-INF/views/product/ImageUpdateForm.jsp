<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="product.model.vo.*, java.util.*"%> 
<%
	Product p  = (Product)request.getAttribute("product");
	ArrayList<ProductImage> fileList = (ArrayList<ProductImage>)request.getAttribute("fileList");
    ProductImage titleImage = fileList.get(0);
%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 수정 페이지</title>
<link rel="stylesheet" href="css/default.css">
<link rel="stylesheet" href="css/style.css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<style>
	session{position:relative; min-height:1000px;}
	#footer {
		margin-top:300px;
		position:relative;
		height:100px;
		text-align: center;
	}
	.footer_text {
		font-family: "맑은 고딕";
		margin:10px 0;
		font-size: 12px;
		color: #969696;
	}
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
	
	/* 서브 이미지 크기 */
	.detailImg{ width:  90px; height: 95px; border:1px solid #e8e8e8;  }
	
	/* 상품 정보 */
	.product_view h2 { margin: 0 0 50px; padding: 0 0 -80px;  border-bottom:3px solid #333; font-size: 30px; color:#232323; line-height: 50px;}
	.product_view table th,
	.product_view table td {width:300px; padding: 10px 0; font-size: 22px; color:#444; text-align: left; margin-top: 500px;}
	.product_view table td.price { font-size: 22px;}
	.product_view table select { width:100%; border:1px solid #c6c6c6; box-sizing: border-box;  background: url("../images/ico_select.png") no-repeat right 11px center;appearance:none; -webkit-appearance:none; -moz-appearance:none;}
	.product_view table select::-ms-expand { display: none;}
	.product_view .btns { padding: 45px 0 0; text-align: center;}
	.product_view .btns > a { display: inline-block; width: 136px; height: 42px;border-radius: 2px; font-size: 16px; color:#fff; line-height: 42px; }
	.product_view .btns > a.btn1 { background: #666;}
	.product_view .btns > a.btn2 { background: #0a56a9;}
	
	input[type=text]{
		height:25px;
		width:150px;
	}
	/*구매 수량*/
	#opnum{ width: 209px; height: 38px; test-align: center;
		    font-style: normal; font-size: 21px; }
		    
	#opsize{ width: 209px; height: 38px; test-align: center; 
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
        .btnArea{margin-left:350px; }
        #updateBtn{background: black; color:white; font-size:25px; font-weight:bold; padding:5px;}
        #updateBtn:hover,  #cancelBtn:hover{background:#4572C4; opacity:0.5; cursor:pointer;}
        #cancelBtn{background: white; color:black; font-size:25px; font-weight:bold; padding:5px; border:2px solid black;}
</style>
</head>
<body>
	 <%@ include file="../common/menubar.jsp" %>	
<section>
<h1 style="margin-left: 280px;font-size:30px;">상품 수정 페이지</h1>
	  <form action="<%= request.getContextPath() %>/update.to" method="post"  encType="multipart/form-data"> 
	  	
		 <hr style="height: 5px; width: 1300px;  background-color: black; margin-left: 280px; margin-top: 10px;" >	       
	       <div class="product_view">
			<input type="hidden" name="pNo" value="<%= p.getpNo() %>">
			  <h2 name="pName" >상품명 : <textarea name="pName" rows="1" cols="15" style="resize:none; font-size: 20px; "><%= p.getpName() %></textarea></h2>
			    <table id="table">
					<col style="width:300px;"> 
					<tbody>
					<tr>
						<th>판매가격</th>
						<td  class="price"><textarea name="price" rows="1" cols="15" style="resize:none; font-size: 20px; "><%= p.getpPrice() %></textarea></td>
					</tr>
					<tr>
						<th>발정보</th>
						<td colspan="2" ><textarea name="pInfo" rows="1" cols="15" style="resize:none; font-size: 20px; "><%= p.getpInfo() %></textarea></td>
					</tr>
					<tr>  
						<td>상품 카테고리</td>
						<td colspan="2" ><textarea name="pcNo" rows="1" cols="15" style="resize:none; font-size: 20px; "><%= p.getPcNo() %></textarea></td>
					</tr>
					<tr> 
				    </tr>
				    <tr>
						<th>상품코드<th>
						</td><%= p.getpNo() %></td>
					</tr>
					<tr>
						<td>배송유형</td>
						<td>무료배송 | KH택배</td>
					</tr>
					<tr>
						<td>평균 출고일</td>
						<td>1.5일 | 평균 배송기간</td>
					</tr>
					
				</tbody>
			</table >
			    <div class="img">
							<img id="titleImg" src="<%= request.getContextPath() %>/productImage_uploadFiles/<%= titleImage.getPiChangeName() %>"> 					      	
				</div>
			
	       </div>
			<br><br><br>
			<br><br><br>
			
			<!-- 상품상세, 상품리뷰, 배송관련버튼  -->
			
		
		
		
			
		    
			<br>
  
			<div id="fileArea">
				<input type="file" id="thumbnailImg1" multiple="multiple" name="thumbnailImg1" onchange="LoadImg(this,1)">				
			</div>	
			<div class="btnArea" align="center">
						<input type="submit" id="updateBtn" value="수정완료"  style="  border: 2px solid gray;">
						<input type="button" id="cancelBtn" onclick="location.href='<%= request.getContextPath() %>/pro.to'" value="취소하기"  style="border: 2px solid gray;" >
			</div>
	 </form>
				  	
	 
	
   </section>
	   
		 <div id="footer">
			<hr id="footer_hr">
			<h4 class="footer_text" id="line1">고객센터 : 1588-0000  |  이메일 : amg@howshoes.com  |  운영시간 : 월~금 / 09:00~18:00 / 주말, 공휴일 휴무</h4>
			<h4 class="footer_text" id="line2">(주)안녕하슈  |  대표이사 : 강건강  |  주소 : 서울특별시 강남구 역삼동 남도빌딩 3층</h4>
			<h4 class="footer_text" id="line3">사업자등록번호 : 201-81-12345  |  개인정보보호 책임자 : 남나눔</h4>
	</div>
		
	
	<script>
				// 내용 작성 부분의 공간을 클릭할 때 파일 첨부 창이 뜨도록 설정하는 함수
				$(function(){
						$("#fileArea").hide(); 
								
						$("#titleImg").click(function(){
							$("#thumbnailImg1").click();
						});
					});
						
				// 각각의 영역에 파일을 첨부 했을 경우 미리 보기가 가능하도록 하는 함수
				function LoadImg(value, num){
					if(value.files && value.files[0]){
						var reader = new FileReader();
								
						reader.onload = function(e){								
							switch(num){
							case 1: 
								$("#titleImg").attr("src", e.target.result);
								break;
							}
						}
								
						reader.readAsDataURL(value.files[0]);
					}
				}
			</script>	
</body>
</html>