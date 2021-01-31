package mypage.model.dao;

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

import address.model.dao.AddressDAO;
import mypage.model.vo.Shopping;

public class MyPageDAO {
	private Properties prop = new Properties();
	public MyPageDAO() {
		String fileName = AddressDAO.class.getResource("/sql/mypage/mypage-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public ArrayList<Shopping> selsectShopping(Connection conn, String getmId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Shopping> sList = new ArrayList<Shopping>();
		
		String query = prop.getProperty("selectshopping");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, getmId);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Shopping s = new Shopping(rset.getInt("sc_no"),
										  rset.getDate("sc_date"),
										  rset.getInt("sc_count"),
										  rset.getInt("po_size"),
										  rset.getInt("p_no"),
										  rset.getString("m_id"));
				sList.add(s);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return sList;
	}
	
	public ArrayList<Shopping> selectMyPageSpList(Connection conn, String loginUserId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null; 
		ArrayList<Shopping> list = null;
		
		String query = prop.getProperty("selectMypageList");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, loginUserId);		
			rset = pstmt.executeQuery();
			list = new ArrayList<Shopping>();
			
			while(rset.next()) {
				list.add(new Shopping(rset.getInt("sc_no"),
									 rset.getDate("sc_date"),
									 rset.getInt("sc_count"),
									 rset.getInt("po_size"),
									 rset.getInt("p_no"),
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
	
	
	
	public int selectcountShopping(Connection conn, int getoCount, int poSize, int getpNo, String id) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int count = 0;
		
		String query = prop.getProperty("selectcountShopping");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, getoCount);
			pstmt.setInt(2, poSize);
			pstmt.setInt(3, getpNo);
			pstmt.setString(4, id);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		System.out.println("DAO: "+ count);
		return count;
	}
	public int deleteShopping(Connection conn, int getoCount, int poSize, int getpNo, String id) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteShopping");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, getoCount);
			pstmt.setInt(2, poSize);
			pstmt.setInt(3, getpNo);
			pstmt.setString(4, id);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		System.out.println("DAO: "+ result);
		return result;
	}

}
