<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, review.model.vo.*, member.model.vo.Member" %>
<%
    Review r = (Review)request.getAttribute("review");
   ArrayList<ReviewImage> fileList = (ArrayList<ReviewImage>)request.getAttribute("fileList");
   ReviewImage reviewImage = fileList.get(0);
   Member member = (Member)request.getAttribute("member");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.5.1.min.js"></script>
<style type="text/css">
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
   #productNameTd {
      padding: 4px;
      font-weight: bolder;
      font-size: 18px;
      text-align: left;
   }
   #dateTd {
      padding: 4px;
      text-align: right;
      font-size: 14px;
   }
   #writerTd{
      padding: 4px;
      text-align: right;
      font-size: 18px;
   }
   #footInfoTd {
      padding: 4px;
      text-align: right;
      font-size: 14px;
      border-bottom: 1px dashed lightgray;
   }
   #starTd {
      width: 500px;
      padding-bottom: 7px;
   }
   #star {
      color: #D1141B;
      font-size: 25px;
      padding-bottom: 2px
   }
   #starOn {
      color: #D1141B;
      font-size: 25px;
      padding-bottom: 2px
   }
   #starOff {
      color: lightgrey;
      font-size: 25px;
      padding-bottom: 2px
   }
   #buttonDiv {
      background: skyblue;
   }
   #imageTd {
      padding-bottom: 10px;
   }
   #reviewImage {
      width: 320px;
      height: auto;
   }
   #contentTd {
      padding: 5px;
      text-align: left;
      font-size: 14px;
   }
   #contentArea {
      font-family: "맑은 고딕";
      white-space: pre-wrap;
   }
   /* 페이징버튼 */
   .pagingArea button{
      margin-top: 45px;
      border: 0px;
      outline: 0px;
      background: none;
      font-size: 15px;
      font-weight: bold;
      cursor: pointer;
   }
   #pagingAreaTop{
      margin-top: -70px;
      margin-left: 400px;
   }
   #pagingAreaBottom{
      margin-left: 400px;
      margin-top: -30px;
      margin-bottom: 10px;
   }
    /* 삭제버튼 */
   #deleteBtn {
      border: 0;
      outline: 0;
      font-size: 16px;
      font-weight: bold;
      width: 50px;
      height: 30px;
      background: white;
      border: 3px solid black;
      float: right;
      margin-top: -28px;
      margin-right: 3px;
   }
   #deleteBtn:hover {
      color: #4572C4;
      cursor: pointer;
   }
   /* 수정버튼 */
   #updateBtn {
      border: 0;
      outline: 0;
      font-size: 16px;
      font-weight: bold;
      width: 50px;
      height: 30px;
      background: white;
      border: 3px solid black;
      float: right;
      margin-top: -28px;
      margin-right: 3px;
   }
   #updateBtn:hover {
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
      margin-top: -28px;
      margin-right: 4px;
   }
   #listBtn:hover {
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
         <form action="<%= request.getContextPath() %>/reviewImageUpdateForm.re" id="detailForm" method="post">
            <table id="tableArea">
               <tr>
                  <td id="productNameTd">
                     <input type="hidden" name="rId" value="<%= r.getR_no() %>">
                     <input type="hidden" name="score" value="<%= r.getR_score() %>">
                  </td>
               </tr>
               <tr>
                  <td id="dateTd">
                     <div id="dateDiv">
                        <%= r.getR_date() %>
                     </div>
                  </td>
               </tr>
               <tr>
                  <td id="writerTd">
                     <div id="writerDiv">
                        <%= r.getR_writer() %>
                     </div>
                  </td>
               </tr>
               <tr>
                  <td id="footInfoTd">
                     <div id="footInfoDiv">
                        작성자 발정보
                     </div>
                  </td>
               </tr>
               <tr>
                  <td id="starTd">
                     <div id="starDiv">
                        <% for(int j = 1; j <= 5; j++) { %>
                           <% if(j <= r.getR_score()) {%>
                              <label id="starOn">
                                 &#9733;
                              </label>
                           <% } else { %>
                              <label id="starOff">
                                 &#9733;
                              </label>
                           <% } %>
                        <% } %>
                     </div>
                     <div id="buttonDiv" align="center">
                        <input type="button" onclick="location.href='reviewList.my'" id="listBtn" value="목록">
                        <% if((loginUser != null && loginUser.getM_Id().equals(r.getR_writer())) || (loginUser != null && loginUser.getM_Id().equals("admin"))) { %>
                        <input type="button" id="deleteBtn" value="삭제" onclick="deleteReview();">
                        <input type="submit" id="updateBtn" value="수정">
                        <% } %>
                     </div>
                  </td>
               </tr>
               <tr>
                  <td id="imageTd">
                     <% for(int i = 0; i < fileList.size(); i++) { %>
                     <div id="imageDiv" align="center">
                        <img id="reviewImage" src="<%= request.getContextPath() %>/review_uploadFiles/<%= fileList.get(i).getRi_changeName() %>">
                     </div>
                     <% } %>
                  </td>
               </tr>
               <tr>
                  <td id="contentTd">
                     <pre id="contentArea"><%= r.getR_content() %></pre>
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
      function deleteReview() {
         var bool = confirm('정말 삭제하시겠습니까?');
         
         if(bool) {
            location.href='deleteReview.re?rId=<%= r.getR_no() %>';
         }
      }
   </script>
</body>
</html>