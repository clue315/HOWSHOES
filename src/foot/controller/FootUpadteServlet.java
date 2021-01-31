package foot.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import foot.model.service.FootService;
import foot.model.vo.Foot;
import member.model.vo.Member;

/**
 * Servlet implementation class FootUpadteServlet
 */
@WebServlet("/footUpdate.no")
public class FootUpadteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FootUpadteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String length = request.getParameter("length");
		String dimensions = request.getParameter("dimensions");
		String type = request.getParameter("type");
		switch(type) {
		case "1": type="기본"; break;
		case "2": type="평발"; break;
		case "3": type="오목발"; break;
		case "4": type="칼발"; break;
		}
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");		
		String user = loginUser.getM_Id();
		
		Foot foot = new Foot(length, dimensions, type, user);
		int result = new FootService().updateInfo(foot);
		String page = null;
		if(result > 0) {
			response.sendRedirect("updateForm.me");
		}else {
			page="WEB-INF/views/common/errorPage.jsp";
			request.setAttribute("msg", "수정에 실패하였습니다.");
			request.getRequestDispatcher(page).forward(request, response);
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
