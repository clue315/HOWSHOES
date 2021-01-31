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
 * Servlet implementation class ImageUpdateFormServlet
 */
@WebServlet("/ImageUpdateForm.to")
public class ImageUpdateFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ImageUpdateFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		showRequestAllParameters(request);
		
		int pNo = Integer.parseInt(request.getParameter("pNo"));
		Product product = new ProductService().selectProduct(pNo);
		ArrayList<ProductImage> fileList = new ProductService().selectProductImage(pNo);
		
		String page = null;
		if(fileList != null) {
			request.setAttribute("product", product);
			request.setAttribute("fileList", fileList);
			page = "WEB-INF/views/product/ImageUpdateForm.jsp";
		}else {
			request.setAttribute("msg", "상품 수정에 실패하였습니다");
			page = "WEB-INF/views/common/errorPage.jsp";
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
	private void showRequestAllParameters (HttpServletRequest request) {
		
		Enumeration<String> headerEnumList = request.getHeaderNames();
		while (headerEnumList.hasMoreElements()) {
			String string = (String) headerEnumList.nextElement();
		}
		
		Enumeration<String> bodyEnumList = request.getParameterNames();
		while (bodyEnumList.hasMoreElements()) {
			String string = (String) bodyEnumList.nextElement();
		}
		
	}
	}
