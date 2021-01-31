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
 * Servlet implementation class ProductRankingServlet
 */
@WebServlet("/rank.po")
public class ProductRankingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductRankingServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int no = Integer.parseInt(request.getParameter("no"));
		
		ProductService service = new ProductService();
		String str = "";
		
		ArrayList<Product> pList = new ArrayList<Product>(); // 상품
		ArrayList<ProductImage> fList = new ArrayList<ProductImage>();
		String page = null;
		
		
		
		if(no ==1) {
			str="넓은 발";
			pList = service.selectRankSortList(str); 

			if (pList != null) {
				 for(int i = 0; i <= pList.size()-1; i++) {					
					 fList.add(new ProductService().selectPiListSearch(pList.get(i).getpNo()));						 								 
				}
					  request.setAttribute("pList", pList);
					  request.setAttribute("fList", fList); 
					  page = "WEB-INF/views/common/main.jsp";		 
			}
		}else if(no == 2) {
			str="좁은 발";
			pList = service.selectRankSortList(str); 
			if (pList != null) {
				 for(int i = 0; i <= pList.size()-1; i++) {					
					 fList.add(new ProductService().selectPiListSearch(pList.get(i).getpNo()));						 								 
				}
				 request.setAttribute("pList", pList);
				 request.setAttribute("fList", fList);
				 page = "WEB-INF/views/common/main.jsp";		
			}
		}else if(no == 3) {
			str="평발";
			pList = service.selectRankSortList(str); 
			if (pList != null) {
				 for(int i = 0; i <= pList.size()-1; i++) {					
					 fList.add(new ProductService().selectPiListSearch(pList.get(i).getpNo()));						 								 
				}
				 
				 request.setAttribute("pList", pList);
				 request.setAttribute("fList", fList);
				 page = "WEB-INF/views/common/main.jsp";		
			}
		}else if(no == 4) {
			str="오목발";
			pList = service.selectRankSortList(str);
			if (pList != null) {
				 for(int i = 0; i <= pList.size()-1; i++) {					
					 fList.add(new ProductService().selectPiListSearch(pList.get(i).getpNo()));						 								 
				}
				 request.setAttribute("pList", pList);
				 request.setAttribute("fList", fList);
				 page = "WEB-INF/views/common/main.jsp";
			}
		}else if(no == 5) {
			str="칼발";
			pList = service.selectRankSortList(str); 
			if (pList != null) {
				 for(int i = 0; i <= pList.size()-1; i++) {					
					 fList.add(new ProductService().selectPiListSearch(pList.get(i).getpNo()));						 								 
				}
				 request.setAttribute("pList", pList);
				 request.setAttribute("fList", fList);
				 page = "WEB-INF/views/common/main.jsp";
			}
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
