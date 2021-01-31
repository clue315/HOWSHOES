package board.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;

import board.model.dao.BoardDAO;
import board.model.vo.Board;
import board.model.vo.PageInfo;
import board.model.vo.Reply;

public class BoardService {

	public int getListCount() {
		Connection conn = getConnection();
		int result = new BoardDAO().getListCount(conn);
		
		close(conn);
		return result;
	}

	public ArrayList<Board> selectList(PageInfo pi) {
		Connection conn = getConnection();
		ArrayList<Board> list = new BoardDAO().selectList(conn, pi);
		
		close(conn);
		return list;
	}

//	public ArrayList selectQList(int i) {
//		Connection conn = getConnection();
//		
//		ArrayList list = null;
//		
//		BoardDAO dao = new BoardDAO();
//		
//		if(i == 2) {
//			list = dao.selectBList(conn);
//		}else {
//			list = dao.selectFList(conn);
//		}
//		
//		close(conn);
//		return list;
//	}

//	public int insertQnA(Board b, ArrayList<Attachment> fileList) {
//		Connection conn = getConnection();
//		
//		BoardDAO dao = new BoardDAO();
//		
//		int result1 = dao.insertBoard(conn, b);
//		int result2 = dao.insertAttachment(conn, fileList);
//		
//		if(result1 > 0 && result2 > 0) {
//			commit(conn);
//		} else {
//			rollback(conn);
//		}
//		close(conn);
//		return result1;
//	}


	public Board selectBoard(int bId) {
		Connection conn = getConnection();
		
		int result = new BoardDAO().updateCount(conn, bId);

		Board board = null;
		if(result> 0) {
			board = new BoardDAO().selectBoard(conn, bId);
			
			if(board != null) {
				commit(conn);
				
			}else {
				rollback(conn);
			}
		}
		
		
		close(conn);
		return board;
	}

	public int updateBoard(Board board) {
		Connection conn = getConnection();
		
		int result = new BoardDAO().updateBoard(conn, board);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int deleteBoard(int bId) {
		Connection conn = getConnection();
		
		int result = new BoardDAO().deleteBoard(conn, bId);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

//	public ArrayList<Attachment> selectThumbnail(int bId) {
//		Connection conn = getConnection();
//		
//		int result = new BoardDAO().updateCount(conn, bId);
//		
//		ArrayList<Attachment> list = null;
//		if(result > 0) {
//			list = new BoardDAO().selectThumbnail(conn, bId);
//			if(list != null) {
//				commit(conn);
//			}else {
//				rollback(conn);
//			}
//		}else {
//			rollback(conn);
//		}
//		close(conn);
//		return list;
//	}

	public ArrayList<Reply> selectReplyList(int bId) {
		Connection conn = getConnection();
		
		ArrayList<Reply> list = new BoardDAO().selectReplyList(conn, bId);
		
		close(conn);
		
		return list;
	}

	public ArrayList<Reply> insertReply(Reply r) {
		Connection conn = getConnection();
		
		BoardDAO bDAO = new BoardDAO();
		
		int result = bDAO.insertReply(conn, r);
		ArrayList<Reply> list = null;
		if(result >0) {
			commit(conn);
			list = bDAO.selectReplyList(conn, r.getRefBid());
		}else {
			rollback(conn);
		}
		
		close(conn);
		return list;
	}

	public int insertBoard(Board b) {
Connection conn = getConnection();
		
		BoardDAO dao = new BoardDAO();
		
		int result1 = dao.insertBoard(conn, b);
		
		
		if(result1 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result1;
	}

	public int deleteReply(int rId) {
		Connection conn = getConnection();
		
		int result = new BoardDAO().deleteReply(conn, rId);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	public ArrayList<Reply> deleteReply(int rId, int bId) {
		Connection conn = getConnection();
		
		BoardDAO bDAO = new BoardDAO();
		int result = bDAO.deleteReply(conn, rId);
		ArrayList<Reply> list = null;
		if(result > 0) {
			commit(conn);
			list = bDAO.selectReplyList(conn, bId);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return list;
	}

	
}
