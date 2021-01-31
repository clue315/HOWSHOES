package mypage.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.vo.Member;
import order.model.vo.Order;
import order.service.orderService;
import product.model.service.ProductService;
import product.model.vo.Product;
import product.model.vo.ProductImage;

/**
 * Servlet implementation class mypagepurchase
 */
@WebServlet("/myPagepurchase.mp")
public class mypagepurchase extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public mypagepurchase() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member m = (Member)request.getSession().getAttribute("loginUser");
		orderService service = new orderService();
		ProductService ps = new ProductService();
		ArrayList<Order> o = service.selectorder2(m.getM_Id());
		ArrayList<Order> oList = new ArrayList<Order>();
		ArrayList<Product> p = new ArrayList<Product>();
		ArrayList<ArrayList<ProductImage>> pi = new ArrayList<ArrayList<ProductImage>>();
		ArrayList<Integer> ono =service.selectOrderNo2(m.getM_Id());
		
		for(int i=0; i<o.size();i++) {
			int pno =service.selectPno2(o.get(i).getPoSize());
			
			oList.add(service.selectOrder(ono.get(i), m.getM_Id()));
			p.add(ps.selectProduct(pno));
			pi.add(ps.selectProductImage(pno));
		}
		
		request.setAttribute("oList", oList);
		request.setAttribute("m", m);
		request.setAttribute("p", p);
		request.setAttribute("pi", pi);
		
		request.getRequestDispatcher("WEB-INF/views/myPage/myPage_purchase.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
