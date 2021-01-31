<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

/* section */
	section {
		margin-top: 60px;
		margin-left: auto;
		margin-right: auto;
		margin-bottm: 50px;
		width: 100%; 
	}
	.border {
		margin-left: auto;
		margin-right: auto;
		width: 900px; height: 440px;
		border: 4px solid black;
	}
	/* 고객센터 타이틀 */
	.titleBg {
		margin-left: auto; margin-right: auto;
		background-image: url("images/title_bg.png");
		background-repeat : no-repeat;
		width: 242px; height: 35px;
	}
	.titleText {
		color: white;
		text-align: center; vertical-align: middle;
		font-family: "Typo_SsangmunDong"; font-size: 23px;
		width: 242px; height: 35px;
		display: table-cell;
	}
	/* 내용 */
	#call {
		float: left;
		margin-top: 40px;
		margin-left: 45px;
		position: relatice;
	}
	#email {
		float: left;
		margin-top: 40px;
		margin-left: 45px;
		position: relatice;
	}
	#qna {
		float: left;
		margin-top: 40px;
		margin-left: 45px;
		position: relatice;
	}
	/* qna 버튼 위치 및 스타일 */
	#qnaBtn {
		padding-top: 280px;
		padding-left: 655px;
		position: absolute;
	}
	#qnaBtn_style {
		border: 0;
		outline: 0;
		background: black;
		color: white;
		font-weight: bold;
		font-size: 20px;
		width:160px; height:40px;
		cursor:pointer;
	}
	#qnaBtn_style:hover {
		background: #4572C4; cursor:pointer;
	}

</style>
<link rel="stylesheet" href="css/common.css?ver=2">
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	<section>
		<div class="border">
			<div class="titleBg">
				<div class="titleText">고객센터</div>
			</div>
			<div id="call">
				<img src="Image/call.png">
			</div>
			<div id="email">
				<img src="Image/email.png">
			</div>
			<div id="qna">
				<img src="Image/qna.png">
			</div>
				<!-- <img src="images/qnaBtn_white.png"> -->
			<div id="qnaBtn">
				<input type="button" id="qnaBtn_style" onclick="location.href='<%= request.getContextPath() %>/list.bo'" value="Q&A 게시판">
			</div>
		</div>
	</section>
	<br><br><br>
	<div id="footer">
			<hr id="footer_hr">
			<h4 class="footer_text" id="line1">고객센터 : 1588-0000  |  이메일 : amg@howshoes.com  |  운영시간 : 월~금 / 09:00~18:00 / 주말, 공휴일 휴무</h4>
			<h4 class="footer_text" id="line2">(주)안녕하슈  |  대표이사 : 강건강  |  주소 : 서울특별시 강남구 역삼동 남도빌딩 3층</h4>
			<h4 class="footer_text" id="line3">사업자등록번호 : 201-81-12345  |  개인정보보호 책임자 : 남나눔</h4>
	</div>
</body>
</html>