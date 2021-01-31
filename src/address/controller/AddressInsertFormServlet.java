package address.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import address.model.vo.Address;
import address.service.AddressService;
import member.model.vo.Member;

/**
 * Servlet implementation class AddressInsertFormServlet
 */
@WebServlet("/insert2.ad")
public class AddressInsertFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddressInsertFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member m =(Member)request.getSession().getAttribute("loginUser");
	    String id = m.getM_Id();
		Address a = new Address(0, "", "", "", "", "", id);
		
		request.setAttribute("a", a);
		request.getRequestDispatcher("WEB-INF/views/address/updateAddressForm.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
