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

/**
 * Servlet implementation class ChoseaddreessServlet
 */
@WebServlet("/choseaddress.ad")
public class ChoseaddreessServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChoseaddreessServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = ((Member)request.getSession().getAttribute("loginUser")).getM_Id();
		ArrayList<Address> aList = new AddressService().selectAddress(userId);
		
		request.setAttribute("aList", aList);
		request.getRequestDispatcher("WEB-INF/views/order/choseaddress.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
