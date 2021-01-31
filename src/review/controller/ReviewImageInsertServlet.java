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
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import common.MyFileRenamePolicy;
import member.model.vo.Member;
import order.service.orderService;
import review.model.service.ReviewService;
import review.model.vo.Review;
import review.model.vo.ReviewImage;

/**
 * Servlet implementation class ReviewInsertServlet
 */
@WebServlet("/insertImage.re")
public class ReviewImageInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewImageInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
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
			
			String r_writer = ((Member)request.getSession().getAttribute("loginUser")).getM_Id();
			int r_score = Integer.parseInt(multiRequest.getParameter("score"));
			String r_content = multiRequest.getParameter("content");
			int no = Integer.parseInt(multiRequest.getParameter("no"));
			int no2 = Integer.parseInt(multiRequest.getParameter("no2"));

			
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
			r.setR_writer(r_writer);
			r.setR_score(r_score);
			r.setR_content(r_content);
			r.setP_no(no);
			ArrayList<ReviewImage> fileList = new ArrayList<ReviewImage>();
			for(int i = originFiles.size() - 1; i >= 0; i--) {
				ReviewImage ri = new ReviewImage();
				ri.setRi_filePath(savePath);
				ri.setRi_originName(originFiles.get(i));
				ri.setRi_changeName(saveFiles.get(i));
				
				fileList.add(ri);
			}
			
			int result = new ReviewService().insertReviewImage(r, fileList);
			if(result > 0) {
				new orderService().updateStatus(no2);
				response.sendRedirect("insertClear.re");
				
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

}
