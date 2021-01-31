<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="review.model.vo.Review" %>
<% Review review = (Review)request.getAttribute("review"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.outer{
		width: 800px; height: 500px; background: rgba(111, 111, 111, 0.4); border: 5px solid black;
		margin-left: auto; margin-right: auto; margin-top: 50px;
	}
	.tableArea {width:500px; height:350px; margin-left:auto; margin-right:auto;}
	#updateBtn, #cancelBtn{background: #B2CCFF; border-radius: 10px; color: white; width: 80px; height: 25px; display: inline-block;}
	#updateBtn:hover, #cancelBtn:hover{cursor: pointer;}
	#cancelBtn{background: #D1B2FF;}
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
		
	<div class="outer">
		<br>
		<h2 align="center">게시판 수정</h2>
		<div class="tableArea">
			<form action="<%= request.getContextPath() %>/update.re" method="post">
				<table>
					<tr>
						<th>별점<input type="hidden" name="rId" value="<%= review.getR_no() %>"></th>
						<td colspan="3"><input type="text" size="58" name="score" value="<%= review.getR_score() %>"></td>
					</tr>
					<tr>
						<th>내용</th>
						<td colspan="3">
							<textarea rows="15" cols="60" name="content" style="resize:none;"><%= review.getR_content() %></textarea>
						</td>
					</tr>
				</table>
				<br>
				<div align="center">
					<button type="submit" id="updateBtn">수정</button>
					<div id="cancelBtn" onclick="location.href='<%= request.getContextPath() %>/list.re'">취소</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>