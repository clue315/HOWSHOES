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
	 #footer {
		text-align: center;
	}
	.footer_text {
		font-family: "맑은 고딕";
		font-size: 12px;
		color: #969696;
	}
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
	

	/* 상품 이미지 틀 */
	.outer{width: 1200px; min-height:900px; background: rgba(255, 255, 255, 0.4); border: 4px solid black;
		margin-left:auto; margin-right:auto; margin-top:auto;
	}
	/* 전체 카테고리 명*/
	#ProductTrap{ width:130px; height: -20; border-left: 40px solid transparent; border-right: 40px solid transparent; border-top: 50px solid black;}
    
  	.thumbnailArea { width:1200px; height:auto; margin-left: 30px; margin-right:30px;} 
	.thumb-list {position:absoulte; width: 200px; border:1px solid white;  margin:10px; /* align:auto;  */
	             display: inline-block; justify-content: space-between; vertical-align: middle; text-align: left;}
	.thumb-list:hover {opacity:0.8; cursor:pointer;}
	
	/* 작성하기 버튼 */
	#insertBtn{background: #B2CCFF; margin-left:left;  margin-right:auto; margin-top:auto;}
	#slider {width:100%; position:relative;list-style:none;}
    #sliderLi {position:relative; height:100%; width:25%; float:left;}
	
	footer{height:100px;  margin:auto; clear:both; text-align:center; }
	section{margin:0 auto 20px auto; box-sizing:border-box; padding:0 100px;}
	/* 검색 form */
	#search_menu{postion:relative; float:right; padding-left:25px;}
	#search-li-div{display:inline-block;}
	.search-li{list-decoration:none; display:inline-block; font-weight:bold; padding:0 5px;}
	#popular:hover,#newProduct:hover,#low:hover,#high:hover{cursor:pointer;}
	#searchBtn[type=submit] {
    padding:5px; 
    border:2px solid #ccc; 
    -webkit-border-radius: 5px;
    border-radius: 5px;
    background-color:white;
	}
	select{
		height:25px;
	}
	#keyword[type=text]{
		height:20px;
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
	  <ul id="search_menu">
	  <li class="search-li">
	  	<div id="search-li-div"> 	
	  		<ul>
				 <li class="search-li" id="popular"  value="1">인기순</li> |
				 <li class="search-li" id="newProduct" value="2">신상품순</li> |
				 <li class="search-li" id="low"  value="3">낮은가격순</li> |
				 <li class="search-li" id="high"  value="4">높은가격순</li>
		    </ul>    	
	   </div>
	  </li>
	 	  <li class="search-li">		
			  <form  method='GET' action="<%= request.getContextPath() %>/Man.ma"> 
			    <div id="search-form">	   
			      <select name='col'>
			        <OPTION value='pname'>상품 명</OPTION>
			      </select>
			      <input type='hidden' name="no" value="30">
			      <input type='text' name="keyword" id="keyword" value='' placeholder="">
			      <input type='submit' id="searchBtn" value="검색">
			    </div> 
			  </form>
		  </li>
		</ul>
		<div class="thumbnailArea">
		 <div id="ProductTrap"></div>
		  <h4 style="font-size: 28px; color: white; margin-top: -48px; margin-left: 50px; font-family: Typo_SsangmunDong;">남성신발</h4>
			<% if (pList.isEmpty() || fList.isEmpty()) {%>
						등록된 사진이 없습니다.
			<% } else {%>
				<% for(int i = 0; i < pList.size(); i++) { %>
						<% Product p = pList.get(i);%>
						<div class="thumb-list" align="center" >
							<div>
							<input type="hidden" value="<%= p.getpNo() %>">
								<% for(int j = 0; j < fList.size(); j++) {%>
								 	<% ProductImage a = fList.get(j);%>
									<% if(p.getpNo() == a.getpNo()) { %>
										<img src="<%= request.getContextPath() %>/productImage_uploadFiles/<%= a.getPiChangeName()  %>"
										width="180px" height="170px"	>
									<% } %>
								<% } %>
							</div>
							<p style="overflow:hidden; margin-left:20px;">
							  <strong><%= p.getpName() %></strong><br> 
					   	 <strong><%= df.format(p.getpPrice()) %></strong>원
							</p>
						</div>
			 	   <% } %>
		       <% } %>
			</div>
	  </div>
		   
	  <br><br>
	<footer>
		<p>
			<strong>통합고객센터</strong> 080-000-0000 &nbsp; 1588-0000 &nbsp; 월 ~ 금  &nbsp; 09:00 ~ 18:00(주말, 공휴일 휴무)<br>
			<small> (주)안녕하슈  &nbsp; |  &nbsp; 대표이사: 아무개  &nbsp;| &nbsp;주소 : 서울특별시 강남구 역삼동 <br>
			사업자 등록번호 : 201-81-12341  &nbsp;|&nbsp; 개인정보보호 책임자 : 아무개  &nbsp;|&nbsp;이메일 : amg@helloshoeskorea.com</small>	
		</p>
	</footer>	
	<script>
	
		$(function(){
			$('.thumb-list').click(function(){
				var pNo = $(this).children().children().eq(0).val();
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
			$('#popular').click(function(){
				var no = $(this).eq(0).val();
				location.href="<%= request.getContextPath() %>/listMSort.to?no=" +  no;	
			});
		});	
		$(function(){
			$('#newProduct').click(function(){
				var no = $(this).eq(0).val();
				location.href="<%= request.getContextPath() %>/listMSort.to?no=" +  no;	
			});
		});	
		$(function(){
			$('#low').click(function(){
				var no = $(this).eq(0).val();
				location.href="<%= request.getContextPath() %>/listMSort.to?no=" +  no;	
			});
		});	
		$(function(){
			$('#high').click(function(){
				var no = $(this).eq(0).val();
				location.href="<%= request.getContextPath() %>/listMSort.to?no=" +  no;	
			});
		});	
	</script>
</body>
</html>