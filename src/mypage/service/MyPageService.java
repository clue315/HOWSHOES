package mypage.service;

import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import mypage.model.dao.MyPageDAO;
import mypage.model.vo.Shopping;
import product.model.dao.ProductDAO;

public class MyPageService {
	
	public ArrayList<Shopping> selectShopping(String getmId) {
		Connection conn = getConnection();
		ArrayList<Shopping> sList = new MyPageDAO().selsectShopping(conn, getmId);
		System.out.println(sList);
		close(conn);
		return sList;
	}

	public void deleteshopping(int getoCount, int poSize, int getpNo, String id) {
		Connection conn = getConnection();
		MyPageDAO dao = new MyPageDAO();
		System.out.println("service: " + getoCount +"," + poSize +"," + getpNo+"," + id);
		int result=0;
		int count = dao.selectcountShopping(conn, getoCount, poSize, getpNo, id);
		if(count>0) {
			result = dao.deleteShopping(conn, getoCount, poSize, getpNo, id);
			if(result>0) {
				commit(conn);
			} else {
				rollback(conn);
			}
		}
		close(conn);
	}
	public ArrayList<Shopping> selectMyPageSpList(String loginUserId) {
		Connection conn = getConnection();
		
		ArrayList<Shopping> list = null;
			list = new MyPageDAO().selectMyPageSpList(conn,loginUserId);
			
			if(list != null) {
				commit(conn);
			}else {
				rollback(conn);
			}
		close(conn);
		return list;
	}


}
