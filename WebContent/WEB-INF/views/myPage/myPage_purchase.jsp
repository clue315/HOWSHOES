<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.text.*, java.util.ArrayList, product.model.vo.*, member.model.vo.*, order.model.vo.*"%>
<%
   Member member = (Member)request.getAttribute("m");
   ArrayList<Order> o = (ArrayList<Order>)request.getAttribute("oList");
   ArrayList<Product> p = (ArrayList<Product>)request.getAttribute("p");
   ArrayList<ArrayList<ProductImage>> pi = (ArrayList<ArrayList<ProductImage>>)request.getAttribute("pi");
   DecimalFormat df = new DecimalFormat("###,###");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyPage</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.5.1.min.js"></script>
<style>
   #section{
      margin-left: auto;
      margin-right: auto;
      width: 1150px;
      min-height: 390px;
   }
   .outer{
      border: 3px solid black;
      width: 920px;
      margin-left: 220px;
      margin-top: -326px;
      min-height: 320px;
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
   
   table {
       border-collapse: collapse;
       margin-top: 20px;
       margin-left: auto;
       margin-right: auto;
       width: 90%;
   }
   #titleTr{
      height: 40px;
      border-top: 2px solid black;
      border-bottom: 2px solid black;
   }
   #contentTr{
      text-align: center;
      border-top: 1px solid black;
      border-bottom: 1px solid black;
   }
   #emptyOrder{
      height: 272px;
      font-size: 36px;
      font-weight: bolder;
      text-align: center;
   }
   
   #cAll{ /* 전체보기 버튼 */
       margin-left: 1300px;
   }
   #cNotice{
       width: 900px; 
       height: 30px; 
       border: 1px solid black; 
       color: black; 
       padding: 10px; 
       font-size: 13px;
       background: rgb(241, 240, 239);
       margin-top:30px;
       margin-left: 240px;
   }
/*===================== 장바구니 ================== */   
   #cart{ /* 장바구니 글자 */
      font-style: bold;
       font-size: 25px;
       margin-top: -380px;
       margin-left: 240px;
   }
   
   #line_1{ 
      width: 810px;
      margin-top: -40px;
      margin-left: 565px;
   }
   
    #cShoes_1{ /* 신발사진1  */
      text-align: center;
      color: white;
       width: auto; 
       height: 125px; 
       margin-top: 10px;
       background: rgb(182, 178, 179);
   } 
    
    #cCom_1{ /* 신발정보1 */
        margin-left: 565px;
       margin-top: 20px;
    }
    
    #cShoes_2{
      text-align: center;
      color: white;
       width: 125px; 
       height: 125px; 
       margin-left: 730px;
       margin-top: -205px;
       background: rgb(182, 178, 179);
   } 
   
    #cCom_2{
        margin-left: 730px;
       margin-top: 20px;
    }

   td{
   padding: 10px;
   font-size: 20px;
   }
   .space{
   width: 220px;
   }
   .cspace{
   width: 10px;
   }
   #tr1{
   text-align: center;
   margin-top: 5px;
   
   }
   .btnspan{
      border: 1px solid black;
      background: #4572C4;
      color: white;
      padding: 2px;
   }
   #continue{/* 버튼 css*/
      background: white;
      color: black;
      width: 180px;
      height: 50px;
      font-size:20px;
      font-weight: bold;
   }
   #continue:hover{
      color: red;
   }
   #reviewBtn{
      padding: 8px;
      border: none;
      background: black;
      color: white;
      cursor:pointer;
      font-size:20px;
      font-weight:bold;" 
   }
   #reviewBtn:hover{
      background:#4572C4;
      cursor:pointer;
   }
   #finalOrder{/* 버튼 css*/
      background: #4572C4;
      color: white;
      width: 180px;
      height: 50px;
      font-size:20px;
      font-weight: bold;
   }
   #finalOrder:hover{
      color: red;
   }
/* footer */   
   #footer {
      margin-top: 180px;
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
         <div>
            <div class="outerBg">
               <div class="outerText">주문내역</div>
            </div>
         </div>
         <input type="hidden" name="ad" id="ad" value="">
         <input type="hidden" name="ad2" id="ad2" value="">
         <table id="orderTable">
            <% if(o.size()>0){ %>
            <tr id="titleTr">
               <th colspan="3">상품정보</th>
               <th>사이즈</th>
               <th>리뷰 작성 여부</th>
            </tr>
            <% for(int i = 0; i<o.size(); i++){ %>
            <tr id="contentTr">
               <td><img src="<%= request.getContextPath() %>/productImage_uploadFiles/<%= pi.get(i).get(0).getPiChangeName() %>" id="cShoes_1"></img></td>
               <td colspan="2">상품명 : <%= p.get(i).getpName() %><br>수량 : <%= o.get(i).getoCount() %> 개<br>상품 금액 : <%= df.format(o.get(i).getoTotal()) %>원</td>
               <td><%= o.get(i).getPoSize() %></td>
               <% if(o.get(i).getoStatus().equals("N")) {%>
               
               <td><span id="reviewBtn"onclick="goReviewInsert();"><input type="hidden"  value="<%= p.get(i).getpNo() %>">리뷰작성</span></td>
               <td><input type="hidden" value="<%= o.get(i).getoNo() %>"></td>
               <% } else { %>
                  <td><strong>작성완료</strong></td>
               <% } %>
            </tr>
            <% } %>
            <% } else { %>
            <tr id="emptyOrderTr">
               <td colspan="7" id="emptyOrder">
                  주문 목록이 없습니다.
               </td>
            </tr>
            <% } %>
         </table>
      </div>
    </div>
    
    <div id="footer">
      <hr id="footer_hr">
      <h4 class="footer_text" id="line1">고객센터 : 1588-0000  |  이메일 : amg@howshoes.com  |  운영시간 : 월~금 / 09:00~18:00 / 주말, 공휴일 휴무</h4>
      <h4 class="footer_text" id="line2">(주)안녕하슈  |  대표이사 : 강건강  |  주소 : 서울특별시 강남구 역삼동 남도빌딩 3층</h4>
      <h4 class="footer_text" id="line3">사업자등록번호 : 201-81-12345  |  개인정보보호 책임자 : 남나눔</h4>
   </div> 
   <script>
      function goReviewInsert(){
            $('#orderTable tr').click(function(){
               var tr = $(this);
               var td = tr.children();
               var no = td.eq(3).children().children().val();
               var no2 = td.eq(4).children().val();
               $('#ad').val(no);
               $('#ad2').val(no2);
               window.open('writeReviewImageForm.re', 'updateAddressForm', 'width=378, height=734'); 
            });
         };
   </script>          
</body>
</html>