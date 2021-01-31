<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="../js/jquery-3.5.1.min.js"></script>
<style>
/* 태그 속성  */
   /* 섹션 크기 */
	#section {
		margin-left: auto;
		margin-right: auto;
		width: 800px;
	}
	/* 바깥div 크기 및 테두리 */
	.outer {
		margin-left: auto;
		margin-right: auto;
		width: 600px;
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
	table{
		margin-top: 20px;
		font-size: 24px;
		margin-right: auto;
		margin-left: auto;
	}
	td{
		height: 110px;
	}
	.input{
		border: 1px solid black;
		outline: none;
		width: 377px;
		height: 50px;
	}
	#img{
		diplay: inline;
		text-align: center;
	}
	#img1{
		width: 169px;
		height: 157px;
		
	}
	#img2{
		width: 249px;
		height: 140px;
		align: center;
	}
	#buttonTd{
		height: 120px;
	}
	#signbtn{
		width:185px;
		height: 62px;
		color: white;
		font-size:20px;
		font-weight:bold;
		background: black;
		border: none;
		outline: none;
	}
	#signbtn:hover{
		background:#4572C4;
		cursor:pointer;
	}
	#cancel{
		width:185px;
		height: 62px;
		color: black;
		font-size:20px;
		font-weight:bold;
		background: white;	
		border:3px solid black;
		outline: none;
	}
	#cancel:hover{
		border:3px solid #4572C4;
		cursor:pointer;
		color:#4572C4; 
	}
	#idResult{
		font-size: 14px;
	}
	#pwdResult{
		font-size: 14px;
	}
/* footer */	
	#footer {
		text-align: center;
		margin-top: 60px;
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
				<div class="outerText">회원가입</div>
			</div>
			<form action="<%= request.getContextPath() %>/insert.me" method="post" id="joinForm" name="joinForm" onsubmit="return insertValidate();">
				<table>
					<tr>
						<td>
							<div>아이디</div>
							<input type="text" class="input"  name="userId" id="Id" placeholder="아이디를 입력하세요">
							<div><label id="idResult"></label></div>
						</td>
					</tr>
					<tr>
						<td>
							<div>비밀번호</div>
							<input type="password" class="input"name="userPwd" id="Pwd" placeholder="비밀번호를 입력하세요">
						</td>
					</tr>
					<tr>
						<td>
							<div>비밀번호확인</div>
							<input type="password" class="input"name="userPwd2" id="Pwd2" placeholder="비밀번호를  다시 입력하세요">
							<div><label id="pwdResult"></label></div>
						</td>
					</tr>
					<tr>
						<td>
							<div>이름</div>
							<input type="text" class="input" name="userName" id="Name" placeholder="이름를 입력하세요">
						</td>
					</tr>
					<tr>
						<td>
							<div>전화번호</div>
							<input type="tel" class="input" id="Phone" name="Phone" placeholder="Ex) 010-****-****">
						</td>
					</tr>
					<tr>
						<td>
							<div>주소</div>
							<input type="text" class="input" id="Address"  name="Address" placeholder="주소를 입력하세요">
						</td>
					</tr>
					<tr>
						<td>
							<div>이메일</div>
							<input type="email" class="input" id="Email" name="Email" placeholder="Ex)ID@naver.com">
						</td>
					</tr>
					<tr>
						<td id="buttonTd">
							<input type="reset" id="cancel" onclick="location.href='javascript:history.go(-1)'" value="취소하기">
							<input type="submit" id="signbtn" value="회원가입">
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
		 var isUsable = false; //id중복시 false, 사용가능 true
		 var isIdChecked = false; //id 중복 확인을 했는지 확인
		 $('#Id').on('change paste keyup', function(){
			 isIdChecked = false;
		 });
		 $('#Id').change(function(){
			 var userId = $('#Id');
			 
			 if(userId.val().length < 4 || userId.val().length >10){
				 alert('아이디는 최소 4자리 이상 10자리 이하여야 합니다.');
				 userId.focus();
			 }else{
				 $.ajax({
					 url: '<%= request.getContextPath() %>/checkId.me',
					 data: {userId:userId.val()},
					 success: function(data){
						 console.log(data);
						 
						 if(data == 'success'){
							 $('#idResult').text('사용 가능한 아이디입니다.');
							 $('#idResult').css({'color':'#4572C4','float':'left','display':'inline-block'});
							 isUsable = true;
							 isIdChecked = true;
						 }else{
							 $('#idResult').text('사용 불가능한 아이디입니다.');
							 $('#idResult').css({'color':'red','float':'left','display':'inline-block'});
							 userId.focus();
							 isUsable = false;
							 isIdChecked = false;
						 }
					 }
				 });
			 }
		 });
		 function insertValidate(){
			 if(isUsable && isIdChecked){
				 return true;
			 } else {
				 alert('아이디 중복확인을 해주세요');
				 return false;
			 }
		 }
			$(function(){
				 var reg = /^(?=.*?[a-z])(?=.*?[0-9]).{8,}$/;
   
				$('#Pwd2').blur(function(){
				       if($('#Pwd').val() != $('#Pwd2').val()){	
					     $('#pwdResult').text('비밀번호가 일치하지 않습니다.');
						 $('#pwdResult').css({'color':'red','float':'left','display':'inline-block'});
						 $('#Pwd2').val('');
				         $('#Pwd').focus();
				         return false;
					   }else if($('#Pwd2').val()==''){
						 $('#pwdResult').text('비밀번호를  입력해주세요.');
						 $('#pwdResult').css({'color':'red','float':'left','display':'inline-block'});  
						 $('#Pwd2').val('');
				         $('#Pwd').focus();
				         return false;
					   }else if($('#Pwd').val().search(/\s/) != -1){
						 $('#pwdResult').text('비밀번호는 공백없이 입력해주세요.');
						 $('#pwdResult').css({'color':'red','float':'left','display':'inline-block'});  
						 $('#Pwd2').val('');
					     $('#Pwd').focus();
					     return false;  
					   }else if($("#Id").val() == $("#Pwd").val()){ 
						 $('#pwdResult').text('아이디와 비밀번호가 같습니다.');
						 $('#pwdResult').css({'color':'red','float':'left','display':'inline-block'});  
						 $('#Pwd1').val('');
						 $('#Pwd1').focus();
						 return false; 
					   /* }else if($("#Pwd").val().length < 8 || $("#Pwd").val().length > 20){
						 $('#pwdResult').text('비밀번호는 8자리 ~ 20자리로 입력해주세요 ');
					     $('#pwdResult').css({'color':'red','float':'left','display':'inline-block'});  
						 $('#Pwd1').val('');
						 $('#Pwd1').focus();
						 return false; */
					   }else if(false === reg.test($('#Pwd').val())){
						 $('#pwdResult').text('비밀번호는 8자 이상 숫자/소문자를 포함해야합니다. ');
						 $('#pwdResult').css({'color':'red','float':'left','display':'inline-block'});  
						 $('#Pwd1').val('');
						 $('#Pwd1').focus();
						 return false; 
					   }else{  
						 $('#pwdResult').text('사용 가능한 비밀번호입니다');
					     $('#pwdResult').css({'color':'#4572C4','float':'left','display':'inline-block'});  
						 return true;
					   }	  
				});
			
		
		});
			

			
			
    	  
	</script>

	
</body>
</html>