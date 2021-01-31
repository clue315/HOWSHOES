package order.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import address.model.vo.Address;
import address.service.AddressService;
import member.model.vo.Member;
import product.model.service.ProductService;
import product.model.vo.Product;
import product.model.vo.ProductImage;

/**
 * Servlet implementation class OrderListServlet
 */
@WebServlet("/orderList.or")
public class OrderListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ProductService ps = new ProductService();
		String test = request.getParameter("ad");
		String[] t = test.split(",");
		
		int[] pcount = new int[t.length/3];
		int[] posize = new int[t.length/3];
		int[] pno = new int[t.length/3];
		int i, j =0;
			for(i =0; i<t.length; i++) {
				if(i<pno.length) {
					pno[j++] = Integer.parseInt(t[i]);
					if(j==pno.length) {
						j=0;
					}
				} else if(i<(posize.length*2)) {
					posize[j++] = Integer.parseInt(t[i]);
					if(j==posize.length) {
						j=0;
					}
				} else {
					pcount[j++] = Integer.parseInt(t[i]);
				}
			}
		
		ArrayList<Integer> inventory = new ArrayList<Integer>();
		ArrayList<Product> p = new ArrayList<Product>();
		ArrayList<ArrayList<ProductImage>> pi =new ArrayList<ArrayList<ProductImage>>();
		
		for(i =0; i<pcount.length;i++) {
			inventory.add(ps.selectInventory(pno[i], posize[i]));
			Product list2 = ps.selectProduct2(pno[i], posize[i]);
			ArrayList<ProductImage> list3 = ps.selectProductImage(pno[i]);
			
	
			p.add(list2);
			pi.add(list3);
			
		}
		
		
		Member m = (Member)request.getSession().getAttribute("loginUser");
		ArrayList<Address> list = new AddressService().selectAddress(m.getM_Id());
		Address a = null;
		
		for(i = 0; i<list.size(); i++) {
			if(list.get(i).getChose().equals("Y")) {
				a = new Address(list.get(i).getNo(),
								list.get(i).getName(),
								list.get(i).getPerson(),
								list.get(i).getAddress(),
								list.get(i).getPhone(),
								list.get(i).getChose(),
								list.get(i).getMId());
			}
		}
		request.setAttribute("inventry", inventory);
		request.setAttribute("count", pcount);
		request.setAttribute("p", p);
		request.setAttribute("pi", pi);
		request.setAttribute("m", m);
		request.setAttribute("a", a);
		
		request.getRequestDispatcher("WEB-INF/views/order/order.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
