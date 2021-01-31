package review.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

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
 * Servlet implementation class ReviewUpdateFormServlet
 */
@WebServlet("/reviewImageUpdateForm.re")
public class ReviewImageUpdateFormServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewImageUpdateFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      request.setCharacterEncoding("UTF-8");
      
      showRequestAllParameters(request);
      
      int rId = Integer.parseInt(request.getParameter("rId"));
      int score = Integer.parseInt(request.getParameter("score"));
      Member m = (Member)request.getSession().getAttribute("loginUser");
      
      Review r_score = new Review();
      r_score.setR_score(score);
      
      ReviewService service = new ReviewService();

      Review review = service.selectReview(rId);
      
      ArrayList<ReviewImage> fileList = service.selectReviewImage(rId);
      
      String page = null;
      if(fileList != null) {
         request.setAttribute("member", m);
         request.setAttribute("r_score", r_score);
         request.setAttribute("review", review);
         request.setAttribute("fileList", fileList);
         page = "WEB-INF/views/review/reviewImageUpdateForm.jsp";
      } else {
         request.setAttribute("msg", "리뷰 수정에 실패했습니다");
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
   
   private void showRequestAllParameters (HttpServletRequest request) {
         
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