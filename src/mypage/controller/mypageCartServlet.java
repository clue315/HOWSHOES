package mypage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.vo.Member;
import mypage.model.vo.Shopping;
import mypage.service.MyPageService;
import product.model.service.ProductService;
import product.model.vo.Product;
import product.model.vo.ProductImage;

/**
 * Servlet implementation class mypage
 */
@WebServlet("/mypageList.mp")
public class mypageCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public mypageCartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		Member m = (Member)request.getSession().getAttribute("loginUser");
		ArrayList<Shopping> sList = new MyPageService().selectShopping(m.getM_Id());
		ArrayList<Product> p = new ArrayList<Product>();
		ArrayList<ArrayList<ProductImage>> pi = new ArrayList<ArrayList<ProductImage>>();
		
		if(sList != null) {
			for(int i= 0; i<sList.size(); i++) {
				p.add(new ProductService().selectProduct2(sList.get(i).getP_no(), sList.get(i).getPo_size()));
				pi.add(new ProductService().selectProductImage(sList.get(i).getP_no()));
			}
		}
		
		request.setAttribute("sList", sList);
		request.setAttribute("p", p);
		request.setAttribute("pi", pi);
		request.setAttribute("member", m);
		request.getRequestDispatcher("WEB-INF/views/myPage/myPage_cart.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
