<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 작성</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.5.1.min.js"></script>
<style>
	section {
	}
	#text {
		margin-top: 287px;
		height: 70px;
		font-family: "Typo_SsangmunDong";
		font-size: 25px;
		text-align: center;
	}
	#closeBtn {
		border: 0;
		outline: 0;
		font-size: 16px;
		font-weight: bold;
		width: 360px;
		height: 30px;
		background: black;
		color: white;
	}
	#closeBtn:hover {
		color: #4572C4;
		cursor: pointer;
	}
</style>
</head>
<body>
	<div id="section">
		<div id="text">
			리뷰 작성이 완료되었습니다.
			<br>
			감사합니다.
		</div>
		<br>
		<input type="button" id="closeBtn" value="닫기">
	</div>
	
	<script type="text/javascript">
		$(document).ready(function() {
			$("#closeBtn").click(function() {
				opener.window.location.reload();
				window.close();
			});
		});
	</script>
</body>
</html>