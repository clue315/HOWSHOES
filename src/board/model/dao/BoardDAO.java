package board.model.dao;

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
import board.model.vo.Board;
import board.model.vo.PageInfo;
import board.model.vo.Reply;
public class BoardDAO {
	
	private Properties prop = new Properties();
	
	public BoardDAO() {
		String fileName = BoardDAO.class.getResource("/sql/board/board-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	public int getListCount(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query =prop.getProperty("getListCount");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				result = rset.getInt(1);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				close(rset);
				close(stmt);
			}
		
		return result;
	}
	public ArrayList<Board> selectList(Connection conn, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = new ArrayList<Board>();
		
		String query = prop.getProperty("selectList");
		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit() - 1;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Board b = new Board(rset.getInt("b_no"),
							   rset.getInt("b_type"),
							   rset.getString("qc_name"),
							   rset.getString("b_title"),
							   rset.getString("b_content"),
							   rset.getString("b_writer"),
							   rset.getString("m_id"),
							   rset.getInt("b_count"),
							   rset.getDate("create_date"),
							   rset.getDate("modify_date"),
							   rset.getString("status"));
				list.add(b);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	public ArrayList selectBList(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = null;
		
		String query = prop.getProperty("selectQList");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<Board>();
			while(rset.next()) {
				list.add(new Board(rset.getInt("b_no"),
								   rset.getInt("b_type"),
								   rset.getString("qc_name"),
								   rset.getString("b_title"),
								   rset.getString("b_content"),
								   rset.getString("b_writer"),
								   rset.getString("m_id"),
								   rset.getInt("b_count"),
								   rset.getDate("create_date"),
								   rset.getDate("modify_date"),
								   rset.getString("status")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		
		return list;
	}
//	public ArrayList selectFList(Connection conn) {
//		Statement stmt = null;
//		ResultSet rset = null;
//		ArrayList<Attachment> list = null;
//		
//		String query = prop.getProperty("selectFList");
//		
//		try {
//			stmt = conn.createStatement();
//			rset = stmt.executeQuery(query);
//			
//			list = new ArrayList<Attachment>();
//			
//			while(rset.next()) {
//				list.add(new Attachment(rset.getInt("b_no"), 
//										rset.getString("change_name")));
//			}
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		
//		
//		return list;
//	}
	public int insertBoard(Connection conn, Board b) {
		PreparedStatement pstmt = null;
		int result= 0;
		
		String query = prop.getProperty("insertBoard");
		
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, b.getbType());
			pstmt.setInt(2, Integer.parseInt(b.getQcName()));
			pstmt.setString(3, b.getbTitle());
			pstmt.setString(4, b.getbContent());
			pstmt.setString(5, b.getbWriter());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
//	public int insertAttachment(Connection conn, ArrayList<Attachment> fileList) {
//		PreparedStatement pstmt = null;
//		int result = 0;
//		
//		String query = prop.getProperty("insertAttachment");
//		
//		
//		try { 
//			for(int i = 0; i < fileList.size(); i++) {
//				Attachment at = fileList.get(i);
//				
//				pstmt = conn.prepareStatement(query);
//				pstmt.setString(1, at.getOriginName());
//				pstmt.setString(2, at.getChangeName());
//				pstmt.setString(3, at.getFilePath());
//				pstmt.setInt(4, at.getFileLevel());
//				
//				result += pstmt.executeUpdate();
//			}
//			
//			
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} finally {
//			close(pstmt);
//		}
//		
//		return result;
//	}
	public Board selectBoard(Connection conn, int bId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Board board = null;
		
		String query = prop.getProperty("detailBoard");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bId);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				board = new Board(rset.getInt("b_no"),
							   rset.getInt("b_type"),
							   rset.getString("qc_name"),
							   rset.getString("b_title"),
							   rset.getString("b_content"),
							   rset.getString("b_writer"),
							   rset.getString("m_id"),
							   rset.getInt("b_count"),
							   rset.getDate("create_date"),
							   rset.getDate("modify_date"),
							   rset.getString("status"));
											
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return board;
	}
	public int updateCount(Connection conn, int bId) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateCount");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bId);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	public int updateBoard(Connection conn, Board board) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateBoard");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(board.getQcName()));
			pstmt.setString(2, board.getbTitle());
			pstmt.setString(3, board.getbContent());
			pstmt.setInt(4, board.getbNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	public int deleteBoard(Connection conn, int bId) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteBoard");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bId);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
//	public ArrayList<Attachment> selectThumbnail(Connection conn, int bId) {
//		PreparedStatement pstmt = null;
//		ResultSet rset = null;
//		ArrayList<Attachment> list = null;
//		
//		String query = prop.getProperty("selectThumbnail");
//		
//		try {
//			pstmt = conn.prepareStatement(query);
//			pstmt.setInt(1, bId);
//			rset = pstmt.executeQuery();
//			
//			list = new ArrayList<Attachment>();
//			
//			while(rset.next()) {
//				Attachment at = new Attachment();
//				at.setFileId(rset.getInt("file_id"));
//				at.setOriginName(rset.getString("origin_name"));
//				at.setChangeName(rset.getString("change_name"));
//				at.setFilePath(rset.getString("file_path"));
//				at.setUploadDate(rset.getDate("upload_date"));
//				
//				list.add(at);
//			}
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} finally {
//			close(rset);
//			close(pstmt);
//		}
//		
//		return list;
//	}
	public ArrayList<Reply> selectReplyList(Connection conn, int bId) {
		PreparedStatement pstmt = null;
		ResultSet rset= null;
		ArrayList<Reply> list = null;
		
		String query = prop.getProperty("selectReplyList");
		
		try {
			pstmt= conn.prepareStatement(query);
			pstmt.setInt(1, bId);
			rset = pstmt.executeQuery();
			list = new ArrayList<Reply>();
			
			while(rset.next()) {
				list.add(new Reply(rset.getInt("r_no"),
								   rset.getString("r_content"),
								   rset.getInt("ref_bid"),
								   rset.getString("m_id"),
								   rset.getDate("create_date"),
								   rset.getDate("modify_date"),
								   rset.getString("status")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	public int insertReply(Connection conn, Reply r) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertReply");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, r.getReplyContent());
			pstmt.setInt(2, r.getRefBid());
			pstmt.setString(3, r.getReplyWriter());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	public int deleteReply(Connection conn, int rId) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteReply");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, rId);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

}
