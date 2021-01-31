package member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import address.service.AddressService;
import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class MemberInsertServlet
 */
@WebServlet("/insert.me")
public class MemberInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
	      
	      String userId = request.getParameter("userId");
	      String userPwd = request.getParameter("userPwd");
	      String userName = request.getParameter("userName");
	      String phone = request.getParameter("Phone");
	      String address = request.getParameter("Address");
	      String email = request.getParameter("Email");
	    
	       
	      Member member = new Member(userId, userPwd, userName, phone,address,email);
	    
	      
	      
	      int result = new MemberService().insertMember(member);
	      if(result >0) {
	    	  new AddressService().insertJoinAddress(member.getAddress(),member.getM_Name(),member.getPhone(),member.getM_Id());
	    	  request.setAttribute("member",member.getM_Name());
	    	  request.getRequestDispatcher("WEB-INF/views/member/loginPage.jsp").forward(request,  response);
	    	  
	      } else {
	         request.setAttribute("msg", "회원가입에 실패하였습니다.");
	         request.getRequestDispatcher("WEB-INF/views/common/eorrorPage.jsp").forward(request,  response);
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
