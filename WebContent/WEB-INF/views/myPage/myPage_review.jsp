<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, review.model.vo.*, product.model.vo.*, member.model.vo.*" %>
<%
	Member member = (Member)request.getAttribute("m");
 	Review review = (Review)request.getAttribute("review");
	PageInfo pi = (PageInfo)request.getAttribute("pi"); 
	ArrayList<Review> rList = (ArrayList<Review>)request.getAttribute("rList");
	ArrayList<ReviewImage> fList = (ArrayList<ReviewImage>)request.getAttribute("fList");
	
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
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.5.1.min.js"></script>
<style type="text/css">
	#section{
		margin-left: auto;
		margin-right: auto;
		width: 1150px;
		min-height: 390px;
	}
	.outer{
		border: 3px solid black;
		width: 920px;
		margin-left: 220px;
		margin-top: -326px;
		min-height: 320px;
	}
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
/* 사이드메뉴 */
	#subBlue{
		text-align: center;
		color: white;
	    width: 190px; 
	    height: 200px; 
	    background: #4572C4;
	}
	ul {
		margin-top: 0px;
	}
	#subMenuDiv{
		text-align: center;
	}
	.submenuLink { /* 상위 메뉴  a 태그에 공통으로 설정할 스타일 */
		text-decoration: none;
		margin-left: 45px;
		display: block;
		width: 100px;
		font-size: 15px;
		font-weight: bold;
		
	}  
	.subMenuLi { /* 상위 메뉴와 하위 메뉴의 a 태그에 공통으로 설정할 스타일 */
		display: block;
		text-align: center;
		width: 100px;
	    margin-top:  10px;
		font-size: 15px;
		font-weight: bold;
		
	} 
	.subMenuLi:hover .submenuLink{ /* 상위 메뉴의 li에 마우스오버 되었을 때 스타일 설정 */
		color: #4572C4;
	}

	.row_1{
		width: 186px;
		border: 1px solid lightgray;
	}
	.submenuLink { /* 상위 메뉴의 글씨색을 흰색으로 설정 */
		color: black;
	}	
	#userUpadteBtn{  background:white; color:black; padding: 10px; font-weight: bold; font-size: 15px;  outline: none; border: none;}
	#userUpadteBtn:hover{background:black; color:white;}
/* 리뷰 테이블 */
	table{
		margin-left: auto;
		margin-right: auto;
		table-layout: fixed;
		word-break: break-all;
		margin-top: 20px;
		width: 650px;
		text-align: center;
		border-collapse: collapse;
	}
	#reviewEmpty {
		margin-top: auto;
		margin-bottom: auto;
		height: 213px;
		font-size: 36px;
		font-weight: bolder;
	}
	#productNameTd {
		border-top: 3px solid black;
		padding: 10px;
		font-weight: bolder;
		font-size: 18px;
	}
	#starDiv {
		margin-top: -4px;
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
	#dateDiv {
		text-align: right;
		padding-right: 20px;
		font-size: 14px;
		margin-top: 2px;
	}
	#dateLabel {
		display: inline-block;
		font-size: 14px;
		font-weight: bolder;
	}
	#imageTd {
		padding-bottom: 10px;
	}
	#reviewImage {
		width: 160px;
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
	}
	#buttonTd {
		border-bottom: 3px solid black;
		height: 60px;
	}
	#buttonDiv {
		margin-top: -2px;
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
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	<div id="section">
			<!-- 사이드메뉴 -->
			<div>
				<div  id="subBlue">
			    	<form action="<%= request.getContextPath() %>/updateForm.me" method="post" id="myForm" name="myForm">
					<br>
					<br><strong><%= member.getM_Name() %>님<br>
			        <br> 보유 포인트<br> <%= member.getPoint() %>원</strong><br>
			        <br>
			        <input type="submit" id="userUpadteBtn" value="회원 정보 관리">
					</form> 
				</div>
				<div id="subMenuDiv">
					<ul>
						<li class="subMenuLi">
							<a class="submenuLink" href="<%= request.getContextPath() %>/mypageList.mp">장바구니</a>
						</li>
						
						<li class="subMenuLi"><hr class="row_1"></li>
						
						<li class="subMenuLi">
							<a class="submenuLink" href="<%= request.getContextPath() %>/myPagepurchase.mp">주문내역</a>
						</li>
						
						<li class="subMenuLi"><hr class="row_1"></li>
						
						<li class="subMenuLi">
							<a class="submenuLink" href="<%= request.getContextPath() %>/reviewList.my">리뷰관리</a>
						</li>
						
						<li class="subMenuLi"><hr class="row_1"></li>
					 </ul>
				</div>
			</div>
		<div class="outer">	
			<!-- 리뷰 리스트 -->
			<div>
				<div class="outerBg">
					<div class="outerText">리뷰관리</div>
				</div>
			</div>
			<% if(rList.isEmpty()) { %>
			<% } else { %>
				<!-- 페이징 -->
				<div class="pagingArea" id="pagingAreaTop" align="center">
					<!-- 맨 처음으로 -->
					<button onclick="location.href='<%= request.getContextPath() %>/reviewList.my?currentPage=1'">&lt;&lt;</button>
					
					<!-- 이전 페이지로 -->
					<button onclick="location.href='<%= request.getContextPath() %>/reviewList.my?currentPage=<%= currentPage - 1 %>'" class="beforeBtn">&lt;</button>
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
							<button id="numBtn" onclick="location.href='<%= request.getContextPath() %>/reviewList.my?currentPage=<%= p %>'"><%= p %></button>
						<% } %>
					<% } %>
					
					<!-- 다음 페이지로 -->
					<button onclick="location.href='<%= request.getContextPath() %>/reviewList.my?currentPage=<%= currentPage + 1 %>'" class="afterBtn">&gt;</button>
					<script>
						if(<%= currentPage %> >= <%= maxPage %>){
							var after = $('.afterBtn');
							after.attr('disabled', 'true');
						}
					</script>
					
					<!-- 맨 끝으로 -->
					<button onclick="location.href='<%= request.getContextPath() %>/reviewList.my?currentPage=<%= maxPage %>'">&gt;&gt;</button>
				</div>
			<% } %>
				<table id="tableArea">
					<% if(rList.isEmpty()) { %>
					<tr>
						<th id="reviewEmpty">
							리뷰를 작성해주세요.
						</th>
					</tr>
					<% } else { %>
						<% for(int i = 0; i < rList.size(); i++) { %>
							<% Review r = rList.get(i); %>
							<tr>
								<td colspan="3" id="productNameTd">
									<div>
										상품명 상품명 상품명 상품명
									</div>
								</td>
							</tr>
							<tr>
								<td id="starTd">
									<div id="starDiv">
										<%-- <% for(int j = 0; j < r.getR_score(); j++ ) { %>
										<label id="star">
													&#9733;
										</label>
										<% } %> --%>
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
								<td colspan="2" id="dateTd">
									<div id="dateDiv">
										<div id="dateLabel">작성일 </div> <%= r.getR_date() %>
									</div>
								</td>
							</tr>
							<tr>
								<td id="imageTd">
									<div id="imageDiv">
										<img id="reviewImage"
											 src="<%= request.getContextPath() %>/review_uploadFiles/<%= fList.get(r.getR_no() -1).getRi_changeName() %>">
									</div>
								</td>
								<td colspan="2" id="contentTd">
									<div id="contentDiv">
										<pre id="contentArea"><%= r.getR_content() %></pre>
									</div>
								</td>
							</tr>
							<tr>
							</tr>
							<tr>
								<td colspan="3" id="buttonTd">
									<input type="hidden" value="<%= r.getR_no() %>">
									<input type="hidden" value="<%= r.getR_writer()%>">
									<div id="buttonDiv" align="center">
										<input type="button" class="btn" id="detailbtn" value="수정 및 삭제">
									</div>
								</td>
							</tr>
						<% } %>
					<% } %>
				</table>
			<% if(rList.isEmpty()) { %>
			<% } else { %>
				<!-- 페이징 -->
				<div class="pagingArea" id="pagingAreaBottom" align="center">
					<!-- 맨 처음으로 -->
					<button onclick="location.href='<%= request.getContextPath() %>/reviewList.my?currentPage=1'">&lt;&lt;</button>
					
					<!-- 이전 페이지로 -->
					<button onclick="location.href='<%= request.getContextPath() %>/reviewList.my?currentPage=<%= currentPage - 1 %>'" class="beforeBtn">&lt;</button>
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
							<button id="numBtn" onclick="location.href='<%= request.getContextPath() %>/reviewList.my?currentPage=<%= p %>'"><%= p %></button>
						<% } %>
					<% } %>
					
					<!-- 다음 페이지로 -->
					<button onclick="location.href='<%= request.getContextPath() %>/reviewList.my?currentPage=<%= currentPage + 1 %>'" class="afterBtn">&gt;</button>
					<script>
						if(<%= currentPage %> >= <%= maxPage %>){
							var after = $('.afterBtn');
							after.attr('disabled', 'true');
						}
					</script>
					
					<!-- 맨 끝으로 -->
					<button onclick="location.href='<%= request.getContextPath() %>/reviewList.my?currentPage=<%= maxPage %>'">&gt;&gt;</button>
				</div>
			<% } %>
		</div>
	</div>
	 
	<div id="footer">
		<hr id="footer_hr">
		<h4 class="footer_text" id="line1">고객센터 : 1588-0000  |  이메일 : amg@howshoes.com  |  운영시간 : 월~금 / 09:00~18:00 / 주말, 공휴일 휴무</h4>
		<h4 class="footer_text" id="line2">(주)안녕하슈  |  대표이사 : 강건강  |  주소 : 서울특별시 강남구 역삼동 남도빌딩 3층</h4>
		<h4 class="footer_text" id="line3">사업자등록번호 : 201-81-12345  |  개인정보보호 책임자 : 남나눔</h4>
	</div>
	
 	<script>
		$(function() {
			$('.btn').click(function() {
				var rId = $(this).parent().parent().parent().children().children().eq(0).val();
				location.href="<%= request.getContextPath() %>/detailReviewImage.re?rId=" + rId;
			});
		});
	</script>
</body>
</html>