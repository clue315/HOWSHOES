package mypage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.MemberService;
import member.model.vo.Member;
import mypage.model.vo.Shopping;
import mypage.service.MyPageService;
import order.model.vo.Order;
import order.service.orderService;
import product.model.service.ProductService;
import product.model.vo.Product;
import product.model.vo.ProductImage;

/**
 * Servlet implementation class MemberMyPageServlet
 */
@WebServlet("/myPage.me")
public class MemberMyPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberMyPageServlet() {
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
		
		ArrayList<Shopping> sList = new MyPageService().selectMyPageSpList(m.getM_Id());				
		ArrayList<Product> p = new ArrayList<Product>();
		ArrayList<ArrayList<ProductImage>> pi = new ArrayList<ArrayList<ProductImage>>();
		
		ArrayList<Order> o = service.selectMyPageList(m.getM_Id());
		ArrayList<Order> oList = new ArrayList<Order>();
		ArrayList<Product> p2 = new ArrayList<Product>();
		ArrayList<ArrayList<ProductImage>> pi2 = new ArrayList<ArrayList<ProductImage>>();
		ArrayList<Integer> ono =service.selectOrderNo2(m.getM_Id());
		
		if(sList != null) {
			for(int i= 0; i<sList.size(); i++) {
				p.add(new ProductService().selectProduct2(sList.get(i).getP_no(), sList.get(i).getPo_size()));
				pi.add(new ProductService().selectProductImage(sList.get(i).getP_no()));
			}
		}
		
		
		
		if(o != null) {
			for(int i=0; i<o.size();i++) {
			
				int pno =service.selectPno(o.get(i).getPoSize());
				
				oList.add(service.selectOrder(ono.get(i), m.getM_Id()));
				p2.add(ps.selectProduct(pno));
				pi2.add(ps.selectProductImage(pno));
			}
		}
	
		request.setAttribute("oList", oList);
		request.setAttribute("sList", sList);
		request.setAttribute("p", p);
		request.setAttribute("pi", pi);
		
		request.setAttribute("p2", p2);
		request.setAttribute("pi2", pi2);
		request.setAttribute("member", m);
	
		request.getRequestDispatcher("WEB-INF/views/myPage/myPage.jsp").forward(request, response);
	}
		
	
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
