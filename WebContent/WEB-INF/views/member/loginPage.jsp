<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.5.1.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet"> 
<style>	
	/* 섹션 크기 */
	#section {
		margin:20px auto 50px auto;
		min-height: 360px;
		width: 600px;
		padding:0 150px;
	}
	/* 바깥div 크기 및 테두리 */
	.outer {
		margin-left: auto;
		margin-right: auto;
		border: 3px solid black;
		margin-top: 130px;
		min-height: 250px;
	}

	table {
		margin-left: auto;
		margin-right: auto;
	}
	
	td{
		text-align: center;}
	
	/* 아이디 입력  */
	#m_Id{
		border: 1px solid black;
		outline: none;
		position:relative; 
		text-align:center;
		font-size: 20px;
		height: 40px;
		width: 330px;
	}
	
	/* 비밀번호 입력 */	
	#m_Pwd{
		border: 1px solid black;
		outline: none;
		position:relative; 
		text-align:center;
		font-size: 20px;
		height: 40px;
		width: 330px;
	}
	
	input::placeholder {
	  	color: rgb(69, 114, 196);
	}
	
	/* 로그인 버튼 */
	#loginBtn{
		border: none;
		outline: none;
		margin-top: 10px;
		margin-left: auto;
		font-size: 25px;
		height: 50px;
		width: 340px;
		background-color:  black;
	  	color: white;
	  	font-family: "Typo_SsangmunDong"; font-size: 25px;
	}
	#loginBtn:hover{
		background: #4572C4;
		cursor: pointer;	
	}
	/* 회원가입 버튼 */
	#joinBtn{
		margin-top: 25px;
		margin-left: auto;
		font-size: 25px;
		height: 50px;
		width: 200px;
		background-color:  black;
	  	color: white;
		
	}
	#joinBtn:hover{
		border:3px solid #4572C4;
		color: #4572C4;
		cursor: pointer;	
	}
	/* 아이디 찾기  */
	#find_id{
		/* margin-top: 19px;
		margin-left: 700px; */
		background-color:  white;
		width: 170px;
		height: 50px;
		border: 1px solid white;
		font-size: 18px;
		font-weight: bold;
		border: 0px;
		outline: 0px;
	}
	#line{
		margin-top: -39px;
		margin-left: 850px;
		font-size: 18px;
	}
	/* 비밀번호 찾기 */
	#find_pwd{
		/* margin-top: -40px;
		margin-left: 870px; */
		background-color:  white;
		width: 170px;
		height: 50px;
		border: 3px solid white;
		font-size: 18px;
		font-weight: bold;
		border: 0px;
		outline: 0px;
	}
	#footer {
		text-align: center;
		padding-top: 25px;
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
			<br>
			<form id="loginForm" action="<%= request.getContextPath() %>/login.me" method="post">
				<table>
					<tr>
						<td>
							<input type="text" name="m_Id" size="30" maxlength="15" placeholder="아이디를 입력해주세요" id="m_Id">
						</td>
					</tr>
					<tr>
						<td>
							<br>
							<input type="password" name="m_Pwd" placeholder="비밀번호를 입력해주세요" id="m_Pwd"> 
						</td>
					</tr>
					<tr>
						<td>
							<div style="color:#4572C4; font-size:15px; font-weight:bold; margin-top:10px;  cursor:pointer;" onclick="gomemberJoin();">아직 안녕하슈의 회원이 아니신가요?</div>
						</td>
					</tr>
					<tr>
						<td>
							<div>
								<input type="submit" value="로그인" id="loginBtn">
							</div>
						</td>
					</tr>
				</table>
			
			
			</form>
			
			
		</div>
	</div>
	
	
   		<div id="footer">
			<hr id="footer_hr">
			<h4 class="footer_text" id="line1">고객센터 : 1588-0000  |  이메일 : amg@howshoes.com  |  운영시간 : 월~금 / 09:00~18:00 / 주말, 공휴일 휴무</h4>
			<h4 class="footer_text" id="line2">(주)안녕하슈  |  대표이사 : 강건강  |  주소 : 서울특별시 강남구 역삼동 남도빌딩 3층</h4>
			<h4 class="footer_text" id="line3">사업자등록번호 : 201-81-12345  |  개인정보보호 책임자 : 남나눔</h4>
		</div>
		<script>
			function gomemberJoin(){
				 location.href='<%= request.getContextPath() %>/signUpForm.me';
			 }
		</script>
		
</body>
</html>