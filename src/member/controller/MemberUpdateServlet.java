package member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class MemberUpdateServlet
 */
@WebServlet("/update.me")
public class MemberUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 request.setCharacterEncoding("UTF-8");
	        
	        String myId = request.getParameter("myId");
	        String myName = request.getParameter("myName");
	        String myPwd = request.getParameter("newPwd");
	        String myPhone = request.getParameter("myPhone");
	        String myAddress = request.getParameter("myAddress");
	        String myEmail = request.getParameter("myEmail");
	        
	        System.out.println(myId);
	        System.out.println(myName);
	        System.out.println(myPwd);
	        System.out.println(myPhone);
	        System.out.println(myAddress);
	        System.out.println(myEmail);
	        
	        Member myInfo = new Member(myId, myPwd ,myName, myPhone, myAddress, myEmail);
	        int result = new MemberService().updateMember(myInfo);
	        
	        String page = null;
	        if(result > 0) {
	        	page = "/mypageList.mp";
	        }else {
	        	page = "WEB-INF/views/common/errorPage.jsp";
	        	request.setAttribute("msg", "회원정보 수정에 실패했습니다");
	        	
	        	
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
