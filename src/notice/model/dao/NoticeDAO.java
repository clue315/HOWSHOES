package notice.model.dao;

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

import notice.model.vo.Notice;
import notice.model.vo.PageInfo;

public class NoticeDAO {

	private Properties prop = new Properties();
	
	public NoticeDAO() {
		String fileName = NoticeDAO.class.getResource("/sql/notice/notice-query.properties").getPath();
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


		public ArrayList<Notice> selectList(Connection conn, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Notice> list = new ArrayList<Notice>();
		
		String query = prop.getProperty("selectList");
		
		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit() - 1;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Notice no = new Notice(rset.getInt("n_no"),
									   rset.getString("n_title"),
									   rset.getString("n_content"),
									   rset.getString("n_writer"),
									   rset.getInt("n_count"),
									   rset.getDate("n_date"));
				list.add(no);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
//	public ArrayList<Notice> selectList(Connection conn) {
//		Statement stmt = null;
//		ResultSet rset = null;
//		ArrayList<Notice> list = new ArrayList<Notice>();
//		
//		String query = prop.getProperty("selectList");
//		
//		try {
//			stmt = conn.createStatement();
//			rset = stmt.executeQuery(query);
//			while(rset.next()) {
//				Notice no = new Notice(rset.getInt("n_no"),
//									   rset.getString("n_title"),
//									   rset.getString("n_content"),
//									   rset.getString("n_writer"),
//									   rset.getInt("n_count"),
//									   rset.getDate("n_date"));
//				list.add(no);
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			close(rset);
//			close(stmt);
//		}
//		
//		return list;
//	}

	public int insertNotice(Connection conn, Notice n) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertNotice");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, n.getN_title());
			pstmt.setString(2, n.getN_content());
			pstmt.setString(3, n.getN_writer());
			
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public Notice selectNotice(Connection conn, int no) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Notice n = null;
		
		String query = prop.getProperty("selectNotice");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, no);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				n = new Notice(rset.getInt("n_no"),
							   rset.getString("n_title"),
							   rset.getString("n_content"),
							   rset.getString("n_writer"),
							   rset.getInt("n_count"),
							   rset.getDate("n_date"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return n;
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

	public int updateNotice(Connection conn, Notice notice) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateNotice");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, notice.getN_title());
			pstmt.setString(2, notice.getN_content());
			pstmt.setInt(3, notice.getN_no());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int deleteNotice(Connection conn, int no) {
		PreparedStatement pstmt = null;
		
		int result = 0;
		
		String query = prop.getProperty("deleteNotice");
		
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
}
