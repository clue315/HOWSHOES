<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="foot.model.vo.Foot" %>
<%
	Foot f = (Foot)request.getAttribute("f");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<style>
	/* 폼 속성 */
	input[type="text"], input[type="password"] {
		width:300px;
		height: auto; /* 높이 초기화 */
		line-height: normal; /* line-height 초기화 */
		padding: .8em .5em; /* 여백 설정 */
	 }
	input[type="submit"] {
		background:black; 
		color:white; 
		padding: 10px; 
		font-weight: bold;
	    font-size: 15px; 
		margin:20px auto;							
	}
	input[type="reset"] {
		background:white; 
		color:black; 
		padding: 10px; 
		font-weight: bold;
	    font-size: 15px; 
		margin:20px auto;							
	}
	input::placeholder { 
	  color: #4472C4;
	}
	/* 태그 속성  */
	*{padding:0; margrin:0;}
	ul > li{list-decoration:none;  font-weight:bold; font-size:15px; display:inline-block; padding: 0 10px;}
	ul{text-align:center;}
	html, body {height: 100%;}
	small, sub{color:#AFA8A8;}
	table{border:1px solid #DEDEDE; border-collapse: collapse; table-layout:fixed; width:100%; margin: auto; }
	
	
	/*중앙 */
	article{margin:10px auto;  box-sizing:border-box;}
	main{box-sizing:border-box; margin:auto;}
	footer{height:100px;  margin:auto; clear:both; text-align:center; }
	section{margin:0 auto 20px auto; box-sizing:border-box; padding:0 100px;}
	
	
	/*header 영역  */
	#header{position:relative; width:auto; min-height:200px; margin:0 auto;}
	.subMenu{position:relative; display:inline-block;}
	#logoDiv{position:absolute; left:50%; transform:translate(-50%, 50%);}
	#Logo{width:349px; height:116px;margin:0 auto;}
	
	/*서브 메뉴 -(로그인, 공지 ,이벤트 등..) */
	#sub2{float:right;}
	#sub{float:left;}
	
	
	/*중앙 컨텐츠 */
	#category{position:relative; background-image: url('image/trapezoid.png');  background-size:cover; width:auto; font-weight:bold;  }
	#category-list {color:white; margin:0 auto;}
	

	/* 발 정보 입력 */
	#link-location{margin:30px auto 0 auto;}
	#footInfo{left:50%; transform:translate(-50%, -50%); display:inline-block; position:relative; text-align:center;}
	#footInfo-table tr,th{border:1px solid #DEDEDE; text-align:center; }
	#footInfo-table th{background-color:#DEDEDE; border-top: 5px solid black; padding:15px 10px;}
	#footInfo-table td{padding:15px 20px; }
	.footDiv{display:inline-block; padding:0 15px;}
	.foot-imgae{width:100px; height:100px;}
	
	
	/*테이블 버튼*/
	.btn-f{position: relative;  background:black; color:white; padding: 10px; font-weight: bold; font-size: 15px; margin:20px auto; }
	.btn-f:hover{color:#4572C4;}
	#btn-form{float:right;}
	#TestBtn{ width: 60px; height: 45px; background:black; color: white; margin:20px auto;}
	
</style>
</head>
<body>
   <%@ include file="../common/menubar.jsp" %>
   
		<main>
		<section>
		<article>
		<div id="Mypage-link">
			<div id="link-location">
				<small>STORE > FOOT</small>
				<h2 style="margin:10px auto;">Foot</h2>
			</div>
			<div id="footInfo">
				<h2 style="margin:0 autuo;">발 정보 입력</h2>
				
			</div>
			<div>
				<table id=footInfo-table>
					<tr>
						<th colspan="2"></th>
					</tr>
					<tr>
						<td><img src="images/foot_3.png" class="foot-imgae"><strong style="padding:auto 50px auto 10px;">발 측정 방법이 궁금하세요?</strong> <button class="btn-f" onclick="location.href='<%= request.getContextPath() %>/footCheckLink.no'">발 측정 방법 확인하기</button></td> 
						<td></td>
					</tr>
  			<form action="<%= request.getContextPath() %>/footInsert.no" method="post">
  			 
					<tr>
						<td><strong style="padding:0 50px;">발 길이</strong> &nbsp; &nbsp; &nbsp; &nbsp;
						<input type="text"  name="length" required  id="input_text" placeholder="발 길이를 입력하세요" ></td>
						<td></td>
					</tr>
					<tr>
						<td><strong style="padding:0 50px;">발 너비</strong> &nbsp; &nbsp; &nbsp; &nbsp;
						<input type="text" name="dimensions" required id="input_text" placeholder="발 너비를 입력하세요" ></td>
						<td></td>

					</tr>
					<tr>
						<td><strong>해당 되는 발 모양에 체크하세요.</strong></td>
						<td> 
							<div class="footDiv"><img src="images/foot_4.png" class="foot-imgae">기본
							  <input type="checkbox" name="type" value="1"></div>
							<div class="footDiv"><img src="images/foot_2.png" class="foot-imgae">평발
							  <input type="checkbox" name="type" value="2"></div>
							<div class="footDiv"><img src="images/foot_1.png" class="foot-imgae">오목발
							  <input type="checkbox" name="type" value="3" ></div>
							<div class="footDiv"><img src="images/foot_4.png" class="foot-imgae">칼발
							  <input type="checkbox" name="type" value="4"> </div>
						</td> 
					</tr>
					
	 			</table>
				<div id="btn-form">
					<input type="reset"  onclick="location.href='javascript:history.go(-1);'" value="취소">
					<button type="submit" disabled="true" id="TestBtn" onclick="footCheck();" value="등록" >등록</button>
				</div>
			</div>
		</div>		
		 </article>
		</section>
		</main>
   </form>
   <script>
		$(function(){
			$("#input_text").on('input',function(){
				if($("#input_text").val()=='')
                   $("#TestBtn").attr("disabled",true);  
                else
                   $("#TestBtn").attr("disabled",false);
			});
		}) 

		function footCheck(){
			window.alert('발 정보가 등록되었습니다.');
		};  
   </script>
	<footer>
		<p>
			<strong>통합고객센터</strong> 080-000-0000 &nbsp; 1588-0000 &nbsp; 월 ~ 금  &nbsp; 09:00 ~ 18:00(주말, 공휴일 휴무)<br>
			<small> (주)안녕하슈  &nbsp; |  &nbsp; 대표이사: 아무개  &nbsp;| &nbsp;주소 : 서울특별시 강남구 역삼동 <br>
			사업자 등록번호 : 201-81-12341  &nbsp;|&nbsp; 개인정보보호 책임자 : 아무개  &nbsp;|&nbsp;이메일 : amg@helloshoeskorea.com</small>	
		</p>
	</footer>		
</body>
</html>