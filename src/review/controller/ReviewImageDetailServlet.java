package review.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.vo.Member;
import review.model.service.ReviewService;
import review.model.vo.Review;
import review.model.vo.ReviewImage;

/**
 * Servlet implementation class ReviewImageDetailServlet
 */
@WebServlet("/detailReviewImage.re")
public class ReviewImageDetailServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewImageDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      int rId = Integer.parseInt(request.getParameter("rId"));
      Member m = (Member)request.getSession().getAttribute("loginUser");
      ReviewService service = new ReviewService();
      
      Review review = service.selectReview(rId);
      ArrayList<ReviewImage> fileList = service.selectReviewImage(rId);
      
      String page = null;
      if(review != null) {
         request.setAttribute("member", m);
         request.setAttribute("review", review);
         request.setAttribute("fileList", fileList);
         page = "WEB-INF/views/review/reviewImageDetail.jsp";
      } else {
         page = "WEB-INF/views/common/errorPage.jsp";
         request.setAttribute("msg", "게시글 상세조회에 실패했습니다.");
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