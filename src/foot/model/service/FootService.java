package foot.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;

import static common.JDBCTemplate.getConnection;

import foot.model.dao.FootDAO;
import foot.model.vo.Foot;

public class FootService {

	public int insertFoot(Foot foot) {
		
		Connection conn = getConnection();
		int result = new FootDAO().insertFoot(conn, foot);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}

	public Foot selectFootInfo(String userId) {
		Connection conn = getConnection();
		Foot result = new FootDAO().selectFootInfo(conn, userId);
		
		if(result != null) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}

	public int updateInfo(Foot foot) {
		Connection conn = getConnection();
		int result = new FootDAO().updateInfo(conn, foot);

		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}
	

}
