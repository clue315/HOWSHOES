package address.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.rollback;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import address.model.dao.AddressDAO;
import address.model.vo.Address;

public class AddressService {

	public ArrayList<Address> selectAddress(String mId) {
		Connection conn = getConnection();
		
		ArrayList<Address> list = new AddressDAO().selectAddress(conn, mId);
		
		close(conn);
		return list;
	}

	public int AddressDelete(int no, String id) {
		Connection conn = getConnection();
		
		int result = new AddressDAO().deleteAddress(conn, no, id);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int AddressChange(int no, String id) {
		Connection conn = getConnection();
		AddressDAO dao = new AddressDAO();
		int result2 = 0;
		int result = dao.changeAlladdress(conn);
		
		if(result>0) {
			result2 = dao.changeAddress(conn, no, id);
			
			if(result2 > 0) {
				commit(conn);
			} else {
				rollback(conn);
			}
		} else {
			rollback(conn);
		}
		close(conn);
		return result2;
	}

	public int AddressInsert(Address a) {
		Connection conn = getConnection();
		AddressDAO dao = new AddressDAO();
		int result2 = dao.insertAddress(conn, a);
		
		if(result2 > 0) {
			commit(conn);
		} else {				
			rollback(conn);
		}
		close(conn);
		return result2;
	}

	public Address selectAddress2(String id, int no) {
		Connection conn = getConnection();
		
		Address a = new AddressDAO().selectAddress2(conn, id, no);
		close(conn);
		return a;
	}


	public int updateAddress(Address a) {
		Connection conn = getConnection();
		
		int result = new AddressDAO().updateAddress(conn, a);
		
		if(result >0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;

	}

	public void insertJoinAddress(String address, String m_Name, String phone, String m_Id) {
		Connection conn = getConnection();
		AddressDAO dao = new AddressDAO();
		int result = dao.insertJoinAddress(conn,address, m_Name,phone, m_Id);
		
		if(result > 0) {
			commit(conn);
		} else {				
			rollback(conn);
		}
		close(conn);
	
	}

}
