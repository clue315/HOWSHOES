<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="notice.model.vo.Notice" %>
<% Notice notice = (Notice)request.getAttribute("notice"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
/* section */
	/* 섹션 크기 */
	#section {
		margin-top: 60px;
		margin-left: auto;
		margin-right: auto;
		height: 600px;
		width: 800px;
	}
	/* 바깥div 크기 및 테두리 */
	.outer {
		margin-left: auto;
		margin-right: auto;
		height: 540px;
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
	/* 테이블 사이즈 및 행 간격 */
 	.detailArea {
		margin-top: 20px;
		margin-left: 100px;
		margin-right: 100px;
		
	}
	#tableArea {
		width: 100%;
	}
	#title {
		margin-top: 20px;
		font-weight: bold;
		font-size: 30px;
	}
	#writer {
		text-align: right;
	}
	#date {
		text-align: right;
		border-bottom: 1px solid black;
	}
	#content {
		width: 600px;
		height: 350px;
		resize: none;
		border: none;
		outline: none;
		font-family: "맑은 고딕";
		font-size:20px;
		click: none;
	}
	/* 삭제버튼 */
	#deleteNoBtn {
		border: 0;
		outline: 0;
		font-size: 16px;
		font-weight: bold;
		width: 50px;
		height: 30px;
		background: white;
		border: 3px solid black;
		float: right;
		margin-top:44px;
		margin-right: 3px;
	}
	#deleteNoBtn:hover {
		border: 3px solid #4572C4;
		color: #4572C4;
		cursor: pointer;
	}
	/* 수정버튼 */
	#updateNoBtn {
		border: 0;
		outline: 0;
		font-size: 16px;
		font-weight: bold;
		width: 50px;
		height: 30px;
		background: white;
		border: 3px solid black;
		float: right;
		margin-top:44px;
		margin-right: -50px;
	}
	#updateNoBtn:hover {
		border: 3px solid #4572C4;
		color: #4572C4;
		cursor: pointer;
	}
	/* 목록버튼 */
	#listBtn {
		border: 0;
		outline: 0;
		font-size: 16px;
		font-weight: bold;
		width: 50px;
		height: 30px;
		background: black;
		color: white;
		float: right;
		margin-top:44px;
		margin-right: -103px;
		
	}
	#listBtn:hover {
		background: #4572C4;
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


/* 	.outer{
		width: 600px; height: 500px; background-color: rgba(255, 255, 255, 0.4); border: 5px solid white;
		margin-left: auto; margin-right: auto; margin-top: 50px;
	}
	.tableArea {width:450px; height:350px; margin-left:auto; margin-right:auto;}
	#updateNoBtn{background: #D1B2FF;}
	#cancelBtn{background: #B2CCFF;}
	#deleteNoBtn{background: #D5D5D5;} */
</style>
</head>
<body>
	
	<%@ include file="../common/menubar.jsp" %>
	<div id="section">
		<div class="outer">
			<div class="outerBg">
				<div class="outerText">공지사항</div>
			</div>
			<div class="detailArea">
				<form action="noticeUpdateForm.no" id="detailForm" name="detailForm" method="post">
					<table id="tableArea">
						<tr>
							<td id="title">
								<input type="hidden" name="no" value="<%= notice.getN_no() %>"> 
								<%= notice.getN_title() %>
							</td>				
						</tr>
						<tr>
							<td id="writer">
								<strong>작성자</strong> <%= notice.getN_writer() %> 
							</td>
						</tr>
						<tr>
							<td id="date"><%= notice.getN_date() %></td>
						</tr>
						<tr>
							<td>
								<textarea id="content" name="content" cols="60" rows="15" readonly><%= notice.getN_content() %></textarea>
							</td>
						</tr>
					</table>
					<div id="btnDiv" align="center">
					 <% if(  loginUser != null && loginUser.getM_Id().equals("admin") ) { %> 
						<input type="button" onclick="location.href='list.no'" id="listBtn" value="목록">
						<input type="submit" id="updateNoBtn" value="수정">
						<input type="button" id="deleteNoBtn" value="삭제" onclick="deleteNotice();">
					<%} else{ %>
					<input type="button" onclick="location.href='list.no'" id="listBtn" value="목록">
					<%} %>
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
	<script>
		function deleteNotice() {
			var bool = confirm("정말 삭제하시겠습니까?");
			if(bool) {
				location.href="<%= request.getContextPath() %>/delete.no?no=" + <%= notice.getN_no() %>;
			}
		}
	</script>
</body>
</html>