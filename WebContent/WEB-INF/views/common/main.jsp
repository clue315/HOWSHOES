<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, product.model.vo.*, java.text.*" %>
<%
	ArrayList<Product> pList = (ArrayList<Product>)request.getAttribute("pList");
	ArrayList<ProductImage> fList = (ArrayList<ProductImage>)request.getAttribute("fList");
	DecimalFormat df = new DecimalFormat("###,###");
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<title>상품페이지</title>
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<style>
	 
/*자동 슬라이드 시작*/
	/*GLOBALS*/
	a{text-decoration:none; color:#666;  list-style:none;}
	a:hover{color:#1bc1a3;  list-style:none; }
	
	#wrapper{ width:1800px;  margin:50px auto; height:450px; color:#fff; text-shadow:rgba(0,0,0,0.1) 2px 2px 0px; 
		    	list-style:none; margin-top: -100px;}
	
	#slider-wrap{ width:1800px; height:450px; position:relative; overflow:hidden; list-style:none; }
	
	#slider-wrap ul#slider{ width:100%; height:100%; position:absolute; top:0;left:0;}
	
	#slider-wrap ul#slider li{ float:left; position:relative; width:1800px; height:450px; }
	
	#slider-wrap ul#slider li > div{position:absolute; top:20px; left:35px;}
	
	#slider-wrap ul#slider li > div h3{ font-size:36px; text-transform:uppercase; }
	
	#slider-wrap ul#slider li > div span{ font-family: Neucha, Arial, sans serif; font-size:21px; }
	
	#slider-wrap ul#slider li img{ display:block; width:100%; height: 100%; }
	
	
	/*btns*/
	.btns{ position:absolute; width:50px; height:60px; top:50%; margin-top:-25px; line-height:57px;
	   	   text-align:center; cursor:pointer; background:rgba(0,0,0,0.1); z-index:100;
	       -webkit-user-select: none;  -moz-user-select: none;  -khtml-user-select: none; -ms-user-select: none;	    
		   -webkit-transition: all 0.1s ease; -moz-transition: all 0.1s ease; -o-transition: all 0.1s ease;
		   -ms-transition: all 0.1s ease;transition: all 0.1s ease;}
	
	.btns:hover{ background:rgba(0,0,0,0.3);}
	
	#next{right:-50px; border-radius:7px 0px 0px 7px;}
	#previous{left:-50px; border-radius:0px 7px 7px 7px;}
	#counter{ top: 30px; right:35px; width:auto; margin-top: 50px;} 
	
	#slider-wrap.active #next{right:0px;}
	#slider-wrap.active #previous{left:0px;}
	
	
	/*bar*/
	#pagination-wrap{ min-width:20px; margin-top:350px; margin-left: auto; margin-right: auto; height:15px;
	   				 position:relative; text-align:center;}
	
	#pagination-wrap ul { width:100%; }
	
	#pagination-wrap ul li{margin: 0 4px; display: inline-block; width:5px; height:5px; border-radius:50%; background:#fff;
	  					  opacity:0.5; position:relative; top:0;}
	
	#pagination-wrap ul li.active{ width:12px; height:12px; top:3px; opacity:1; box-shadow:rgba(0,0,0,0.1) 1px 1px 0px;}
	
	/*Header*/
	h1, h2{text-shadow:none; text-align:center;}
	h1{ color: #666; text-transform:uppercase;  font-size:36px;}
	h2{ color: #7f8c8d; font-family: Neucha, Arial, sans serif; font-size:18px; margin-bottom:30px;} 
	
	/*ANIMATION*/
	#slider-wrap ul, #pagination-wrap ul li{ -webkit-transition: all 0.3s cubic-bezier(1,.01,.32,1); -moz-transition: all 0.3s cubic-bezier(1,.01,.32,1);
	    -o-transition: all 0.3s cubic-bezier(1,.01,.32,1); -ms-transition: all 0.3s cubic-bezier(1,.01,.32,1); transition: all 0.3s cubic-bezier(1,.01,.32,1); }
/*자동 슬라이드 끝*/	
	#slider {width:100%; position:relative;list-style:none;}
    #sliderLi {position:relative; height:100%; width:25%; float:left;}

	
	footer{height:100px;  margin:auto; clear:both; text-align:center; }
	section{margin:0 auto 20px auto; box-sizing:border-box; padding:0 100px;}
	/* 상품 이미지 틀 */
	.outer{width: 85%; height:400px; background: rgba(255, 255, 255, 0.4); border: 4px solid black;
		margin-left:auto; margin-right:6.5%; margin-top:auto;
	}
	
	/* 상품  */
	/* 전체 카테고리 명*/
	#ProductTrap{ width:130px; height: -20; border-left: 40px solid transparent; border-right: 40px solid transparent; border-top: 50px solid black;}
    .thumb-list {position:relative; width: 200px; border:1px solid white;  margin:10px; margin-left:20px; /* align:auto;  */
	             display: inline-block; justify-content: space-between; vertical-align: middle; text-align: left; top:-110px;}
	.thumb-list:hover {opacity:0.8; cursor:pointer;}
	/* 검색 form */
	#search_menu{postion:relative; float:right; padding-left:25px;}
	#search-li-div{display:inline-block;}
	.search-li{list-decoration:none; display:inline-block; font-weight:bold; padding:0 5px;}
	#popular:hover,#newProduct:hover,#low:hover,#high:hover{cursor:pointer;}
	
	
	/* 상품랭킹 리스트  */
	#content-productList{width:35px; height:35px; background-color:#4572C4; color:white; font-size:20px; font-weight:bold;position:absolute; top:0px;}
	#foot-ranking{width:400px; display: inline-block; margin-top:50px;}
	#foot-ranking > ul > li {display: inline-block; font-size:20px; font-weight:bold; padding:12px 0px;}
	#foot-ranking > ul > li:hover{color:#4572C4; cursor:pointer;}
	.content-product{
		display:inline-block;
	}
	.container {    /*랭킹안 전체박스*/
    display: table;    
    table-layout: fixed;
    width: 100%;  /* width: 1024px; /*너비 값을 px로 고정하려면 수정하세요. */ 
    min-width: 768px;  
       
}
.container div { /*랭킹안 1위*/
	font-size: 13px;
    border: 1px solid #ccc;
	height: 50px; /*박스안글자전부 아래위높이조절*/
    display: table-cell;
    vertical-align: middle;
    padding: 0 0px; /*0은 아래위 간격조절 25px는 전체 왼쪽간격 */
}
.container div:first-child { /*랭킹안 위*/
   	width: 20%; /*박스전부사이즈가 달라짐*/
    text-align: left;
    padding: 20px;/*전체박스안 패딩조절*/
}

.container div:nth-child(2) { /*10,000칸*/ 
    width:20%;/*2,3번째 div간격이 벌어짐*/
     text-align: left;
    line-height: 2;
}
.container div:nth-child(3) {/*20,000칸*/
	width: 20%;/*3,4번 div 간격*/
    text-align: left;
    line-height: 2;
}
.container div:nth-child(4) {/*30,000칸*/
	width: 20%;/*3,4번 div 간격*/
    text-align: left;
    line-height: 2;
}
.container div:nth-child(5) {/*40,000칸*/
	width: 20%;/*3,4번 div 간격*/
    text-align: left;
    line-height: 2;
}
.container div:nth-child(6) {/*50,000칸*/
	width: 20%;/*3,4번 div 간격*/
    text-align: left;
    line-height: 2;
}
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
	<br><br>
	
	<!-- 슬라이더 테스트(자동) -->

	<div id="wrapper">
      <div id="slider-wrap">
          <ul id="slider">
            <li>
				<img src="images/slider01.PNG"style="width: 1750px;">  
             </li>
             <li>
				<img src="images/slider_2.PNG" style="width: 1750px;">
             </li>
             <li> 
				<img src="images/slider_3.PNG" style="width: 1750px;">
             </li>
          </ul>
          
           <!--controls-->
          <div class="btns" id="next"><i class="fa fa-arrow-right"></i></div>
          <div class="btns" id="previous"><i class="fa fa-arrow-left"></i></div>
          <div id="counter"></div>
          
          <div id="pagination-wrap">
            <ul>
            </ul>
          </div>
      </div>
   </div>
	
	
   <br>
	 <div class="outer">
	
		 <div id="ProductTrap"></div>
		  <h4 style="font-size: 25px; color: white; margin-top: -48px; margin-left: 45px; font-family: Typo_SsangmunDong;">RANKING</h4>
     <div id="foot-ranking" class="content-product">
      	<ul>
      		<li id="foot-wide" value="1">발 볼 넓은 사람들이 선호하는 신발</li>
      		<li id="foot-narrow" value="2">발 볼 좁은 사람들이 선호하는 신발</li>
      		<li id="foot-flat" value="3">평발인 사람들이 선호하는 신발</li>
      		<li id="foot-concave" value="4">오목발인 사람들이 선호하는 신발</li>
      		<li id="foot-slim" value="5">칼발인 사람들이 선호하는 신발</li>
      	</ul>     	
     </div >
  	
     <% if (pList.isEmpty() || fList.isEmpty()) {%>
						등록된 사진이 없습니다.
			<% } else {%>
				<% for(int i = 0; i < pList.size(); i++) { %>
						<% Product p = pList.get(i);%>
						<div class="thumb-list" align="center" >
						
						<div id="content-productList"><%= i+1 %>위</div>
							<input type="hidden" value="<%= p.getpNo() %>">
								<% for(int j = 0; j < fList.size(); j++) {%>
								 	<% ProductImage a = fList.get(j);%>
									<% if(p.getpNo() == a.getpNo()) { %>
										<img src="<%= request.getContextPath() %>/productImage_uploadFiles/<%= a.getPiChangeName()  %>"
										width="180px" height="170px"	>
									<% } %>
								<% } %>
							
							<p style="overflow:hidden; margin-left:20px;">
						<strong><%= p.getpName() %></strong><br> 
					    <strong><%= df.format(p.getpPrice()) %></strong>원
							</p>
						</div>
			 	   <% } %>
		       <% } %>	
	</div>	 

		   
	  <br><br>
	<div id="footer">
			<hr id="footer_hr">
			<h4 class="footer_text" id="line1">고객센터 : 1588-0000  |  이메일 : amg@howshoes.com  |  운영시간 : 월~금 / 09:00~18:00 / 주말, 공휴일 휴무</h4>
			<h4 class="footer_text" id="line2">(주)안녕하슈  |  대표이사 : 강건강  |  주소 : 서울특별시 강남구 역삼동 남도빌딩 3층</h4>
			<h4 class="footer_text" id="line3">사업자등록번호 : 201-81-12345  |  개인정보보호 책임자 : 남나눔</h4>
		</div>
	<script>


		$(function(){
			$('.thumb-list').click(function(){
				var pNo = $(this).children().next().eq(0).val();
				console.log(pNo);
				location.href="<%= request.getContextPath() %>/detail.to?pNo=" +  pNo; 
			});
		});
		
		//current position
		var pos = 0;
		//number of slides
		var totalSlides = $('#slider-wrap ul li').length;
		//get the slide width
		var sliderWidth = $('#slider-wrap').width();


		$(document).ready(function(){
		    
		    
		    /*****************
		     BUILD THE SLIDER
		    *****************/
		    //set width to be 'x' times the number of slides
		    $('#slider-wrap ul#slider').width(sliderWidth*totalSlides);
		    
		    //next slide    
		    $('#next').click(function(){
		        slideRight();
		    });
		    
		    //previous slide
		    $('#previous').click(function(){
		        slideLeft();
		    });
		    
		    
		    
		    /*************************
		     //*> OPTIONAL SETTINGS
		    ************************/
		    //automatic slider
		    var autoSlider = setInterval(slideRight, 3000);
		    
		    //for each slide 
		    $.each($('#slider-wrap ul li'), function() { 

		       //create a pagination
		       var li = document.createElement('li');
		       $('#pagination-wrap ul').append(li);    
		    });
		    
		    //counter
		    countSlides();
		    
		    //pagination
		    pagination();
		    
		    //hide/show controls/btns when hover
		    //pause automatic slide when hover
		    $('#slider-wrap').hover(
		      function(){ $(this).addClass('active'); clearInterval(autoSlider); }, 
		      function(){ $(this).removeClass('active'); autoSlider = setInterval(slideRight, 3000); }
		    );
		    
		    

		});//DOCUMENT READY
		    


		/***********
		 SLIDE LEFT
		************/
		function slideLeft(){
		    pos--;
		    if(pos==-1){ pos = totalSlides-1; }
		    $('#slider-wrap ul#slider').css('left', -(sliderWidth*pos));    
		    
		    //*> optional
		    countSlides();
		    pagination();
		}


		/************
		 SLIDE RIGHT
		*************/
		function slideRight(){
		    pos++;
		    if(pos==totalSlides){ pos = 0; }
		    $('#slider-wrap ul#slider').css('left', -(sliderWidth*pos)); 
		    
		    //*> optional 
		    countSlides();
		    pagination();
		}

		    
		/************************
		 //*> OPTIONAL SETTINGS
		************************/
		function countSlides(){
		    $('#counter').html(pos+1 + ' / ' + totalSlides);
		}

		function pagination(){
		    $('#pagination-wrap ul li').removeClass('active');
		    $('#pagination-wrap ul li:eq('+pos+')').addClass('active');
		}
		/* sort 방식 */
		$(function(){
			$('#foot-wide').click(function(){
				var no = $(this).eq(0).val();
				location.href="<%= request.getContextPath() %>/rank.po?no=" +  no;	
			});
		});	
		$(function(){
			$('#foot-narrow').click(function(){
				var no = $(this).eq(0).val();
				location.href="<%= request.getContextPath() %>/rank.po?no=" +  no;	
			});
		});	
		$(function(){
			$('#foot-flat').click(function(){
				var no = $(this).eq(0).val();
				location.href="<%= request.getContextPath() %>/rank.po?no=" +  no;	
			});
		});	
		$(function(){
			$('#foot-concave').click(function(){
				var no = $(this).eq(0).val();
				location.href="<%= request.getContextPath() %>/rank.po?no=" +  no;	
			});
		});	
		$(function(){
			$('#foot-slim').click(function(){
				var no = $(this).eq(0).val();
				location.href="<%= request.getContextPath() %>/rank.po?no=" +  no;	
			});
		});	
		
		

	
		</script>
</body>
</html>