package review.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import review.model.vo.PageInfo;
import review.model.vo.Review;
import review.model.vo.ReviewImage;

public class ReviewDAO {
	
private Properties prop = new Properties();
	
	public ReviewDAO() {
		String fileName = ReviewDAO.class.getResource("/sql/review/review-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int getListCount(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("getListCount");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return result;
	}
	
	public int getListCount(Connection conn, String r_writer) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("getReviewListCount");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, r_writer);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}

	
//	public String getReviewListCount(Connection conn, String writer) {
//		PreparedStatement pstmt = null;
//		int count = 0;
//		String result = null;
//		System.out.println("dao_writer" + writer);
//		String query = prop.getProperty("getReviewListCount");
//		
//		try {
//			pstmt = conn.prepareStatement(query);
//			pstmt.setString(1, writer);
//			
//			count = pstmt.executeUpdate();
//			System.out.println("dao_count" + count);
//			result = Integer.toString(count);
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			close(pstmt);
//		}
//		System.out.println("dao_result" + result);
//		return result;
//	}

	public ArrayList<Review> selectList(Connection conn, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Review> list = new ArrayList<Review>();

		String query = prop.getProperty("selectList");
		
		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit() - 1;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Review r = new Review(rset.getInt("r_no"),
									  rset.getString("r_writer"),
									  rset.getInt("r_score"),
									  rset.getString("r_content"),
									  rset.getInt("r_count"),
									  rset.getDate("r_date"),
									  rset.getString("r_status"),
									  rset.getInt("p_no"));
				list.add(r);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public int insertReview(Connection conn, Review r) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertReview");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, r.getR_writer());
			pstmt.setInt(2, r.getR_score());
			pstmt.setString(3, r.getR_content());
			pstmt.setInt(4, r.getP_no());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		System.out.println("리뷰dao"+result);
		return result;
	}
	
	public Review selectReview(Connection conn, int rId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Review review = null;
		
		String query = prop.getProperty("selectReview");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, rId);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				review = new Review(rset.getInt("r_no"),
									rset.getString("r_writer"),
									rset.getInt("r_score"),
									rset.getString("r_content"),
									rset.getInt("r_count"),
									rset.getDate("r_date"),
									rset.getString("r_status"),
									rset.getInt("p_no"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return review;
	}
	
	public int updateCount(Connection conn, int no) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateCount");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, no);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateReview(Connection conn, Review review) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateReview");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, review.getR_score());
			pstmt.setString(2, review.getR_content());
			pstmt.setInt(3, review.getR_no());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	

	public int deleteReview(Connection conn, int rId) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteReview");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, rId);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	// 원래 사용 (사용자아이디, pi 받아옴)
	public ArrayList selectRList(Connection conn, Review r, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Review> list = null;
		
		String query = prop.getProperty("selectRList");
		
		String writer = r.getR_writer();
		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit() - 1;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, writer);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			list = new ArrayList<Review>();
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Review review = new Review(rset.getInt("r_no"),
										   rset.getString("r_writer"),
										   rset.getInt("r_score"),
										   rset.getString("r_content"),
										   rset.getInt("r_count"),
										   rset.getDate("r_date"),
										   rset.getString("r_status"),
										   rset.getInt("p_no"));
				list.add(review);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public ArrayList selectFList(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<ReviewImage> list = null;
		
		String query = prop.getProperty("selectFList");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
					
			list = new ArrayList<ReviewImage>();
			
			while(rset.next()) {
				list.add(new ReviewImage(rset.getInt("r_no"),
										 rset.getString("ri_change_name")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return list;
	}
	
	public ArrayList selectPDList(Connection conn, int pNo, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Review> list = null;
		
		String query = prop.getProperty("selectPDList");
		
		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit() - 1;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, pNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			list = new ArrayList<Review>();
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Review review = new Review(rset.getInt("r_no"),
										   rset.getString("r_writer"),
										   rset.getInt("r_score"),
										   rset.getString("r_content"),
										   rset.getInt("r_count"),
										   rset.getDate("r_date"),
										   rset.getString("r_status"),
										   rset.getInt("p_no"));
				list.add(review);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	public int insertReviewImage(Connection conn, ArrayList<ReviewImage> fileList) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertReviewImage");
		
		try {
			for(int i = 0; i < fileList.size(); i++) {
				
				ReviewImage ri = fileList.get(i);
				
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, ri.getRi_originName());
				pstmt.setString(2, ri.getRi_changeName());
				pstmt.setString(3, ri.getRi_filePath());
				
				result += pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} close(pstmt);
		
		return result;
	}


	public ArrayList<ReviewImage> selectReviewImage(Connection conn, int rId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<ReviewImage> list = null;
		
		String query = prop.getProperty("selectReviewImage");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, rId);
			rset = pstmt.executeQuery();
			
			list = new ArrayList<ReviewImage>();
			
			while(rset.next()) {
				ReviewImage ri = new ReviewImage();
				ri.setRi_no(rset.getInt("ri_no"));
				ri.setRi_no(rset.getInt("r_no"));
				ri.setRi_originName(rset.getString("ri_origin_name"));
				ri.setRi_changeName(rset.getString("ri_change_name"));
				ri.setRi_filePath(rset.getString("ri_file_path"));
				ri.setRi_uploadDate(rset.getDate("ri_upload_date"));
				ri.setRi_status(rset.getString("ri_status"));
				
				list.add(ri);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public int updateReviewImage(Connection conn, ArrayList<ReviewImage> fileList) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateReviewImage");
		
		try {
			for(int i = 0; i < fileList.size(); i++) {
				
				ReviewImage ri = fileList.get(i);
				
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, ri.getRi_originName());
				pstmt.setString(2, ri.getRi_changeName());
				pstmt.setString(3, ri.getRi_filePath());
				pstmt.setInt(4, ri.getR_no());
				
				result += pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} close(pstmt);
		
		return result;
	}
}
