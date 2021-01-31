package address.model.dao;

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

import address.model.vo.Address;

public class AddressDAO {
private Properties prop = new Properties();
	
	public AddressDAO() {
		String fileName = AddressDAO.class.getResource("/sql/address/address-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public ArrayList<Address> selectAddress(Connection conn, String mId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Address> list = new ArrayList<Address>();

		String query = prop.getProperty("selectAddress");
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, mId);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				Address a = new Address(rset.getInt("a_no"),
										rset.getString("a_name"),
										rset.getString("a_person"),
										rset.getString("a_address"),
										rset.getString("a_phone"),
										rset.getString("a_chose"),
										rset.getString("m_id"));
				list.add(a);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	public int deleteAddress(Connection conn, int no, String id) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteAddress");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, no);
			pstmt.setString(2, id);
			
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public int changeAddress(Connection conn, int no, String id) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("changeAddress");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, no);
			pstmt.setString(2, id);
			
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public int changeAlladdress(Connection conn) {
		Statement stmt = null;
		int result = 0;
		
		String query = prop.getProperty("changeAllAddress");
		
		try {
			stmt = conn.createStatement();
			result = stmt.executeUpdate(query);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
		}
		return result;
	}
	public int countaddress(Connection conn, String mId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("countaddress");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, mId);
			
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
	public int insertAddress(Connection conn, Address a) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertAddress");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, a.getName());
			pstmt.setString(2, a.getPerson());
			pstmt.setString(3, a.getAddress());
			pstmt.setString(4, a.getPhone());
			pstmt.setString(5, a.getMId());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int insertJoinAddress(Connection conn, String address, String m_Name, String phone, String m_Id) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertJoinAddress");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "집");  //서블릿에서 집
			pstmt.setString(2, m_Name);
			pstmt.setString(3, address);
			pstmt.setString(4, phone);
			pstmt.setString(5, m_Id);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	public Address selectAddress2(Connection conn, String id, int no) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Address a = new Address();

		String query = prop.getProperty("selectAddress2");
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, id);
			pstmt.setInt(2, no);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
						a = new Address(rset.getInt("a_no"),
										rset.getString("a_name"),
										rset.getString("a_person"),
										rset.getString("a_address"),
										rset.getString("a_phone"),
										rset.getString("a_chose"),
										rset.getString("m_id"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return a;
	}
	public int updateAddress(Connection conn, Address a) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateAddress");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, a.getName());
			pstmt.setString(2, a.getPerson());
			pstmt.setString(3, a.getPhone());
			pstmt.setString(4, a.getAddress());
			pstmt.setInt(5, a.getNo());
			pstmt.setString(6, a.getMId());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
}
