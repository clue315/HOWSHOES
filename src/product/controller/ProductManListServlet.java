package product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import product.model.service.ProductService;
import product.model.vo.Product;
import product.model.vo.ProductImage;

/**
 * Servlet implementation class ProductManListServlet
 */
@WebServlet("/Man.ma")
public class ProductManListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductManListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int no = Integer.parseInt(request.getParameter("no"));
		String keyword = request.getParameter("keyword");
		if(keyword != null) {		  
		}else {
			keyword = "";
		}
		String page = null;
		ArrayList<Product> pList = null;
		ArrayList<ProductImage> fList = new ArrayList<ProductImage>();
		/*if (col.equals("all")) {
			pSearchList = new ProductService().selectTList(1);
			fSearchList = new ProductService().selectTList(2);
			 request.setAttribute("pSearchList", pSearchList);
			 request.setAttribute("fSearchList", fSearchList); 
			 page = "WEB-INF/views/product/productSearchList.jsp";
		} else if (col.equals("pname")) {*/
		
		pList = new ProductService().selectSneListSearch(keyword, no);
			if (pList != null) {
				 for(int i = 0; i <= pList.size()-1; i++) {					
					 fList.add(new ProductService().selectPiListSearch(pList.get(i).getpNo()));						 								 
				}
				 request.setAttribute("pList", pList);
				 request.setAttribute("fList", fList);
				 System.out.println(pList);
				 System.out.println(fList);
				 page = "WEB-INF/views/product/productManList.jsp";
			}else {
			request.setAttribute("msg", "상품검색에 실패했습니다.");
			request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response);
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
