package foot.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import foot.model.service.FootService;
import foot.model.vo.Foot;
import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class FootUpdateFormServlet
 */
@WebServlet("/updateform.fo")
public class FootUpdateFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FootUpdateFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String userId = ((Member)request.getSession().getAttribute("loginUser")).getM_Id();
		Foot footInfo = new FootService().selectFootInfo(userId);
		
		request.setAttribute("footInfo", footInfo);
		System.out.println(footInfo);
		request.getRequestDispatcher("WEB-INF/views/foot/footCheckUpdate.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
