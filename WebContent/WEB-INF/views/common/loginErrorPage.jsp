<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login_fail</title>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet"> 
<style>
/* ================ 상단 메뉴바 ================== */
   #highMenu_1 ul{
   	  height: 5px;
   	  width: 900px;
   	  list-style-type: none;
   }
   
   #highMenu_1 li{
   	 	color: black;
		background-color: white;
		float: left;
		line-height: 20px;
		vertical-align: middle;  
		text-align: center;
		display: block; /* 점 제거  */
   }
   
   #highMenu_2 ul{
   	    height: 5px;
   	    width: 900px;
   	    list-style-type: none;
   }
   
   #highMenu_2 li{
   	 	color: black;
		background-color: white;
		float: right;
		line-height: 20px;
		vertical-align: middle;  
		text-align: center;
		display: block; /* 점 제거  */
   }
   
   .hMenuLink { /* 상위 메뉴  a 태그에 공통으로 설정할 스타일 */
		text-decoration: none;
		text-align: center;
		display: block;
		width: 60px;
		font-family: 'Do Hyeon', sans-serif;
		font-size: 14px;
		font-weight: lighter;
		
	}  
		
   #mainlogo{ /* 안녕하슈 로고 */
	    margin:5px;
	    padding: 5px;
   }
   
/* ================= 메인 메뉴바 =====================  */	
   #background{
   		width: 1750px;
   		height: 40px;
   }
   
    #topMenu ul { /* 메인 메뉴 안의 ul을 설정함: 상위메뉴의 ul*/
		list-style-type: none;
		height: 20px;
		width: 1800px; 
	    position: relative;
	    margin-top: -42px;
	    margin-left: 340px;
		
	}  
	
	#topMenu  li { /* 메인 메뉴 안에 ul 태그 안에 있는 li 태그의 스타일 적용 */
		color: white;
		background-color: rgb(0,0,0);
		float: left;
		line-height: 35px;
		vertical-align: middle;  
		text-align: center;
		
	} 
	
	.menuLink, .menuLinkred { /* 상위 메뉴  a 태그에 공통으로 설정할 스타일 */
		text-decoration: none;
		text-align: center;
		display: block;
		width: 80px;
		font-size: 17px;
		font-weight: lighter;
		font-family: 'Do Hyeon', sans-serif;
		margin-left: 40px;
		
	} 
	
	.menuLinkred{
		color: red;
	}
	.menuLink { /* 상위 메뉴의 글씨색을 흰색으로 설정 */
		color: white;
	}
	
	.topMenuLi:hover .menuLink { /* 상위 메뉴의 li에 마우스오버 되었을 때 스타일 설정 */
		color: rgb(69, 114, 196);
	}
	
    .longLink { /* 좀 더 긴 메뉴 스타일 설정 */
		left:0px; 
		bottom:0px; 
		height:70px; 
		width:100%;
	}   
	
	#sl{
		margin-top: 90px;
		margin-left: 90px;
		color: lightgray;
	}
	
	#login{
		margin-top: 20px;
		margin-left: 86px;
		font-size: 35px;
 	}
 	
 	#title{
 		margin-top: 50px;
 		margin-left: 740px;
 		font-size: 43px;
 	}

	#hr{
 		margin-top: 90px;
 		margin-left: 40px;
 		width: 1650px;
	}
	
	#id_1{
		margin-top: 70px;
		margin-left: 630px;
		font-size: 20px;
	}
	
	#id_2{
		margin-top: -20px;
		margin-left: 630px;
		font-size: 20px;
		height: 40px;
		width: 450px;
	}
	
	#pwd_1{
		margin-top: 30px;
		margin-left: 630px;
		font-size: 20px;
	}
	
	#pwd_2{
		margin-top: -20px;
		margin-left: 630px;
		font-size: 20px;
		height: 40px;
		width: 450px;
	}
	
	input::placeholder {
	  	color: rgb(69, 114, 196);
	}
	
	#loginBtn{
		margin-top: 25px;
		margin-left: 630px;
		font-size: 25px;
		height: 50px;
		width: 458px;
		background-color:  black;
	  	color: white;
		
	}
	
	#find_id{
		margin-top: 19px;
		margin-left: 700px;
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
	#find_pwd{
		margin-top: -40px;
	}

</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>

	<h5 id="sl">STORE > LOGIN</h5>
	
	<h3 id="login">LOGIN</h3>
	
	<h1 id="title">회원 로그인</h1>
	
	<hr id="hr">
	
	<h4 id="id_1">아이디</h4>
	<input type="text" name="userId" size="30" maxlength="15" placeholder="아이디를 입력해주세요" id="id_2">
	
	<h4 id="pwd_1">비밀번호</h4>
	<input type="password" name="userPwd" placeholder="비밀번호를 입력해주세요" id="pwd_2"> 
	
	<input type="button" value="로그인" id="loginBtn">
	
	<button id="find_id">아아디 찾기</button>
	<h4 id="line">|</h4>
	<button id="find_pwd">비밀번호 찾기</button>
	<!--  <h3 id="join_1">아직 안녕하슈의 회원이 아니신가요? </h3>
	<button id="join_2">회원가입</button> -->
   	<script>
		window.alert('로그인 실패하였습니다.');
	</script>
</body>
</html>