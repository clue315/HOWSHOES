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
 * Servlet implementation class ProductListSortServlet
 */
@WebServlet("/listSort.to")
public class ProductListSortServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductListSortServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int no = Integer.parseInt(request.getParameter("no"));
		ProductService service = new ProductService();
		
		
		ArrayList<Product> pList = new ArrayList<Product>(); // 상품
		ArrayList<ProductImage> fList = new ArrayList<ProductImage>();
		String page = null;
		
		
		
		if(no ==1) {
			pList = service.selectAllPoSortList(1); // 인기
			if (pList != null) {
				 for(int i = 0; i <= pList.size()-1; i++) {					
					 fList.add(new ProductService().selectPiListSearch(pList.get(i).getpNo()));						 								 
				}
				 System.out.println(pList);
				 System.out.println(fList);
					
					  request.setAttribute("pList", pList);
					  request.setAttribute("fList", fList); 
					  page = "WEB-INF/views/product/productTotalList.jsp";		 
			}
		}else if(no == 2) {
			pList = service.selectAllNewSortList(1); // 최신
			if (pList != null) {
				 for(int i = 0; i <= pList.size()-1; i++) {					
					 fList.add(new ProductService().selectPiListSearch(pList.get(i).getpNo()));						 								 
				}
				 request.setAttribute("pList", pList);
				 request.setAttribute("fList", fList);
				 page = "WEB-INF/views/product/productTotalList.jsp";
			}
		}else if(no == 3) {
			pList = service.selectAllLowSortList(1); // 낮은
			if (pList != null) {
				 for(int i = 0; i <= pList.size()-1; i++) {					
					 fList.add(new ProductService().selectPiListSearch(pList.get(i).getpNo()));						 								 
				}
				 request.setAttribute("pList", pList);
				 request.setAttribute("fList", fList);
				 page = "WEB-INF/views/product/productTotalList.jsp";
			}
		}else if(no == 4) {
			pList = service.selectAllHighSortList(1); // 높은
			if (pList != null) {
				 for(int i = 0; i <= pList.size()-1; i++) {					
					 fList.add(new ProductService().selectPiListSearch(pList.get(i).getpNo()));						 								 
				}
				 request.setAttribute("pList", pList);
				 request.setAttribute("fList", fList);
				 page = "WEB-INF/views/product/productTotalList.jsp";
			}
		
//		}else if(keyword != null){
//			pSortList = new ProductService().selectListSearch(keyword);
//			
//				 for(int i = 0; i <= pSortList.size()-1; i++) {					
//					 fSortList.add(new ProductService().selectPiListSearch(pSortList.get(i).getPno()));						 								 
//				}
//				 System.out.println(pSortList);
//				 System.out.println(fSortList);
//				 request.setAttribute("pSortList", pSortList);
//				 request.setAttribute("fSortList", fSortList);
//				 page = "WEB-INF/views/product/productSearchList.jsp";
		
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
