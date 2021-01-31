package review.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import review.model.dao.ReviewDAO;
import review.model.vo.PageInfo;
import review.model.vo.Review;
import review.model.vo.ReviewImage;

public class ReviewService {
	
	public int getListCount() {
		Connection conn = getConnection();
		int result = new ReviewDAO().getListCount(conn);
		close(conn);
		return result;
	}
	
	public int getListCount(String r_writer) {
		Connection conn = getConnection();
		int result = new ReviewDAO().getListCount(conn, r_writer);
		close(conn);
		return result;
	}
	
//	public  getReviewListCount(String writer) {
//		Connection conn = getConnection();
//		System.out.println("service_writer" + writer);
//		String result = new ReviewDAO().getReviewListCount(conn, writer);
//		close(conn);
//		return result;
//	}
	
	public ArrayList<Review> selectList(PageInfo pi) {
		Connection conn = getConnection();
		ArrayList<Review> list = new ReviewDAO().selectList(conn, pi);
		close(conn);
		return list;
	}
	
	public int insertReview(Review r) {
		Connection conn = getConnection();
				
		int result = new ReviewDAO().insertReview(conn, r);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	public Review selectReview(int rId) {
		Connection conn = getConnection();
		
		int result = new ReviewDAO().updateCount(conn, rId);
		
		Review review = null;
		if(result > 0) {
			review = new ReviewDAO().selectReview(conn, rId);
			
			if(review != null) {
				commit(conn);
			} else {
				rollback(conn);
			}
		}
		
		close(conn);
		return review;
	}
	
	public int updateReview(Review review) {
		Connection conn = getConnection();
		
		int result = new ReviewDAO().updateReview(conn, review);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);
		
		return result;
	}
	
	public int deleteReview(int rId) {
		Connection conn = getConnection();
		
		int result = new ReviewDAO().deleteReview(conn, rId);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	// 마이페이지 리뷰관리에서 리뷰 리스트 불러올때 사용
	public ArrayList selectRList(Review r, PageInfo pi) {
		Connection conn = getConnection();
		
		ArrayList list = new ReviewDAO().selectRList(conn, r, pi);
		
		close(conn);
		
		return list;
	}

	public ArrayList selectFList() {
		Connection conn = getConnection();
		
		ArrayList list = new ReviewDAO().selectFList(conn);
		
		close(conn);
		
		return list;
	}
	
	
	// 상품디테일페이지에서 리뷰 리스트 불러올 때 사용
	public ArrayList<Review> selectPDList(int pNo, PageInfo pi) {
		Connection conn = getConnection();
		
		ArrayList list = new ReviewDAO().selectPDList(conn, pNo, pi);
		
		close(conn);
		
		return list;
	}
	
	public int insertReviewImage(Review r, ArrayList<ReviewImage> fileList) {
		Connection conn = getConnection();
		
		ReviewDAO dao = new ReviewDAO();
		
		int result1 = dao.insertReview(conn, r);
		int result2 = dao.insertReviewImage(conn, fileList);
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result1;
	}

	public ArrayList<ReviewImage> selectReviewImage(int rId) {
		Connection conn = getConnection();
		int result = new ReviewDAO().updateCount(conn, rId);
		
		ArrayList<ReviewImage> list = null;
		if(result > 0) {
			list = new ReviewDAO().selectReviewImage(conn, rId);
			if(list != null) {
				commit(conn);
			} else {
				rollback(conn);
			}
		} else {
			rollback(conn);
		}
		
		close(conn);
		return list;
	}

	public int updateReviewImage(Review r, ArrayList<ReviewImage> fileList) {
		Connection conn = getConnection();
		
		ReviewDAO dao = new ReviewDAO();
		
		int result1 = dao.updateReview(conn, r);
		int result2 = 0;
		
//		System.out.println("updateService1 : " + result1);
//		System.out.println("updateService2 : " + result2);
		
		if(fileList.size() == 0) {
			result2 = 1; 
		}else {
			result2 = dao.updateReviewImage(conn, fileList);
		}
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result1;
	}
}
