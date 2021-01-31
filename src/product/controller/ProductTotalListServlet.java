package product.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import product.model.service.ProductService;
import product.model.vo.Product;
import product.model.vo.ProductImage;

/**
 * Servlet implementation class ProductTotalListServlet
 */
@WebServlet("/pro.to")
public class ProductTotalListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductTotalListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
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
		pList = new ProductService().selectListSearch(keyword);
			if (pList != null) {
				 for(int i = 0; i <= pList.size()-1; i++) {					
					 fList.add(new ProductService().selectPiListSearch(pList.get(i).getpNo()));						 								 
				}
				 request.setAttribute("pList", pList);
				 request.setAttribute("fList", fList);
				 System.out.println(fList);
				 System.out.println(fList);
				 page = "WEB-INF/views/product/productTotalList.jsp";
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

