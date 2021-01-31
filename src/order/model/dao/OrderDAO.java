package order.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import mypage.model.vo.Shopping;
import order.model.vo.Order;

public class OrderDAO {
	private Properties prop = new Properties();
	public OrderDAO() {
		String fileName = OrderDAO.class.getResource("/sql/order/order-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public Order selectOrder(Connection conn, int no, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Order o = null;
		
		String query = prop.getProperty("selectOrder");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, no);
			pstmt.setString(2, userId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				o = new Order(rset.getInt("o_no"),
							  rset.getInt("o_count"),
							  rset.getInt("o_total"),
							  rset.getInt("o_sale"),
							  rset.getString("o_name"),
							  rset.getString("o_address"),
					  		  rset.getString("o_phone"),
							  rset.getString("o_comment"),
						  	  rset.getString("o_status"),
							  rset.getDate("o_date"),
							  rset.getInt("po_size"),
							  rset.getString("m_id"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return o;
	}

	public int selectOption(Connection conn, int pno, int posize) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("selectOption");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, pno);
			pstmt.setInt(2, posize);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt("po_no");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}

	public int insertOrder(Connection conn, Order o1) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("insertOrder");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, o1.getoCount());
			pstmt.setInt(2, o1.getoTotal());
			pstmt.setInt(3, o1.getoSale());
			pstmt.setString(4, o1.getoName());
			pstmt.setString(5, o1.getoAddress());
			pstmt.setString(6, o1.getoPhone());
			pstmt.setString(7, o1.getoComment());
			pstmt.setInt(8, o1.getPoSize());
			pstmt.setString(9, o1.getmId());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int selectOrderNo(Connection conn, Order o1) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("selectOrderNo");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, o1.getmId());
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt("o_no");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}

	public ArrayList<Order> selectMyPageList(Connection conn, String loginUserId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null; 
		ArrayList<Order> list = null;
		
		String query = prop.getProperty("selectMypageList");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, loginUserId);		
			rset = pstmt.executeQuery();
			list = new ArrayList<Order>();
			
			while(rset.next()) {
				list.add(new Order(rset.getInt("o_no"),
									 rset.getInt("o_count"),
									 rset.getInt("o_total"),
									 rset.getInt("o_sale"),
									 rset.getString("o_name"),
									 rset.getString("o_address"),
									 rset.getString("o_phone"),
									 rset.getString("o_comment"),
									 rset.getString("o_status"),
									 rset.getDate("o_date"),									
									 rset.getInt("po_size"),
									 rset.getString("m_id")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public ArrayList<Order> selectorder2(Connection conn, String m_Id) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Order> oList = new ArrayList<Order>();
		
		String query = prop.getProperty("selectorder2");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, m_Id);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Order o = new Order(rset.getInt("o_no"),
						  rset.getInt("o_count"),
						  rset.getInt("o_total"),
						  rset.getInt("o_sale"),
						  rset.getString("o_name"),
						  rset.getString("o_address"),
				  		  rset.getString("o_phone"),
						  rset.getString("o_comment"),
					  	  rset.getString("o_status"),
						  rset.getDate("o_date"),
						  rset.getInt("po_no"),
						  rset.getString("m_id"));
				oList.add(o);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return oList;
	}

	public ArrayList<Integer> selectOrderNo2(Connection conn, String m_Id) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Integer> result = new ArrayList<Integer>();
		
		String query = prop.getProperty("selectOrderNo2");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, m_Id);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				int i = rset.getInt("o_no");
				result.add(i);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}

	public int selectPno(Connection conn, int poNo) {
		PreparedStatement pstmt = null;
		ResultSet rset= null;
		int pno = 0;
		String query = prop.getProperty("selectPno");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, poNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				pno = rset.getInt("p_no");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return pno;
	}

	public int selectPno2(Connection conn, int poNo) {
		PreparedStatement pstmt = null;
		ResultSet rset= null;
		int pno = 0;
		String query = prop.getProperty("selectPno2");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, poNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				pno = rset.getInt("p_no");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return pno;
	}

	public int updateStatus(Connection conn, int no2) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("updateStatus");
		System.out.println(no2);
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, no2);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	
}
