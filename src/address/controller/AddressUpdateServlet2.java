package address.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import address.model.vo.Address;
import address.service.AddressService;

/**
 * Servlet implementation class AddressUpdateServlet2
 */
@WebServlet("/address.ad")
public class AddressUpdateServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddressUpdateServlet2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		int no = Integer.parseInt(request.getParameter("no"));

		Address a = new AddressService().selectAddress2(id, no);
		if(a != null) {
		request.setAttribute("a", a);
		request.getRequestDispatcher("WEB-INF/views/address/updateAddressForm.jsp").forward(request, response);
		} else {
			request.setAttribute("msg", "배송지 불러오기 실패");
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
