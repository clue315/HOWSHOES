<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.model.vo.Board" %>
<% 
	Board b = (Board)request.getAttribute("board"); 
	String category = b.getQcName();
 	int cate = 0;
 	switch(category){
 	case "주문/결제": cate = 10; break;
 	case "배송": cate = 20; break;
 	case "교환/환불": cate = 30; break;
 	case "회원정보": cate = 40; break;
 	case "포인트": cate = 50; break;
 	case "기타": cate = 60; break;
 	}
 	
 	String[] selected = new String[6];
 	selected[(cate/10) - 1] = "selected";%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* section */
	/* 섹션 크기 */
	#section {
		margin-top: 60px;
		margin-bottom: 100px;
		margin-left: auto;
		margin-right: auto;
		height: auto;
		width: 800px;
	}
	/* 바깥div 크기 및 테두리 */
	.outer {
		margin-left: auto;
		margin-right: auto;
		
		height: auto;
		width: 800px;
		border: 3px solid black;
	}
	/* 바깥div 타이틀 */
	.outerBg {
		margin-left: auto; margin-right: auto;
		background-image: url("Image/title_bg.png");
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
	/* 라벨 */
	.label {
		
		margin-bottom: 20px;
		margin-left: auto;
		margin-right: auto;	
		width: 90%;
	}
	/* 제목 입력칸 */
	#title_text {
		display: block;
		margin-top: -20px;
		margin-left: auto;
		margin-right: auto;
		width: 90%;
		height: 30px;
		outline: none;
		border: 1px solid black;
		border-radius: 0px;
		font-family: "맑은 고딕";
	}
	/* 내용 입력칸 */
	#content_text {
		display: block;
		margin-top: -20px;
		margin-bottom:50px;
		margin-left: auto;
		margin-right: auto;
		width: 90%;
		height: 402px;
		resize: none;
		outline: none;
		border: 1px solid black;
		border-radius: 0px;
		font-family: "맑은 고딕";
	}
		/* 등록버튼 */
	#updateBoBtn {
		margin-top: 6px;
		margin-right: -3px;
		border: 0;
		outline: 0;
		font-size: 16px;
		font-weight: bold;
		width: 50px;
		height: 30px;
		background: black;
		color: white;
		float: right;
	}
	#updateBoBtn:hover {
		background: #4572C4;
		cursor: pointer;
	}
	/* 취소버튼 */
	#cancelBtn {
		margin-top: 6px;
		margin-right: 3px;
		border: 0;
		outline: 0;
		font-size: 16px;
		font-weight: bold;
		width: 50px;
		height: 30px;
		background: white;
		border: 3px solid black;
		float: right;
	}
	#cancelBtn:hover {
		border: 3px solid #4572C4;
		color: #4572C4;
		cursor: pointer;
	}
	
/* footer */	
	#footer {
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
		<div class="outer">
			<div class="outerBg">
				<div class="outerText">Q&A</div>
			</div>
			<div class="writeArea">
				<form action="<%= request.getContextPath() %>/update.bo" method="post">
					<div>
						<h4 class="label">제목</h4>
						<input type="text" id="title_text" name="title" value="<%= b.getbTitle() %>">
						
					</div>
					<div class="label" style="padding:0;">				
						<h4>분야<input type="hidden" name="bId" value="<%= b.getbNo() %>"></h4>
								<select name="QnAcategory">
									<option>--------</option>
									<option value="10"<%= selected[0] %>>주문/결제</option>
									<option value="20"<%= selected[1] %>>배송</option>
									<option value="30"<%= selected[2] %>>교환/환불</option>
									<option value="40"<%= selected[3] %>>회원정보</option>
									<option value="50"<%= selected[4] %>>포인트</option>
									<option value="60"<%= selected[5] %>>기타</option>
								</select>	
					</div>
					<div>
						<h4 class="label">내용</h4>
						<textarea id="content_text" name="content" ><%= b.getbContent() %></textarea>
					</div>
					<div align="center">
						<input type="submit" id="updateBoBtn" value="저장">
						<input type="button" onclick="location.href='javascript:history.go(-1);'" id="cancelBtn" value="취소">
					</div>
				</form>
			</div>
		</div>
	</div>

	<div id="footer">
		<hr id="footer_hr">
		<h4 class="footer_text" id="line1">고객센터 : 1588-0000  |  이메일 : amg@howshoes.com  |  운영시간 : 월~금 / 09:00~18:00 / 주말, 공휴일 휴무</h4>
		<h4 class="footer_text" id="line2">(주)안녕하슈  |  대표이사 : 강건강  |  주소 : 서울특별시 강남구 역삼동 남도빌딩 3층</h4>
		<h4 class="footer_text" id="line3">사업자등록번호 : 201-81-12345  |  개인정보보호 책임자 : 남나눔</h4>
	</div>
</body>
</html>