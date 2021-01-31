package order.service;

import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import mypage.model.vo.Shopping;
import order.model.dao.OrderDAO;
import order.model.vo.Order;
import product.model.dao.ProductDAO;

public class orderService {

	public Order selectOrder(int no, String userId) {
		Connection conn = getConnection();
		Order list = new OrderDAO().selectOrder(conn, no, userId);
		close(conn);
		return list;
	}

	public int selectOption(int pno, int posize) {
		Connection conn = getConnection();
		int result = new OrderDAO().selectOption(conn, pno, posize);
		close(conn);
		return result;
	}

	public int insertOrder(Order o1) {
		Connection conn = getConnection();
		OrderDAO od = new OrderDAO();
		int result = od.insertOrder(conn, o1);
		
		if(result>0) {
			commit(conn);
			int result2 = od.selectOrderNo(conn, o1);
			close(conn);
			return result2;
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public ArrayList<Order> selectMyPageList(String loginUserId) {
		Connection conn = getConnection();
		
		ArrayList<Order> list = null;
			list = new OrderDAO().selectMyPageList(conn,loginUserId);
			
			if(list != null) {
				commit(conn);
			}else {
				rollback(conn);
			}
		close(conn);
		return list;
	}

	public ArrayList<Order> selectorder2(String m_Id) {
		Connection conn = getConnection();
		ArrayList<Order> oList = new OrderDAO().selectorder2(conn, m_Id);
		close(conn);
		return oList;
	}

	public ArrayList<Integer> selectOrderNo2(String m_Id) {
		Connection conn = getConnection();
		ArrayList<Integer> no = new OrderDAO().selectOrderNo2(conn, m_Id);
		close(conn);
		return no;
	}

	public int selectPno(int poSize) {
		Connection conn = getConnection();
		int pno = new OrderDAO().selectPno(conn, poSize);
		close(conn);
		return pno;
	}

	public int selectPno2(int poNo) {
		Connection conn = getConnection();
		int pno = new OrderDAO().selectPno2(conn, poNo);
		close(conn);
		return pno;
	}

	public int updateStatus(int no2) {
	Connection conn = getConnection();
		
		int result = 0;
		result = new OrderDAO().updateStatus(conn,no2);
			
			if(result > 0) {
				commit(conn);
			}else {
				rollback(conn);
			}
		close(conn);
		return result;
	}

}
