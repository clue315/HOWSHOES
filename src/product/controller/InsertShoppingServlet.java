package product.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.model.service.BoardService;
import member.model.service.MemberService;
import member.model.vo.Member;
import product.model.service.ProductService;
import product.model.vo.Product;
import product.model.vo.ProductOption;
import product.model.vo.ShoppingCart;

/**
 * Servlet implementation class InsertShoppingServlet
 */
@WebServlet("/insertShopping.is")
public class InsertShoppingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertShoppingServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int opnum = Integer.parseInt(request.getParameter("opnum"));
		int opsize = Integer.parseInt(request.getParameter("opsize"));
		int pno = Integer.parseInt(request.getParameter("pno"));
		HttpSession session = request.getSession();
		Member userId = (Member)session.getAttribute("loginUser");
		
		
	
		int poNo =  new ProductService().selectOption(pno, opsize); //상품번호
		System.out.println(opnum);
		System.out.println(userId);
		System.out.println(poNo);
		System.out.println(pno);
		ShoppingCart s = new ShoppingCart( opnum, userId.getM_Id(), poNo, pno);		
		int result = new ProductService().insertCart(s);
	      
	      
		  String page = null;
			if(result > 0) {
			}else {
				request.setAttribute("msg", "장바구니 등록에 실패하였습니다");
				page = "WEB-INF/views/common/errorPage.jsp";
				request.getRequestDispatcher(page).forward(request, response);
			}
		}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
