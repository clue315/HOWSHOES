<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ page import ="member.model.vo.Member" %>
 <%
 	Member loginUser = (Member)session.getAttribute("loginUser");
 %>  
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>menu</title>
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.5.1.min.js"></script>
<style>
/* 태그 속성  */
    *{padding:0; margin:0;}
	
/* header */
	#header {
		width:100%;
		margin:0;
	}
	/* 좌측 서브메뉴 div*/
	.leftSub {
		margin-left: 20px;
		float: left;
		list-style: none;
		width: 300px;
	}
	/* 우측 서브메뉴 div*/
	.rightSub {		
		float: right;
		list-style: none;
		width: 226px;
	}
	/* 전체 서브메뉴 */
	.subMenu {	
		margin-left:5%;
		display:inline-block;
		font-weight: bold;
		font-size: 20px;
	}
	/* 전체 서브메뉴 마우스호버 효과 */
	.subMenu:hover {
		text-decoration: none;
		font-weight: bold;
		color: #4572C4;
		cursor: pointer;
	}
	/* 로고 div */
	.logo {
		width: 320px;
		height: 140px;
		margin-left: auto;
		margin-right: auto;
		margin-top: 40px;
	}
	/* 로고 이미지 */
	.logo img {
		display: block;
		margin: auto;
		width: auto;
		height: 100px;
		cursor:pointer;
	}
	
/* 카테고리  */
	#category-hr {
		width:100%;
		border:2px solid black;
		padding:0;
		margin:0;
	}
	#category {
		margin:0 auto;
		width:63%;
		height:50px;
		font-weight:bold;
		background-color:black;
	 	justify-content: center;
	 	clip-path: polygon(0% 0%, 100% 0%, 95% 100%, 5% 100%);
	 	}
	#category-list {
		margin-left: -60px;
		color:white;
		text-align:center;
		postion:absolute; 
	}
	#category-list > li {
		position:relative;
		list-decoration:none;
		margin-left: 60px; 
		display:inline-block;
	}
	.cate-btn {
	color: white;
	text-align: center;
	vertical-align: middle;
	font-family: "Typo_SsangmunDong"; font-size: 23px;
	height: 50px;
	padding:10px 0 10px 0;
	}
	#ranking {
		color: red;
	}
	#ranking:hover {
		color: #4572C4;
		cursor:pointer;
	}
	.cate-btn:hover {
		color: #4572C4;
		cursor:pointer;
	}
	
	/* 카테고리메뉴 div 및 배경 */
	.wrap {
		background-image: url("Image/category_bg.png");
		background-repeat : no-repeat;
		background-size: cover;
		width: 1920px;
	}
</style>
</head>
<body>
	<div id="header">
		<div class="leftSub">
		<div class="subMenu" onclick="goNotice();">공지사항</div>
		
		<div class="subMenu" onclick="goEvent();">이벤트</div>
		
		<div class="subMenu" onclick="goService();">고객센터</div>
	</div>
	
	<div class="rightSub">
	<% if(loginUser == null) { %>
		<div class="subMenu" onclick="gologin();">로그인</div>
		<div class="subMenu" onclick="gomemberJoin();">회원가입</div>
		
		
		
	<% } else{%>
		<div class="subMenu" onclick="gologout();">로그아웃</div>
		<div class="subMenu" onclick="gomyPage();">마이페이지</div>
		<div> <% if(loginUser.getM_Id().equals("admin") ) { %> 
		   <div class="buttonArea" style="visibility:visible;">			 
				<input type="button" style="width: 100px; height: 40px; background: white; color: black; margin-top: 50px;   font-size: 17px; font-weight: bold; border: 2px solid gray;"
				onclick="location.href='writeForm.to'" id="insertBtn" value="상품등록">
			</div>
		 <% } %></div>
	<%} %>

	</div>
		
		<!-- 로고 -->
		<div class="logo">
			<img src="<%=request.getContextPath()%>/Image/LogoImage.png" onclick="goHome();">
		</div>
	
		<!-- 카테고리 -->
		<hr id="category-hr">
		<div id="category">
			<ul id="category-list">
				<li onclick="goRanking();" class="cate-btn" id="ranking">RANKING</li>
				<li onclick="goTotal();" class="cate-btn">전체</li>
				<li onclick="goSneakers();" class="cate-btn">스니커즈</li>
				<li onclick="goRunning();" class="cate-btn">운동화</li>
				<li onclick="goMan();" class="cate-btn">남성신발</li>
				<li onclick="goWoman();" class="cate-btn">여성신발</li>
				<li onclick="goSlipperSandal();" class="cate-btn">슬리퍼/샌들</li>
			</ul>
		</div>
	</div>
	<br><br><br>	
	
	<script>
		
		/* 메뉴 함수 */
		function goService(){
			location.href='<%= request.getContextPath() %>/service.go';
		}
		function gologin(){
			location.href='<%= request.getContextPath() %>/login.go';
		}
	   	function gologout(){
			location.href='<%= request.getContextPath() %>/logout.me';
		}
	    function gomyPage(){
			 location.href='<%= request.getContextPath() %>/mypageList.mp';
		 }
	    function gomemberJoin(){
			 location.href='<%= request.getContextPath() %>/signUpForm.me';
		 }
	    function goNotice(){
			location.href='<%= request.getContextPath() %>/list.no';
		}
	    function goHome(){
			location.href='<%= request.getContextPath() %>';
		}
	    
	    
	    
	   /* 카테고리 함수 */ 
	   
	   	function goRanking(){
		var no = 1;
		location.href='<%= request.getContextPath() %>/rank.po?no=' + no;	
		}
	    function goTotal(){
			location.href='<%= request.getContextPath() %>/pro.to';
		}
		
	    function goSneakers(){
			var no = 10;
			location.href='<%= request.getContextPath() %>/Sne.sn?no=' + no;	
		}
		
		function goRunning(){
			var no = 20;
			location.href='<%= request.getContextPath() %>/Run.ru?no=' + no;				
		}
		
		function goMan(){
			var no = 30;
			location.href='<%= request.getContextPath() %>/Man.ma?no=' + no;			
		}
		
		function goWoman(){
			var no = 40;
			location.href='<%= request.getContextPath() %>/Wom.wo?no=' + no;			
		}
		
		function goSlipperSandal(){
			var no = 50;
			location.href='<%= request.getContextPath() %>/Sli.sl?no=' + no;			
		}
		
		
	</script>
</body>
</html>