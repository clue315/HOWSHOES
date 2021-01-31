package order.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Member;
import mypage.service.MyPageService;
import order.model.vo.Order;
import order.service.orderService;
import product.model.service.ProductService;
import product.model.vo.Product;
import product.model.vo.ProductImage;

/**
 * Servlet implementation class orderEndServlet
 */
@WebServlet("/orderEnd.or")
public class orderEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public orderEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		ProductService ps = new ProductService();
		orderService os = new orderService();		
		String userId = ((Member)request.getSession().getAttribute("loginUser")).getM_Id();
		int point = Integer.parseInt(request.getParameter("point"));
		int size = Integer.parseInt(request.getParameter("countno"));
		int point2 = Integer.parseInt(request.getParameter("point2"));
		new MemberService().pointUpdate(point2, userId); 
		int[] posize = new int[size];
		int[] pno = new int[size];
		int[] total = new int[size];
		int[] pcount = new int[size];
		
		for(int i=0; i<size; i++) {
			posize[i] = Integer.parseInt(request.getParameter("size"+i));
			pno[i] = Integer.parseInt(request.getParameter("pno"+i));		
			total[i] = Integer.parseInt(request.getParameter("total"+i));
			pcount[i] = Integer.parseInt(request.getParameter("pcount"+i));
		}
		
		int add2 = Integer.parseInt(request.getParameter("address"));
		String mag = request.getParameter("masege");
		String name = "";
		String phone = "";
		String address = "";
		if(add2 == 1) {
			name = request.getParameter("name");
			phone = request.getParameter("phone");
			address = request.getParameter("ad");
		} else {
			name = request.getParameter("name2");
			phone = request.getParameter("phone2");
			address = request.getParameter("ad2");
		}
		ArrayList<Order> o = new ArrayList<Order>();
		ArrayList<Product> p = new ArrayList<Product>();
		ArrayList<ArrayList<ProductImage>> pi = new ArrayList<ArrayList<ProductImage>>();
		int i=0;
		for(i=0; i<size; i++) {
		int pono = os.selectOption(pno[i], posize[i]);
		Order o1 = new Order(1, pcount[i], total[i], point, name, address, phone, mag, null, null, pono, userId);
		ps.updateInventry(pono, pcount[i]);	
		
		int no = os.insertOrder(o1);
			if(no>0) {
			Order orno = os.selectOrder(no, userId);
			ArrayList<ProductImage> pino = ps.selectProductImage(pno[i]);
			Product product = ps.selectProduct2(pno[i], posize[i]);
			
			o.add(orno);
			p.add(product);
			pi.add(pino);
			} else {
				break;
			}
		}
		for(int j=0; j<o.size();j++) {
			int pono = os.selectOption(pno[j], posize[j]);
			new MyPageService().deleteshopping(o.get(j).getoCount(), pono, p.get(j).getpNo(), o.get(j).getmId());
		}
		if(i==size) {
		request.setAttribute("o", o);
		request.setAttribute("p", p);
		request.setAttribute("pi", pi);
		request.setAttribute("point", point);
		request.getRequestDispatcher("WEB-INF/views/order/order_complete.jsp").forward(request, response);
		} else {
			request.setAttribute("mag", "주문결제에 실패하였습니다.");
			request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response);
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
