package mypage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import review.model.vo.PageInfo;
import member.model.vo.Member;
import product.model.vo.Product;
import review.model.service.ReviewService;
import review.model.vo.Review;
import review.model.vo.ReviewImage;

/**
 * Servlet implementation class MyPageReviewServlet
 */
@WebServlet("/reviewList.my")
public class MyPageReviewListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageReviewListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ReviewService Service = new ReviewService();

		String r_writer = ((Member)request.getSession().getAttribute("loginUser")).getM_Id();
		
		// 페이징 처리 변수
		int listCount;	// 총 게시물 개수
		int currentPage;// 현재 페이지
		int pageLimit;	// 한 페이지에 표시될 페이지 개수
		int boardLimit;	// 한 페이지에 표시될 게시글 개수
		int maxPage;	// 전체 페이지 중 가장 마지막 페이지
		int startPage;	// 페이징이 된 페이지 중 시작 페이지
		int endPage;	// 페이징이 된 페이지 중 마지막 페이지
		
		listCount = Service.getListCount();
		
		currentPage = 1;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		pageLimit = 5;
		boardLimit = 5;
		
		// maxPage 계산
		maxPage = (int)Math.ceil((double)listCount/boardLimit);
		
		// startPage 계산 201015 2교시 5:00~5:10
		startPage = pageLimit * ((currentPage - 1)/pageLimit) + 1;
		
		// endPage 계산
		endPage = startPage + pageLimit - 1;
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		Member m = (Member)request.getSession().getAttribute("loginUser");
		  Review r = new Review(r_writer);
	      Product product = new Product();
	      PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, boardLimit, maxPage, startPage, endPage);
	      ArrayList<Review> rList = Service.selectRList(r, pi);
	      ArrayList<ReviewImage> fList = Service.selectFList();
		
		String page = null;
		if(rList != null && fList != null) {
			request.setAttribute("m", m);
			request.setAttribute("r", r);
			request.setAttribute("pi", pi);
			request.setAttribute("rList", rList);
			request.setAttribute("fList", fList);
			page = "WEB-INF/views/myPage/myPage_review.jsp";
		} else {
			page = "WEB-INF/views/common/errorPage.jsp";
			request.setAttribute("msg", "리뷰 조회에 실패했습니다.");
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

}
