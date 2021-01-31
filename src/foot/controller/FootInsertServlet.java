package foot.controller;

import java.io.IOException;
import java.util.Enumeration;

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
 * Servlet implementation class FootInsertServlet
 */
@WebServlet("/footInsert.no")
public class FootInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FootInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		// 웹브라우저에서 HTML 이든 JSP 든 Form 또는 어떤 형태로든 서버에 데이터를 넘기는 Servlet 으로 데이터를
		// 전달하는 것들이 어떤것들이 있는지 이클립스 콘솔에 출력 하는 기능 
		showRequestAllParameters(request);
		
		
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
		
		String irr[] = request.getParameterValues("form");
		String form = "";		
		
		if(irr != null) { 
			for(int i = 0; i < irr.length; i++) {
				if(i == irr.length - 1)
					form += irr[i];
			else 
				form += irr[i] + ",";
			}
		} 
	
	
		Foot foot = new Foot(length,dimensions,type,user);
		String page = null;
		int result = new FootService().insertFoot(foot);

		if(result > 0 ) {
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
		doGet(request, response);
	}

	
	private void showRequestAllParameters (HttpServletRequest request) {
		
		System.out.println("================= Request All Headers 브라우저 (Client) 요구 해더정보 ==================="); //주석처리해도 상관없음
		// 이부분은 모든 해더정보를 한번에 가져오는것이며  아래 while 에 루핑으로 돌면서 하나 하나 request.getHeader(string) 가져오는 것
		Enumeration<String> headerEnumList = request.getHeaderNames();
		while (headerEnumList.hasMoreElements()) {
			String string = (String) headerEnumList.nextElement();
			System.err.println(string + " : " + request.getHeader(string)); //주석처리해도 상관없음
		}
		
		/* Body */
		System.out.println("================= Request All Headers 브라우저 (Client) 요구 파라메터 ==================="); //주석처리해도 상관없음
		// 이부분은 모든 해더정보를 한번에 가져오는것이며  아래 while 에 루핑으로 돌면서 하나 하나 request.getParameter(string) 가져오는 것
		Enumeration<String> bodyEnumList = request.getParameterNames();
		while (bodyEnumList.hasMoreElements()) {
			String string = (String) bodyEnumList.nextElement();
			System.err.println(string + " : " + request.getParameter(string)); //주석처리해도 상관없음
		}
		
	}
	
	
	
}
