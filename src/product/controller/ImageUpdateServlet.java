package product.controller;

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
import product.model.service.ProductService;
import product.model.vo.Product;
import product.model.vo.ProductImage;

/**
 * Servlet implementation class ImageUpdateServlet
 */
@WebServlet("/update.to")
public class ImageUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ImageUpdateServlet() {
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
			String root = request.getSession().getServletContext().getRealPath("/");// getRealPath : WebContent로 갈 수 있는 경로
			String savePath = root + "productImage_uploadFiles/" ; 
			
			
			File f = new File(savePath); 
			if(!f.exists()) {
				f.mkdirs();
		 
			} 
			
			   MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());		
				String pName = multiRequest.getParameter("pName");
				int price = Integer.parseInt(multiRequest.getParameter("price"));
				String info = multiRequest.getParameter("pInfo");
				int pcNo = Integer.parseInt(multiRequest.getParameter("pcNo"));
				int pNo = Integer.parseInt(multiRequest.getParameter("pNo"));
				System.out.println(pNo);
			
			ArrayList<String> saveFiles = new ArrayList<String>(); //바뀐 파일의 이름을 저장할 ArrayList
			ArrayList<String> originFiles = new ArrayList<String>(); // 원본 파일의 이름을 저장할 ArrayList
		
			
			Enumeration<String> files = multiRequest.getFileNames(); //폼에서 전송된 파일 리스트의 이름 반환
			while(files.hasMoreElements()) {
				String name = files.nextElement(); //★전송 순서는 역순으로!!가져올거다
				 
				if(multiRequest.getFilesystemName(name) != null) { //MyRenamePolicy의 작성한 내용대로 rename이 된 파일
					saveFiles.add(multiRequest.getFilesystemName(name)); //바뀐이름가지고 오는 거
					originFiles.add(multiRequest.getOriginalFileName(name)); //원래 이름 가지고 오는거ㅡ
				
				}
			}
			
			Product p = new Product();
			p.setpNo(pNo);
			p.setpName(pName);
			p.setpPrice(price);
			p.setpInfo(info);
			p.setPcNo(pcNo);
			
			
			ArrayList<ProductImage> fileList = new ArrayList<ProductImage>();
			for(int i = originFiles.size() - 1; i >= 0; i--) {
				ProductImage img = new ProductImage();
				img.setpNo(p.getpNo());
				img.setPiPath(savePath);
				img.setPiOriginName(originFiles.get(i));
				img.setPiChangeName(saveFiles.get(i));
				
				if( i == originFiles.size() - 1) {
					img.setFileLevel(0);
				}else {
					img.setFileLevel(1);
				}
				fileList.add(img);
			}
			System.out.println(fileList);
			
			int result = new ProductService().updateProductImage(p, fileList);
			
			
			if(result > 0) {
				response.sendRedirect("pro.to");
			}else {
				for(int i = 0; i < saveFiles.size(); i++) {
					File failedFile = new File(savePath + saveFiles.get(i));
					failedFile.delete();
				}
				
				request.setAttribute("msg", "상품 수정에 실패하였습니다.");
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
