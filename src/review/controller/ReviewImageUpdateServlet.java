package review.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import common.MyFileRenamePolicy;
import member.model.vo.Member;
import review.model.service.ReviewService;
import review.model.vo.Review;
import review.model.vo.ReviewImage;

/**
 * Servlet implementation class ReviewImageUpdateServlet
 */
@WebServlet("/reviewImageUpdate.re")
public class ReviewImageUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewImageUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		showRequestAllParameters(request);
	
		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 1024 * 1024 * 10; // 10Mbyte로 전송 파일 용량 제한
			String root = request.getSession().getServletContext().getRealPath("/");
			String savePath = root + "review_uploadFiles/";
			
			File f = new File(savePath);
			if(!f.exists()) {
				f.mkdirs();
			}
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			String writer = ((Member)request.getSession().getAttribute("loginUser")).getM_Id();
			int rId = Integer.parseInt(multiRequest.getParameter("rId"));
			int score = Integer.parseInt(multiRequest.getParameter("score"));
			String content = multiRequest.getParameter("content");
			
			ArrayList<String> saveFiles = new ArrayList<String>();
			ArrayList<String> originFiles = new ArrayList<String>();
			
			Enumeration<String> files = multiRequest.getFileNames();
			while(files.hasMoreElements()) {
				String name = files.nextElement();
				
				if(multiRequest.getFilesystemName(name) != null) {
					saveFiles.add(multiRequest.getFilesystemName(name));
					originFiles.add(multiRequest.getOriginalFileName(name));
				}
			}
			
			Review r = new Review();
			r.setR_writer(writer);
			r.setR_no(rId);
			r.setR_score(score);
			r.setR_content(content);
			
			ArrayList<ReviewImage> fileList = new ArrayList<ReviewImage>();
			for(int i = originFiles.size() - 1; i >= 0; i--) {
				ReviewImage ri = new ReviewImage();
				ri.setRi_filePath(savePath);
				ri.setRi_originName(originFiles.get(i));
				ri.setRi_changeName(saveFiles.get(i));
				ri.setR_no(r.getR_no());
				
				fileList.add(ri);
			}
			
			int result = new ReviewService().updateReviewImage(r, fileList);
			if(result > 0) {
				response.sendRedirect("reviewList.my");
			} else {
				for(int i = 0; i < saveFiles.size(); i++) {
					File failedFile = new File(savePath + saveFiles.get(i));
					failedFile.delete();
				}
				
				request.setAttribute("msg", "리뷰 등록에 실패했습니다.");
				request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response);
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	private void showRequestAllParameters (HttpServletRequest request) {
		
		//System.out.println("================= Request All Headers 브라우저 (Client) 요구 해더정보 ==================="); //주석처리해도 상관없음
		// 이부분은 모든 해더정보를 한번에 가져오는것이며  아래 while 에 루핑으로 돌면서 하나 하나 request.getHeader(string) 가져오는 것
		Enumeration<String> headerEnumList = request.getHeaderNames();
		while (headerEnumList.hasMoreElements()) {
		String string = (String) headerEnumList.nextElement();
		//System.err.println(string + " : " + request.getHeader(string)); //주석처리해도 상관없음
		}
		
		/* Body */
		//System.out.println("================= Request All Headers 브라우저 (Client) 요구 파라메터 ==================="); //주석처리해도 상관없음
		// 이부분은 모든 해더정보를 한번에 가져오는것이며  아래 while 에 루핑으로 돌면서 하나 하나 request.getParameter(string) 가져오는 것
		Enumeration<String> bodyEnumList = request.getParameterNames();
		while (bodyEnumList.hasMoreElements()) {
		String string = (String) bodyEnumList.nextElement();
		//System.err.println(string + " : " + request.getParameter(string)); //주석처리해도 상관없음
		}
		
	}

}
