<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, review.model.vo.Review, review.model.vo.PageInfo" %>
<%
	
	ArrayList<Review> list = (ArrayList<Review>)request.getAttribute("list");
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
		background-image: url("images/title_bg.png");
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
 	.listArea {
		margin-top: 25px;
		margin-left: 50px;
		margin-right: 50px;
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
	#no {width: 60px;}
	#title {width: 480px;}
	#writer {width: 100px;}
	#count {width: 60px;}
	#date {width: 100px;}
	/* 테이블 내용 가운데 정렬 및 테두리 간격 삭제 */
	#tableArea {
		text-align: center;
		border-collapse: collapse;
	}
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
		margin-top: -3px;
		margin-right: -6px;
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
				<div class="outerText">공지사항</div>
			</div>
			<div class="listArea">
				<table id="tableArea">
					<tr>
						<th width="100px">글번호</th>
						<th width="150px">작성일</th>
						<th width="150px">작성자</th>
						<th width="100px">별점</th>
						<th width="300px">내용</th>
						<th width="100px">조회수</th>
					</tr>
					<% if(list.isEmpty()) { %>
					<tr>
						<th colspan="5">공지사항이 없습니다.</th>
					</tr>
					<% } else { %>
						<% for(Review r : list){ %>
						<tr>
							<td><%= r.getR_no() %></td>
							<td><%= r.getR_date() %></td>
							<td><%= r.getR_writer() %></td>
							<td><%= r.getR_score() %></td>
							<td><%= r.getR_content() %></td>
							<td><%= r.getR_count() %></td>
						</tr>
						<% } %>
					<% } %>
				</table>
			</div>
			<!-- 페이징 -->
			<div class="pagingArea" id="pagingAreaTop" align="center">
				<!-- 맨 처음으로 -->
				<button onclick="location.href='<%= request.getContextPath() %>/list.re?currentPage=1'">&lt;&lt;</button>
				
				<!-- 이전 페이지로 -->
				<button onclick="location.href='<%= request.getContextPath() %>/list.re?currentPage=<%= currentPage - 1 %>'" class="beforeBtn">&lt;</button>
				<script>
					if(<%= currentPage %> <= 1){
						var before = $('.beforeBtn');
						before.attr('disabled', 'true');
					}
				</script>
				
				<!-- 숫자 목록 버튼 -->
				<% for(int p = startPage; p <= endPage; p++){ %>
					<% if(p == currentPage){ %>
						<button id="choosen" disabled><%= p %></button>
					<% } else { %>
						<button id="numBtn" onclick="location.href='<%= request.getContextPath() %>/list.re?currentPage=<%= p %>'"><%= p %></button>
					<% } %>
				<% } %>
				
				<!-- 다음 페이지로 -->
				<button onclick="location.href='<%= request.getContextPath() %>/list.re?currentPage=<%= currentPage + 1 %>'" class="afterBtn">&gt;</button>
				<script>
					if(<%= currentPage %> >= <%= maxPage %>){
						var after = $('.afterBtn');
						after.attr('disabled', 'true');
					}
				</script>
				
				<!-- 맨 끝으로 -->
				<button onclick="location.href='<%= request.getContextPath() %>/list.re?currentPage=<%= maxPage %>'">&gt;&gt;</button>
			</div>
			
			<div class="buttonArea" align="right">
				<% if(loginUser != null){ %>
				<button onclick="location.href='<%= request.getContextPath() %>/writeReviewForm.re'">작성하기</button>
				<% } %>
			</div>
		</div>
	</div>
	<script>
		$(function() {
			$('#tableArea td').mouseenter(function(){
				$(this).parent().css({'background':'#4572C4', 'color':'white', 'cursor':'pointer'});
			}).mouseout(function(){
				$(this).parent().css({'background':'none', 'color':'black'});
			}).click(function(){
				var rId = $(this).parent().children().eq(0).text();
				if('<%= loginUser %>' != 'null'){
					location.href='<%= request.getContextPath() %>/detail.re?rId=' + rId;
				} else {
					alert('회원만 이용할 수 있는 서비스입니다.');
				}
			});
		});
	</script>
</body>
</html>