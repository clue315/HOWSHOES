<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<style>
	/* 폼 속성 */
	input[type="text"], input[type="password"] {
		width:300px;
		height: auto; /* 높이 초기화 */
		line-height: normal; /* line-height 초기화 */
		padding: .8em .5em; /* 여백 설정 */
	 }
	input[type="submit"] {
		background:black; 
		color:white; 
		padding: 10px; 
		font-weight: bold;
	    font-size: 15px; 
		margin:20px auto;							
	}
	input[type="reset"] {
		background:white; 
		color:black; 
		padding: 10px; 
		font-weight: bold;
	    font-size: 15px; 
		margin:20px auto;							
	}
	input::placeholder {
	  color: #4472C4;
	}
	/* 태그 속성  */
	*{padding:0; margrin:0;}
	ul > li{list-decoration:none;  font-weight:bold; font-size:15px; display:inline-block; padding: 0 10px;}
	ul{text-align:center;}
	html, body {height: 100%;}
	small, sub{color:#AFA8A8;}
	table{border:1px solid #DEDEDE; border-collapse: collapse; table-layout:fixed; width:100%; margin: auto; }
	
	
	/*중앙 */
	article{margin:10px auto;  box-sizing:border-box;}
	main{box-sizing:border-box; margin:auto;}
	footer{height:100px;  margin:auto; clear:both; text-align:center; }
	section{margin:0 auto 20px auto; box-sizing:border-box; padding:0 100px;}
	
	
	/*header 영역  */
	#header{position:relative; width:auto; min-height:200px; margin:0 auto;}
	.subMenu{position:relative; display:inline-block;}
	#logoDiv{position:absolute; left:50%; transform:translate(-50%, 50%);}
	#Logo{width:349px; height:116px;margin:0 auto;}
	
	/*서브 메뉴 -(로그인, 공지 ,이벤트 등..) */
	#sub2{float:right;}
	#sub{float:left;}
	
	
	/*중앙 컨텐츠 */
	#category{position:relative; background-image: url('image/trapezoid.png');  background-size:cover; width:auto; font-weight:bold;  }
	#category-list {color:white; margin:0 auto;}
	

	/* 발 정보 입력 */
	#link-location{margin:30px auto 0 auto;}
	#footInfo{left:50%; transform:translate(-50%, -50%); display:inline-block; position:relative; text-align:center;}
	#check_Image{position:relative; margin:0 auto; width:1000px;}
	#footCheck-Info{position:relative; width:100%; min-height:500px; border-top: 5px solid black;}
	#info-btn{display:block; margin:auto; background:black; color:white; padding: 10px; font-weight: bold; font-size: 15px;  }
	
	#footCheckImg{ margin-top: 60px; margin-left: -70px;}
	
	#footmp4{ margin-top: 90px; margin-left: 50px; border-top: 2px solid black; }
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
   
   <form>
		<main>
		<section> 
		<article>
		
			<div id="link-location">
				<small>STORE > FOOT</small>
				<h2 style="margin:10px auto;">Foot</h2>
			</div>
			<div id="footInfo"> 
				<h2 style="margin:0 autuo;">발 측정 방법</h2>
			</div>
			<div id="footCheck-Info">
				<div id="check_Image"> 
					 <video id="footmp4" src="images/foot_video.mp4" style="width:950px; height:540px" controls></video><br><br>
					 <h4><center>발 측정 촬영 방법입니다</center></h4>
					<img  src="images/footCheckImage.png" style="width:1100px; height:500px" id="footCheckImg">
						<center><h6>※자세한 측정 방법은 슈픽사이트를 참고하세요.</h6></center>
				</div>
			</div>

	</article>
	</section>
	</main>
	</form>
	<footer>
		<p>
			<strong>통합고객센터</strong> 080-000-0000 &nbsp; 1588-0000 &nbsp; 월 ~ 금  &nbsp; 09:00 ~ 18:00(주말, 공휴일 휴무)<br>
			<small> (주)안녕하슈  &nbsp; |  &nbsp; 대표이사: 아무개  &nbsp;| &nbsp;주소 : 서울특별시 강남구 역삼동 <br>
			사업자 등록번호 : 201-81-12341  &nbsp;|&nbsp; 개인정보보호 책임자 : 아무개  &nbsp;|&nbsp;이메일 : amg@helloshoeskorea.com</small>	
	 	</p>
	</footer>
			
</body>
</html>