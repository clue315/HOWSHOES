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
		width:800px; height:500px; background: rgba(111, 111, 111, 0.4); border: 5px solid black;
		margin-left:auto; margin-right:auto; margin-top:50px;
	}
	.tableArea {width: 450px; height:350px; margin-left:auto; margin-right:auto; align: center;}
	table{align: center;}
	#updateBtn{background: #B2CCFF;}
	#menuBtn{background: #D1B2FF;}
	#deleteBtn{background: #D5D5D5;}
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
		
	<div class="outer">
		<br>
		<h2 align="center">게시판 상세보기</h2>
		<div class="tableArea">
			<form action="<%= request.getContextPath() %>/reviewUpdateForm.re" id="detailForm" method="post">
				<table>
					<tr>
						<th>작성일</th>
						<td>
							<input type="hidden" name="rId" value="<%= review.getR_no() %>">
							<%= review.getR_date() %>
						</td>
						<th>작성자</th>
						<td><%= review.getR_writer() %></td>
						<th>별점</th>
						<td><%= review.getR_score() %></td>
						<th>조회수</th>
						<td><%= review.getR_count() %></td>
					</tr>
					<tr>
						<th>내용</th>
					</tr>
					<tr>
						<td colspan="6">
							<textarea cols="60" rows="15" style="resize:none;" readonly><%= review.getR_content() %></textarea>
						</td>
					</tr>
				</table>
				
				<div align="center">
					<% if(loginUser.getM_Id().equals(review.getR_writer())) { %>
					<input type="submit" id="updateBtn" value="수정">
					<input type="button" onclick="deleteReview();" id="deleteBtn" value="삭제">
					<% } %>
					<input type="button" onclick="location.href='<%= request.getContextPath() %>/list.re'" id="menuBtn" value="메뉴로">
				</div>
			</form>
		</div>
	</div>
	
	<script>
		function deleteReview() {
			var bool = confirm('정말 삭제하시겠습니까?');
			
			if(bool) {
				location.href='deleteReview.re?rId=<%= review.getR_no() %>';
			}
		}
	</script>
</body>
</html>