package product.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import product.model.service.ProductService;
import product.model.vo.ProductImage;
import product.model.vo.ProductOption;
import review.model.service.ReviewService;
import review.model.vo.PageInfo;
import review.model.vo.Review;
import review.model.vo.ReviewImage;
import product.model.vo.Product;

/**
 * Servlet implementation class ImageTotalDetailServlet
 */
@WebServlet("/detail.to")
public class ImageTotalDetailServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ImageTotalDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
        showRequestAllParameters(request);   
      
         int pNo = Integer.parseInt(request.getParameter("pNo"));
        
         ReviewService rService = new ReviewService();

			// 페이징 처리 변수
			int listCount;	// 총 게시물 개수
			int currentPage;// 현재 페이지
			int pageLimit;	// 한 페이지에 표시될 페이지 개수
			int boardLimit;	// 한 페이지에 표시될 게시글 개수
			int maxPage;	// 전체 페이지 중 가장 마지막 페이지
			int startPage;	// 페이징이 된 페이지 중 시작 페이지
			int endPage;	// 페이징이 된 페이지 중 마지막 페이지
			
			listCount = rService.getListCount();
			
			currentPage = 1;
			if(request.getParameter("currentPage") != null) {
				currentPage = Integer.parseInt(request.getParameter("currentPage"));
			}
			
			pageLimit = 5;
			boardLimit = 5;
			
			// maxPage 계산
			maxPage = (int)Math.ceil((double)listCount/boardLimit);
			
			System.out.println("maxPage : " + maxPage);
			
			// startPage 계산 201015 2교시 5:00~5:10
			startPage = pageLimit * ((currentPage - 1)/pageLimit) + 1;
			
			System.out.println("startPage : " + startPage);
			
			// endPage 계산
			endPage = startPage + pageLimit - 1;
			if(maxPage < endPage) {
				endPage = maxPage;
			}
			
			System.out.println("endPage : " + endPage);
			
			PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, boardLimit, maxPage, startPage, endPage);
			ArrayList<Review> pdList = rService.selectPDList(pNo, pi);
			ArrayList<ReviewImage> fList = rService.selectFList();
			
			System.out.println("boardLimit : " + boardLimit);
			System.out.println("pi : " + pi);
			System.out.println("pdList : " + pdList);
			System.out.println("fList : " + fList);
         ProductService service = new ProductService();
         
         //상품정보조회
         Product product = service.selectProduct(pNo); 
         
         //상품사진리스트조회
         ArrayList<ProductImage> fileList = service.selectProductImage(pNo); //상품사진리스트조회
         //System.out.println(product);
         //System.out.println(fileList);
         
         //재고조회  
         ArrayList<ProductOption> option  = service.selectOption(pNo);
         System.out.println(option);
   
         String page = null;
         if(fileList != null) {
        	request.setAttribute("pi", pi);
			request.setAttribute("pdList", pdList);
			request.setAttribute("fList", fList);
            request.setAttribute("product", product);
            request.setAttribute("fileList", fileList);
            request.setAttribute("option", option);
            System.out.println(option);
            page = "WEB-INF/views/product/ImageTotalDetail.jsp";
         }else {
            request.setAttribute("msg", "상품 상세보기에 실패하였습니다");
            page = "WEB-INF/views/common/errorPage.jsp";
         }
         request.getRequestDispatcher(page).forward(request, response);
   }
 
   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      doGet(request, response);
   }
   
   private void showRequestAllParameters(HttpServletRequest request) {
      Enumeration<String> headerEnumList = request.getHeaderNames();
      while (headerEnumList.hasMoreElements()) {
         String string = (String) headerEnumList.nextElement();
      }
      
      Enumeration<String> bodyEnumList = request.getParameterNames();
      while (bodyEnumList.hasMoreElements()) {
         String string = (String) bodyEnumList.nextElement();
      }
      
   }
}