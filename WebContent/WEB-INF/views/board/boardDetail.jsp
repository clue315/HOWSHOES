<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.model.vo.*, java.util.ArrayList"%>

<%
	Board b = (Board)request.getAttribute("board");
    ArrayList<Reply> list = (ArrayList)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
/* section */
	/* 섹션 크기 */
	#section {
		margin-top: 60px;
		margin-bottom: 100px;
		margin-left: auto;
		margin-right: auto;
		height: auto;
		width: 800px;
	}
	/* 바깥div 크기 및 테두리 */
	.outer {
		margin-left: auto;
		margin-right: auto;
		
		height: auto;
		width: 800px;
		border: 3px solid black;
	}
	/* 바깥div 타이틀 */
	.outerBg {
		margin-left: auto; margin-right: auto;
		background-image: url("Image/title_bg.png");
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
	/* 테이블 사이즈 및 행 간격 */
 	.detailArea {
		margin-top: 20px;
		margin-left: 100px;
		margin-right: 100px;
		
	}
	#tableArea {
		width: 100%;
	}
	#title {
		margin-top: 20px;
		font-weight: bold;
		font-size: 30px;
	}
	#writer {
		text-align: right;
	}
	#QnAcategory{
		text-align: right;
	}
	#date {
		text-align: right;
		border-bottom: 1px solid black;
	}
	#content {
		width: 600px;
		height: 350px;
		resize: none;
		border: none;
		outline: none;
		font-family: "맑은 고딕";
		font-size:20px;
		click: none;
	}
	#replySelectArea{
		margin:20px auto 50px auto;
	}
	#replySelectTable{
		margin:0 auto;
	}
	.replyArea{
	border-top:1px solid lightgray;
	}
	 
	#btnDiv{
	margin:auto;
	width:auto;
	height:50px;	
	}
	/* 삭제버튼 */
	#deleteBoBtn {
		
		border: 0;
		outline: 0;
		font-size: 16px;
		font-weight: bold;
		width: 50px;
		height: 30px;
		background: white;
		border: 3px solid black;
		float: right;
		margin-top:10px;
		margin-right: 3px;
	}
	#deleteBoBtn:hover {
		border: 3px solid #4572C4;
		color: #4572C4;
		cursor: pointer;
	}
	/* 댓글 삭제버튼  */
	#ReplyDelete{
		border: 0;
		outline: 0;
		font-size: 16px;
		font-weight: bold;
		width: 50px;
		height: 30px;
		background: white;
		border: 1px solid black;
		float: right;
	}
	
	#ReplyDelete:hover {
		color: #4572C4;
		cursor: pointer;
	
	}
	/* 목록버튼 */
	#listBtn {
		
		border: 0;
		outline: 0;
		font-size: 16px;
		font-weight: bold;
		width: 50px;
		height: 30px;
		background: black;
		color: white;
		float: right;
		margin-top:10px;
		
	}
	#listBtn:hover {
		background: #4572C4;
		cursor: pointer;
	}
	
	/* 수정버튼 */
	#updateBoBtn {
		border: 0;
		outline: 0;
		font-size: 16px;
		font-weight: bold;
		width: 50px;
		height: 30px;
		background: white;
		border: 3px solid black;
		float: right;
		margin-top:10px;
		margin-right: 3px;
	}
	#updateBoBtn:hover {
		border: 3px solid #4572C4;
		color: #4572C4;
		cursor: pointer;
	}
	/* 리플 테이블 */
	#replyTable{
		margin:0 auto; 
		margin-top:20px;
	}
	/* 댓글 버튼  */
	#addReply{
		border: 0;
		outline: 0;
		font-size: 16px;
		font-weight: bold;
		width: 90px;
		height: 30px;
		background: white;
		border: 1px solid black;
		float: right;
	}
	
	#addReply:hover {
		color: #4572C4;
		cursor: pointer;
	}
/* footer */	
	#footer {
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
		<div class="outer">
			<div class="outerBg">
				<div class="outerText">Q&A</div>
			</div>
			<div class="detailArea">
				<form action="boardUpdateForm.bo" id="detailForm" name="detailForm" method="post">
					<table id="tableArea">
						<tr>
							<td id="title">
								<input type="hidden" name="bId" value="<%= b.getbNo() %>"> 
								<%= b.getbTitle() %>
							</td>				
						</tr>
						<tr>
							<td id="QnAcategory">
								<strong>분류</strong> <%= b.getQcName() %> 
							</td>
						</tr>
						<tr>
							<td id="writer">
								<strong>작성자</strong> <%= b.getbWriter() %> 
							</td>
						</tr>
						<tr>
							<td id="date"><%= b.getCreateDate() %></td>
						</tr>
						<tr>
							<td>
								<textarea id="content" name="content" cols="60" rows="15" readonly><%= b.getbContent() %></textarea>
							</td>
						</tr>
					</table>
					<div id="btnDiv" align="center">
					<input type="button" onclick="location.href='list.bo'" id="listBtn" value="목록">
						<% if(loginUser.getM_Id().equals(b.getbWriter())) { %>
					<input type="submit" id="updateBoBtn" value="수정">
					<input type="button" onclick="deleteBoard();" id="deleteBoBtn" value="삭제">
					<% } %>
					
			</div>
				</form>
			</div>
		<div class ="replyArea">
			<div class="replyWriterArea">
				<table id="replyTable">
					<tr><td><strong>댓글작성</strong></td></tr>
					<tr>
						<td><textarea rows="3" cols="80" id="replyContent" style="resize:none;"></textarea></td>
						<td><button id="addReply">댓글 등록</button></td>
					</tr>
				</table>
			</div>
			<div id="replySelectArea">
				<table id="replySelectTable">
					<tr>
						<th width="100px">작성자</th>
						<th width="400px">내용</th>
						<th width="155px">작성일</th>	
					</tr>
					<% if(list.isEmpty()){ %>
					<tr><td colspan="3" style="padding-left:20px; text-align:center;">댓글이 없습니다.</td></tr>
				<% } else { %>
					<% for(int i = 0; i < list.size(); i++) {%>
					<tr>
						<td style="text-align:center;"><%= list.get(i).getReplyWriter() %></td>
						<td style="text-align:center;"><%= list.get(i).getReplyContent() %></td>
						<td style="text-align:center;"><%= list.get(i).getCreateDate() %></td>
					<% if(loginUser != null && loginUser.getM_Id().equals(list.get(i).getReplyWriter())){ %>
						<td><button id="ReplyDelete" value="<%= list.get(i).getReplyId() %>">삭제</button></td>
					<% } %>
					</tr>
						<%} %>
					<%} %>
					
					
				</table>
			</div>
		</div>
		</div>
			
	</div>
	<div id="footer">
		<hr id="footer_hr">
		<h4 class="footer_text" id="line1">고객센터 : 1588-0000  |  이메일 : amg@howshoes.com  |  운영시간 : 월~금 / 09:00~18:00 / 주말, 공휴일 휴무</h4>
		<h4 class="footer_text" id="line2">(주)안녕하슈  |  대표이사 : 강건강  |  주소 : 서울특별시 강남구 역삼동 남도빌딩 3층</h4>
		<h4 class="footer_text" id="line3">사업자등록번호 : 201-81-12345  |  개인정보보호 책임자 : 남나눔</h4>
	</div>
	<script>
		function deleteBoard() {
			var bool = confirm("게시글을  삭제하시겠습니까?");
			if(bool) {
				location.href="<%= request.getContextPath() %>/deleteBoard.bo?bId=" + <%= b.getbNo() %>;
			}
		}
		
		$('#ReplyDelete').click(function(){
			var bool = confirm("댓글 내용을 삭제하시겠습니까?");      
			var rId =  $(this).parent().children().eq(0).val();
			var bId = <%= b.getbNo() %>;
            if(bool) {
            	$.ajax({
    				url: 'deleteReply.bo',
    				data: {rId:rId, bId:bId},
    				success: function(data){
    					console.log(data);
    					
    					$replyTable = $('#replySelectTable');
    					$replyTable.html('');
    					
    					for(var key in data){
    						var $tr = $('<tr>');
    						var $writerTd = $('<td>').text(data[key].replyWriter).css('width','100px;');
    						var $contentTd = $('<td>').text(data[key].replyContent).css('width','400px;');
    						var $dateTd = $('<td>').text(data[key].replyDate).css('width','200px;');
    				
    						$tr.append($writerTd);
    						$tr.append($contentTd);
    						$tr.append($dateTd);
    						$replyTable.append($tr);
    					}
    					$('#replyContent').val('');
    					location.reload();
    				}
    			});
			}
		 });
		
		$('#addReply').click(function(){
			var writer = '<%= loginUser.getM_Id() %>';
			var bId = <%= b.getbNo() %>;
			var content = $('#replyContent').val();
			
			$.ajax({
				url: 'insertReply.bo',
				data: {writer:writer, bId:bId, content:content},
				success: function(data){
					console.log(data);
					
					$replyTable = $('#replySelectTable');
					$replyTable.html('');
					
					for(var key in data){
						var $tr = $('<tr>');
						var $writerTd = $('<td>').text(data[key].replyWriter);
						var $contentTd = $('<td>').text(data[key].replyContent);
						var $dateTd = $('<td>').text(data[key].replyDate);
				
						$tr.append($writerTd);
						$tr.append($contentTd);
						$tr.append($dateTd);
						$replyTable.append($tr);
					}
					$('#replyContent').val('');
					location.reload();
				}
			});
		});
	</script>
</body>
</html>