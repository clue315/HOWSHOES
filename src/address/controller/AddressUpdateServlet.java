package address.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import address.model.vo.Address;
import address.service.AddressService;

/**
 * Servlet implementation class AddressUpdateServlet
 */
@WebServlet("/update.ad")
public class AddressUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddressUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("inputName");
		String person = request.getParameter("inputPerson");
		String address = request.getParameter("inputAddress");
		String phone = request.getParameter("inputPhone");
		String id = request.getParameter("id");
		int no = Integer.parseInt(request.getParameter("no"));
		int result = 0;

		Address a = new Address(no,name,person,address,phone,"N",id);
		
		if(no == 0) {
			result= new AddressService().AddressInsert(a);
		} else {
			result = new AddressService().updateAddress(a);
		}
			
		if(result >0) {
			response.setContentType("text/html; charset=euc-kr"); //한글이 인코딩
			   PrintWriter out = response.getWriter(); //선언
			   String str="";
			   str = "<script language='javascript'>";
			   str += "opener.window.location.reload();";  //오프너 새로고침
			   str += "self.close();";   // 창닫기
			   str += "</script>";
			   out.print(str);
		} else {
			request.setAttribute("msg", "배송지 수정에 실패하였습니다.");
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
