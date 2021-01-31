package review.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import review.model.service.ReviewService;
import review.model.vo.PageInfo;
import review.model.vo.Review;

/**
 * Servlet implementation class ReviewListServlet
 */
@WebServlet("/list.re")
public class ReviewListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
		
		// startPage 계산 201015 2교시 5:00~5:10
		startPage = pageLimit * ((currentPage - 1)/pageLimit) + 1;
		
		// endPage 계산
		endPage = startPage + pageLimit - 1;
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, boardLimit, maxPage, startPage, endPage);
		ArrayList<Review> list = rService.selectList(pi);
		String page = null;
		if(list != null) {
			page = "WEB-INF/views/review/reviewList.jsp";
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
		} else {
			page = "WEB-INF/views/common/errorPage.jsp";
			request.setAttribute("msg", "게시판 조회에 실패했습니다.");
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
