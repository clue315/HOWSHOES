<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, review.model.vo.Review "%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 작성</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.5.1.min.js"></script>
<style>
	body {
		overflow-y: hidden;
		overflow-x: hidden;
		resize: none;
	}

	#section {
		width: 360px;
		min-height: 700px;
	}
	
	#productImageArea {
		width: 360px;
		height: 270px;
		text-align: center;
		display: table-cell;
		vertical-align: middle;
		background-image: url("images/click.png");
	}
	#productImageArea:hover {
		cursor: pointer;
	}
	
	#content {
		border: 1px solid #C0C0C0;
		width: 354px;
		height: 200px;
		outline: none;
	}
	
	#tableArea {
		/* margin-left: auto;
		margin-right: auto; */
	}
	table {
		border-collapse: collapse;
	}
	th {
		font-family: "Typo_SsangmunDong";
		font-size: 25px;
	}
	tr {
		text-align: center;
	}
	.starArea {
		margin-top: -15px;
		margin-bottom: -2px;
		text-align: center;
		direction: rtl;
		unicode-bidi: bidi-override;
	}
	input[type="radio"] {
		display: none;
	}
	label {
		color: lightgrey;
		font-size: 36px;
	}
	label:hover, label:hover ~ label {
		color: #D1141B;
	}
	input[type="radio"]:checked ~ label {
		color: #D1141B;
	}

	#insertBtn {
		border: 0;
		outline: 0;
		font-size: 16px;
		font-weight: bold;
		width: 177px;
		height: 30px;
		background: black;
		color: white;
	}
	#insertBtn:hover {
		color: #4572C4;
		cursor: pointer;
	}
	#cancelBtn {
		border: 0;
		outline: 0;
		font-size: 16px;
		font-weight: bold;
		width: 177px;
		height: 30px;
		background: white;
		border: 3px solid black;
	}
	#cancelBtn:hover {
		color: #4572C4;
		cursor: pointer;
	}
</style>
</head>
<body>
	<div id="section">
		<form action="<%=request.getContextPath()%>/insertImage.re" method="post" encType="multipart/form-data" onsubmit="check();">
			<input type="hidden" value="" name="no" id="pNo">
			<input type="hidden" value="" name="no2" id="oNo">
			<table id="tableArea">
				<tr>
					<th>상품은 만족하셨나요?</th>
				</tr>
				<tr>
					
					<td>
						<p class="starArea">
							<input id="radio1" type="radio" name="score" value="5">
							<label for="radio1">&#9733;</label>
							<input id="radio2" type="radio" name="score" value="4">
							<label for="radio2">&#9733;</label>
							<input id="radio3" type="radio" name="score" value="3">
							<label for="radio3">&#9733;</label>
							<input id="radio4" type="radio" name="score" value="2">
							<label for="radio4">&#9733;</label>
							<input id="radio5" type="radio" name="score" value="1" checked="checked">
							<label for="radio5">&#9733;</label>
						</p>
						<br>
					</td>
				</tr>
				<tr>
					<th>사진을 등록해주세요.</th>
				</tr>
				<tr>
					<td>
						<div id="productImageArea">
							<img id="productImage" width="360px" height="270px">
						</div>
						<br>
					</td>
				</tr>
				<tr>
					<th>후기를 작성해주세요.</th>
				</tr>
				<tr>
					<td id="contentArea">
						<textarea id="content" name="content" style="resize: none;"></textarea>
					</td>
				</tr>
				<tr>
					<td class="btnArea">
						<br>
						<%-- <input type="hidden" value="<%= r.getR_no() %>"> --%>
						<input type="button" id="cancelBtn" value="취소">
						<input type="submit" id="insertBtn" value="작성완료">
					</td>
				</tr>
			</table>

			<!-- 파일 업로드 하는 부분 -->
			<div id="fileArea">
				<input type="file" id="uploadImage" multiple="multiple"
					name="uploadImage" onchange="LoadImg(this,1)">
			</div>
			<script>
				function check(){
					$('#pNo').val(opener.document.getElementById('ad').value);
					$('#oNo').val(opener.document.getElementById('ad2').value);
				};
				
				// 내용 작성 부분의 공간을 클릭할 때 파일 첨부 창이 뜨도록 설정하는 함수
				$(function() {
					$("#fileArea").hide();

					$("#productImageArea").click(function() {
						$("#uploadImage").click();
					});
				});

				// 각각의 영역에 파일을 첨부 했을 경우 미리 보기가 가능하도록 하는 함수
				function LoadImg(value, num) {
					if (value.files && value.files[0]) {
						var reader = new FileReader();
						reader.onload = function(e) {
							$("#productImage").attr("src", e.target.result);
						}
					}
					reader.readAsDataURL(value.files[0]);
				}
			</script>
		</form>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#cancelBtn").click(function() {
				window.close();
			});
		});
	</script>
</body>
</html>