<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member, foot.model.vo.Foot"%>
 <%
	Member myInfo = (Member)request.getAttribute("myInfo");
 	Foot foot = (Foot)request.getAttribute("footInfo");
 %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보 수정</title>
<script src="../js/jquery-3.5.1.min.js"></script>
<style>
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
	#btn {
		border: none;
		outline: none;
		background: black;
		color: white;
		font-weight: bold;
		font-size: 20px;
		width: 185px;
		height: 50px;
	}
	#btn:hover{
		background:#4572C4;
		cursor:pointer;
	}
	.input{
		border: 1px solid black;
		outline: none;
		width: 377px;
		height: 50px;
		font-size: 16px;
	}
	#addressBtn{
		float: right;
		border: none;
		outline: none;
		background: black;
		color: white;
		width: 100px;
		height: 28px;
		font-weight: bold;
	}
	#buttonTd{
		height: 120px;
	}
	#updateBtn{
		width:185px;
		height: 62px;
		color: white;
		font-size:20px;
		font-weight:bold;
		background: black;
		border: none;
		outline: none;
	}
	#updateBtn:hover{
		background:#4572C4;
		cursor:pointer;
	}
	#cancelBtn{
		width:185px;
		height: 62px;
		color: black;
		font-size:20px;
		font-weight:bold;
		background: white;	
		border:3px solid black;
		outline: none;
	}
	#cancelBtn:hover{
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
	#pwdResult1{
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
	<%@ include file="../common/menubar.jsp" %>
	<div id="section">
		<div class="outer">
			<div class="outerBg">
				<div class="outerText">회원 정보 관리</div>
			</div>
			<form action="<%= request.getContextPath() %>/update.me" method="post" id="updateForm" name="updateForm">
				<table id="fta" class="infotable">
					<tr>
						<td>
							<input type="button" id="btn" onclick="fCheck();" value="발 측정 방법 확인">
							<% if(foot == null) {%>
							<input type="button" id="btn" onclick="finsert();" value="발 정보 입력">
							<% }else{ %>
							<input type="button" id="btn" onclick="fupdate();" value="발 정보 수정">
							<%} %>
						</td>
					<tr>
						<td>
							<div>아이디</div>
							<input type="text" class="input" name="myId" style="background:lightgray;" readonly value="<%= myInfo.getM_Id() %>">
						</td>
					</tr>
					<tr>
						<td>
							<div>이름</div>
							<input type="text"class="input"  name="myName" style="background:lightgray;" required readonly value="<%= myInfo.getM_Name()%>">
						</td>
					</tr>
					<tr>
						<td>
							<div>기존 비밀번호</div>
							<input type="password" class="input" id="Pwd" name="Pwd" placeholder="기존 비밀번호를 입력하세요">
							<div><label id="pwdResult1"></label></div>
						</td>
					</tr>
					<tr>
						<td>
							<div>신규 비밀번호</div>
							<input type="password" class="input" id="newPwd" name="newPwd" placeholder="새 비밀번호를 입력하세요">
						</td>
					</tr>
					<tr>
						<td>
							<div>신규 비밀번호 확인</div>
							<input type="password" class="input" id="newPwd2" name="newPwd2" placeholder="새 비밀번호를 입력하세요">
							<div><label id="pwdResult"></label></div>
						</td>
					</tr>
					<tr>
						<td>
							<div>이메일</div>
							<input type="email" name="myEmail" class="input"  value="<%= myInfo.getEmail() == null ? "" : myInfo.getEmail() %>">
						</td>
					</tr>
					<tr>
						<td>
							<div>전화번호</div>
							<input type="tel" maxlength="11" name="myPhone" class="input" placeholder="(-없이)01012345678"value="<%= myInfo.getPhone() == null ? "" : myInfo.getPhone() %>">
						</td>
					</tr>
					<tr>
						<td>
							<div>주소<input type="button" id="addressBtn" onclick="address();" value="배송지 관리"></div>
							<input type="text" name="myAddress" class="input" value="<%= myInfo.getAddress() == null ? "" : myInfo.getAddress() %>">
						</td>
					</tr>
					<tr>
						<td id="buttonTd">
							<input type="reset" id="cancelBtn" onclick="location.href='javascript:history.go(-1)'" value="취소하기">
							<input type="submit" id="updateBtn" value="수정하기">
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
	
	
		function finsert(){
			location.href='<%= request.getContextPath() %>/fInsert.fo';
		}
		function fupdate(){
			location.href='<%= request.getContextPath() %>/updateform.fo';
		}
		function fCheck(){
			location.href='<%= request.getContextPath() %>/footCheckLink.no';
		}
		function address(){
			location.href="<%= request.getContextPath() %>/addressList.ad";
		}
		
		function deleteMember(){
			// 정말 삭제할거냐고 물어본 후, 삭제하겠다고 하면 delete.me로 요청
			var bool = confirm("정말 삭제하시겠습니까?");
			if(bool){
				location.href='delete.me';
			}
		}
		
	
		
	    $(function(){
			$('#Pwd').blur(function(){
				 if($('#Pwd').val() != "<%= myInfo.getM_Pwd() %>"){
					 $('#pwdResult1').text('현재 비밀번호를 정확히 입력해주세요.');
					 $('#pwdResult1').css({'color':'red','float':'left','display':'inline-block'});  
					 $('#Pwd').val('');
				     $('#Pwd').focus();
				     return false;
				}else if($('#Pwd').val()==''){
					 $('#pwdResult1').text('기존 비밀번호를  입력해주세요.');
					 $('#pwdResult1').css({'color':'red','float':'left','display':'inline-block'});  
					 $('#Pwd').val('');
			         $('#Pwd').focus();
			         return false;
				}else{  
					 $('#pwdResult1').text('확인 되었습니다');
				     $('#pwdResult1').css({'color':'#4572C4','float':'left','display':'inline-block'});  
	
					 return true;
				}	  
			});
	     });
		
		$(function(){
			 var reg = /^(?=.*?[a-z])(?=.*?[0-9]).{8,}$/;

			$('#newPwd2').blur(function(){
			       if($('#newPwd').val() != $('#newPwd2').val()){	
				     $('#pwdResult').text('비밀번호가 일치하지 않습니다.');
					 $('#pwdResult').css({'color':'red','float':'left','display':'inline-block'});
					 $('#newPwd2').val('');
			         $('#newPwd').focus();
			         return false;
				   }else if($('#newPwd2').val()==''){
					 $('#pwdResult').text('비밀번호를  입력해주세요.');
					 $('#pwdResult').css({'color':'red','float':'left','display':'inline-block'});  
					 $('#newPwd2').val('');
			         $('#newPwd').focus();
			         return false;
				   }else if($('#newPwd').val().search(/\s/) != -1){
					 $('#pwdResult').text('비밀번호는 공백없이 입력해주세요.');
					 $('#pwdResult').css({'color':'red','float':'left','display':'inline-block'});  
					 $('#newPwd').val('');
					 $('#newPwd2').val('');
				     $('#newPwd').focus();
				     return false;  
				  }else if($("#newPwd").val().length < 8 || $("#newPwd").val().length > 20){
					 $('#pwdResult').text('비밀번호는 8자리 ~ 20자리로 입력해주세요 ');
				     $('#pwdResult').css({'color':'red','float':'left','display':'inline-block'});  
					 $('#Pwd1').val('');
					 $('#Pwd1').focus();
					 return false; 
				   }else if(false === reg.test($('#newPwd').val())){
					 $('#pwdResult').text('비밀번호는 8자 이상 숫자/소문자를 포함해야합니다. ');
					 $('#pwdResult').css({'color':'red','float':'left','display':'inline-block'});  
					 $('#newPwd').val('');
					 $('#newPwd').focus();
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