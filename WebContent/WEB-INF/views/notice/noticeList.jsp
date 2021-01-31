<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, notice.model.vo.Notice" %>
<%
	ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");
%> --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, notice.model.vo.Notice, notice.model.vo.PageInfo" %>
<%
	ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="css/common.css?ver=1">
<style type="text/css">
/* section */
	/* 섹션 크기 */
	#section {
		margin:20px auto 50px auto;
		min-height: 200px;
		width: 1300;
		padding:0 150px;
	}
	/* 바깥div 크기 및 테두리 */
	.outer {
		margin-left: auto;
		margin-right: auto;
		border: 3px solid black;
		min-height:100px;
		width: 1200px;
	}
	/* 바깥div 타이틀 */
	.outerBg {
		margin-left: auto; margin-right: auto;
		background-image: url("Image/title_bg.png");
		background-size:cover;
		background-repeat : no-repeat;
		width: 242px; height: 35px;
	}
	.outerText {
		color: white;
		text-align: center; vertical-align: middle;
		font-family: "Typo_SsangmunDong"; font-size: 25px;
		font-weight:bold;
		width: 242px; height: 35px;
		display: table-cell;
	}
	/* 테이블 사이즈 및 행 간격 */
 	.listArea {
 		min-height:300px;
		margin-top: 50px;
		margin:60px auto;
		line-height: 2.2;
		
	}
	/* 테이블 제목부분 */
	th {
		width: 150px;
		padding: 5px;
		font-weight: bold;
		border-bottom: 1px solid black;
		font-size: 16px;
	}
	
	/* 테이블 열 너비 */
	#no {width: 80px;}
	#title {width: 480px;}
	#writer {width: 100px;}
	#count {width: 100px;}
	#date {width: 150px;}
	/* 테이블 내용 가운데 정렬 및 테두리 간격 삭제 */
	#tableArea {
		text-align: center;
		border-collapse: collapse;
		margin:50px auto;
		font-size:20px;
		
	}
	#tableArea th{font-size:25px;}
	/* 페이징버튼 */
	#pagingArea button{
		margin-top: 35px;
		border: 0px;
		outline: 0px;
		background: none;
		font-size: 15px;
		font-weight: bold;
		cursor: pointer;
	}
	/* #pagingArea button:hover {
		color: #4572C4;
		cursor: pointer;
	} */
	/* 작성버튼 */	
	#writeNoBtn {
		margin-top: 3px;
		margin-right: 198px;
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
	/* 작성버튼 마우스호버 효과 */
	#writeNoBtn:hover {
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
		padding:50px auto auto auto;
		color: #969696;
	}
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	<div id="section">
		<div class="outer">
			<div class="outerBg">
				<div class="outerText">공지사항</div>
			</div>
			<div class="listArea">
				<table id="tableArea">
					<tr>
						<th id="no">글번호</th>
						<th id="title" width="300px">글제목</th>
						<th id="writer" width="100px">작성자</th>
						<th id="count">조회수</th>
						<th id="date" width="100px">작성일</th>
					</tr>
					<% if(list.isEmpty()) { %>
					<tr>
						<th colspan="5">존재하는 공지사항이 없습니다.</td>
					</tr>
					<% } else { %>
					<% 		for(Notice n : list) { %>
					<tr>
						<td><%= n.getN_no() %></td>
						<td><%= n.getN_title() %></td>
						<td><%= n.getN_writer() %></td>
						<td><%= n.getN_count() %></td>
						<td><%= n.getN_date() %></td>
					</tr>
					<%		} %>
					<% } %>
				</table>
			</div>
			<!-- 페이징 -->
			<div id="pagingArea" align="center">
				<!-- 맨 처음으로 -->
				<button onclick="location.href='<%= request.getContextPath() %>/list.no?currentPage=1'">&lt;&lt;</button>
				
				<!-- 이전 페이지로 -->
				<button onclick="location.href='<%= request.getContextPath() %>/list.no?currentPage=<%= currentPage - 1 %>'" id="beforeBtn">&lt;</button>
				<script>
					if(<%= currentPage %> <= 1){
						var before = $('#beforeBtn');
						before.attr('disabled', 'true');
					}
				</script>
				
				<!-- 숫자 목록 버튼 -->
				<% for(int p = startPage; p <= endPage; p++){ %>
					<% if(p == currentPage){ %>
						<button id="choosen" disabled><%= p %></button>
					<% } else { %>
						<button id="numBtn" onclick="location.href='<%= request.getContextPath() %>/list.no?currentPage=<%= p %>'"><%= p %></button>
					<% } %>
				<% } %>
				
				<!-- 다음 페이지로 -->
				<button onclick="location.href='<%= request.getContextPath() %>/list.no?currentPage=<%= currentPage + 1 %>'" id="afterBtn">&gt;</button>
				<script>
					if(<%= currentPage %> >= <%= maxPage %>){
						var after = $('#afterBtn');
						after.attr('disabled', 'true');
					}
				</script>
				
				<!-- 맨 끝으로 -->
				<button onclick="location.href='<%= request.getContextPath() %>/list.no?currentPage=<%= maxPage %>'">&gt;&gt;</button>
			</div>
		</div>
		
		<!-- 관리자계정으로 로그인했을 때 작성버튼 표시-->
		<%-- <div align="right">
			<% if(loginUser != null && loginUser.getUserId().equals("admin")){ %>
			<input type="button" onclick="location.href='writeNoticeForm.no'" id="writeNoBtn" value="글쓰기">
			<% } %>
		</div> --%>
		<% if(  loginUser != null && loginUser.getM_Id().equals("admin") ) { %> 
		<div>
			<input type="button" onclick="location.href='writeNoticeForm.no'" id="writeNoBtn" value="작성">
		</div>
		 <% } %>
	</div>
	
	<div id="footer">
		<hr id="footer_hr">
		<h4 class="footer_text" id="line1">고객센터 : 1588-0000  |  이메일 : amg@howshoes.com  |  운영시간 : 월~금 / 09:00~18:00 / 주말, 공휴일 휴무</h4>
		<h4 class="footer_text" id="line2">(주)안녕하슈  |  대표이사 : 강건강  |  주소 : 서울특별시 강남구 역삼동 남도빌딩 3층</h4>
		<h4 class="footer_text" id="line3">사업자등록번호 : 201-81-12345  |  개인정보보호 책임자 : 남나눔</h4>
	</div>
	
	<script>
		$(function() {
			$('#tableArea td').mouseenter(function(){
				$(this).parent().css({'background':'#4572C4', 'color':'white', 'cursor':'pointer'});
			}).mouseout(function(){
				$(this).parent().css({'background':'none', 'color':'black'});
			}).click(function(){
				var num = $(this).parent().children().eq(0).text();
				location.href='<%= request.getContextPath() %>/detail.no?no=' + num;
			});
		});
	</script>
</body>
</html>