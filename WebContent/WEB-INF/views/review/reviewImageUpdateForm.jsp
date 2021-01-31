<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, review.model.vo.*, member.model.vo.Member" %>
<%
   Review r_score = (Review)request.getAttribute("r_score");
   Review r = (Review)request.getAttribute("review");
   ArrayList<ReviewImage> fileList = (ArrayList<ReviewImage>)request.getAttribute("fileList");
   ReviewImage reviewImage = fileList.get(0);
   Member member = (Member)request.getAttribute("member");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 작성</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.5.1.min.js"></script>
<style>
   #section{
      margin-left: auto;
      margin-right: auto;
      width: 900px;
      min-height: 430px;
   }
   .outer{
      border: 3px solid black;
      width: 674px;
      margin-left: 220px;
      margin-top: -326px;
      min-height: 354px;
   }
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
   /* 사이드메뉴 */
   #subBlue{
      text-align: center;
      color: white;
       width: 190px; 
       height: 200px; 
       background: #4572C4;
   }
   ul {
      margin-top: 0px;
   }
   #subMenuDiv{
      text-align: center;
   }
   .submenuLink { /* 상위 메뉴  a 태그에 공통으로 설정할 스타일 */
      text-decoration: none;
      margin-left: 45px;
      display: block;
      width: 100px;
      font-size: 15px;
      font-weight: bold;
      
   }  
   .subMenuLi { /* 상위 메뉴와 하위 메뉴의 a 태그에 공통으로 설정할 스타일 */
      display: block;
      text-align: center;
      width: 100px;
       margin-top:  10px;
      font-size: 15px;
      font-weight: bold;
      
   } 
   .subMenuLi:hover .submenuLink{ /* 상위 메뉴의 li에 마우스오버 되었을 때 스타일 설정 */
      color: #4572C4;
   }

   .row_1{
      width: 186px;
      border: 1px solid lightgray;
   }
   .submenuLink { /* 상위 메뉴의 글씨색을 흰색으로 설정 */
      color: black;
   }   
   #userUpadteBtn{ background:white; color:black; padding: 10px; font-weight: bold; font-size: 15px;  outline: none; border: none;}
   #userUpadteBtn:hover{background:black; color:white;}
   
   /* 리뷰 테이블 */
   table{
      margin-left: auto;
      margin-right: auto;
      table-layout: fixed;
      word-break: break-all;
      margin-top: 20px;
      margin-bottom: 20px;
      width: 650px;
      text-align: center;
      border-collapse: collapse;
   }
   th {
      font-family: "Typo_SsangmunDong";
      font-size: 25px;
   }
   tr {
      text-align: center;
   }
   #starTd {
      height: 50px;
   }
   #starDiv {
      margin-top: -15px;
      text-align: center;
      direction: rtl;
      /* unicode-bidi: bidi-override; */
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
   #productImageArea:hover {
      cursor: pointer;
   }
   #reviewImage {
      width: 320px;
      height: auto;
   }
   #content {
      border: 1px solid #C0C0C0;
      width: 90%;
      height: 300px;
      outline: none;
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
/* footer */   
   #footer {
      margin-top: 50px;
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
      <!-- 사이드메뉴 -->
      <div>
         <div id="subBlue">
             <form action="<%= request.getContextPath() %>/updateForm.me" method="post" id="myForm" name="myForm">
            <br>
            <br><strong><%= member.getM_Name() %>님<br>
              <br> 보유 포인트<br> <%= member.getPoint() %>원</strong><br>
              <br>
              <input type="submit" id="userUpadteBtn" value="회원 정보 관리">
            </form> 
         </div>
         <div id="subMenuDiv">
            <ul>
               <li class="subMenuLi">
                  <a class="submenuLink" href="<%= request.getContextPath() %>/mypageList.mp">장바구니</a>
               </li>
               
               <li class="subMenuLi"><hr class="row_1"></li>
               
               <li class="subMenuLi">
                  <a class="submenuLink" href="<%= request.getContextPath() %>/myPagepurchase.mp">주문내역</a>
               </li>
               
               <li class="subMenuLi"><hr class="row_1"></li>
               
               <li class="subMenuLi">
                  <a class="submenuLink" href="<%= request.getContextPath() %>/reviewList.my">리뷰관리</a>
               </li>
               
               <li class="subMenuLi"><hr class="row_1"></li>
             </ul>
         </div>
      </div>
      <div class="outer">
         <!-- 리뷰 리스트 -->
         <div class="outerBg">
            <div class="outerText">리뷰 관리</div>
         </div>
         <form action="<%=request.getContextPath()%>/reviewImageUpdate.re" method="post" encType="multipart/form-data">
            <table id="tableArea">
               <tr>
                  <th>
                     상품은 만족하셨나요?
                     <input type="hidden" name="rId" value="<%= r.getR_no() %>">
                  </th>
               </tr>
               <tr>
                  <td id="starTd">
                     <div id="starDiv">
                        <input id="radio5" type="radio" name="score" class="score" value="5"> 
                              <label for="radio5">&#9733;</label> 
                              <input id="radio4" type="radio" name="score" class="score" value="4">
                              <label for="radio4">&#9733;</label>
                              <input id="radio3" type="radio" name="score" class="score" value="3">
                              <label for="radio3">&#9733;</label>
                              <input id="radio2" type="radio" name="score" class="score" value="2">
                              <label for="radio2">&#9733;</label>
                              <input id="radio1" type="radio" name="score" class="score" value="1">
                              <label for="radio1">&#9733;</label>
                     </div>
                     <br>
                  </td>
               </tr>
               <tr>
                  <th>사진을 등록해주세요.</th>
               </tr>
               <tr>
                  <td id="productImageTd">
                     <div id="productImageArea">
                        <img id="reviewImage" src="<%= request.getContextPath() %>/review_uploadFiles/<%= fileList.get(0).getRi_changeName() %>"
                        width="240px" height="180px">
                     </div>
                     <br>
                  </td>
               </tr>
               <tr>
                  <th>후기를 작성해주세요.</th>
               </tr>
               <tr>
                  <td id="contentArea">
                     <div id="contentDiv">
                        <textarea id="content" name="content" style="resize: none;"><%= r.getR_content() %></textarea>
                     </div>
                  </td>
               </tr>
               <tr>
                  <td class="btnArea">
                     <br>
                     <%-- <input type="hidden" value="<%= r.getR_no() %>"> --%>
                     <input type="button" id="cancelBtn" value="취소" onclick="updateCancel();">
                     <input type="submit" id="insertBtn" value="수정">
                  </td>
               </tr>
            </table>
   
            <!-- 파일 업로드 하는 부분 -->
            <div id="fileArea">
               <input type="file" id="uploadImage" multiple="multiple"
                  name="uploadImage" onchange="LoadImg(this,1)">
            </div>
            <script>
               // 내용 작성 부분의 공간을 클릭할 때 파일 첨부 창이 뜨도록 설정하는 함수
               $(function() {
                  $("#fileArea").hide();
   
                  $("#reviewImage").click(function() {
                     $("#uploadImage").click();
                  });
               });
   
               // 각각의 영역에 파일을 첨부 했을 경우 미리 보기가 가능하도록 하는 함수
               function LoadImg(value, num) {
                  if (value.files && value.files[0]) {
                     var reader = new FileReader();
                     
                     reader.onload = function(e) {
                        switch(num){
                        case 1:
                           $("#reviewImage").attr("src", e.target.result);
                           break;
                        }
                     }
                  reader.readAsDataURL(value.files[0]);
                  }
               }
            </script>
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
      function updateCancel() {
         var bool = confirm('수정을 취소하시겠습니까?');
         
         if(bool) {
            location.href='detailReviewImage.re?rId=<%= r.getR_no() %>';
         }
      }
      
      var size = $(".score").length;
      
         for(var i = 4; i >= (size-<%= r_score.getR_score() %>); i--) {
            $(".score").eq(i).prop("checked", true);
         }
      
   </script>
</body>
</html>