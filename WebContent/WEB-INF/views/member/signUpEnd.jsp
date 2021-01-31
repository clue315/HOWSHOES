<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member" %>
    <%
    Member m = (Member)request.getAttribute("member");
    %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="../js/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="css/signUpEnd.css?ver=1">
<style>
	.navi {
		list-style-type: none;
		height: 40px;
		padding: 0;
		margin: 0;
		background-image: url("smaple/categori.PNG");
	}
	.navi li {
		float: left;
		position: relative;
		left: 550px;
		padding: 0;
		line-height: 40px;
	}
	.navi li a {
		display: block;
		font-weight: 600;
		font-size: 14px;
		padding: 5px 25px;
		text-decoration: none;
		color: white;
	}
	.navi li a:hover {
		color: red;
	}
	
	section{
		box-sizing: border-box;
		width: 100%;
		margin-right: auto;
		margin-left: auto;
		max-width: 1920px;
		padding-right: 100px;
		padding-left: 100px;
		text-align: left;
	}
	
	footer{
		font-family: Roboto;
		font-style: normal;
		font-weight: bold;
		font-size: 20px;
		line-height: 28px;
		text-align: center;
		color: gray;
	}
	#hdiv1{
		position: absolute;
	}
	#hdiv2{
		position: absolute;
	  	right: 0;
	}
	#rogo{
		width: 349px;
		height: 116px;
		display:block;
		margin-left: auto;
		margin-right: auto;
	}
	#etc1{
		position: relative;
		float: left;
		font-size: 24px;
		color: #AFA8A8;
	}
	#etc2{
		position: relative;
		float: left;
		font-size: 64px;
	}
	#img{
		diplay: inline;
		text-align: center;
	}
	#img1{
		width: 485px;
		height: 180px;
	}
	form{
		text-align: center;
	}
	#fs{
		font-size: 64px;
	}
	#ss{
		font-size: 36px;
	}
	#ts{
		font-size: 24px;
		color: #F81616;
	}
	.btn{
		width: 212px;
		height: 72px;
	}
	
	#mPage{
		background: white;
		color: black;
	}
	#fPage{
		background: #4572C4;
		color: white;
	}
</style>
</head>
<body>
<%@ include file="../common/menubar.jsp" %>
			

	<section>
		<br><br>
			<div id="etc1">STORE > JOIN</div><br><br>
			<div id="etc2">JOIN</div>
			<div id="img">
				<img id="img1" src="smaple/signUp2.PNG">
			</div>
			<br><hr><br><br><br><br><br><br>
				<span id="fs"><%= m.getM_Name() %></span><br><br><br><br>
				<span id="ss">안녕하슈의 회원이 되신것을 진심으로 환영합니다</span><br><br><br>
				<input class="btn" id="mPage" type="button" value="메인화면">
				<input class="btn" id="fPage"type="button" value="발 정보 입력"><br><br><br>
				<span id="ts">잠깐! 발 정보 입력한 회원은 구매금액의 5%를 포인트로 적립해드립니다.</span><br><br><br><br><br><br>
			
	</section>
	
	<footer><p><strong>통합고객센터</strong> 080-000-0000 &nbsp; 1588-0000 &nbsp; 월 ~ 금  &nbsp; 09:00 ~ 18:00(주말, 공휴일 휴무)<br>
					 <small> (주)안녕하슈  &nbsp; |  &nbsp; 대표이사: 아무개  &nbsp;| &nbsp;주소 : 서울특별시 강남구 역삼동 <br>
					   	사업자 등록번호 : 201-81-12341  &nbsp;|&nbsp; 개인정보보호 책임자 : 아무개  &nbsp;|&nbsp;이메일 : amg@helloshoeskorea.com</small>	
			</p></footer>
</body>
</html>