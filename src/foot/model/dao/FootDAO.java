package foot.model.dao;

import static common.JDBCTemplate.close;


import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

import foot.model.vo.Foot;
import member.model.vo.Member;
import foot.model.dao.FootDAO;

public class FootDAO {
	
	private Properties prop = new Properties();
	
	public FootDAO() {
		String fileName = FootDAO.class.getResource("/sql/foot/foot-query.properties").getPath(); //드라이버 등록
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int insertFoot(Connection conn, Foot foot) {
		
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertFoot");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, foot.getF_Length());
			pstmt.setString(2, foot.getF_Width());
			pstmt.setString(3, foot.getF_Form());
			pstmt.setString(4, foot.getM_Id());
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public Foot selectFootInfo(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Foot foot = null;
		
		String query = prop.getProperty("selectFoot");
		
		try {
			pstmt =  conn.prepareStatement(query);
			pstmt.setString(1, userId);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				foot = new Foot(rset.getInt("f_no"),
								rset.getString("f_length"),
								rset.getString("f_width"),
								rset.getString("f_form"),
								rset.getString("m_id"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return foot;
	}

	public int updateInfo(Connection conn, Foot foot) {
		PreparedStatement pstmt = null;
		int result = 0;
		Foot f = null;
		
		String query = prop.getProperty("updateFoot");
		
		try {
			pstmt =  conn.prepareStatement(query);
			pstmt.setString(1, foot.getF_Length());
			pstmt.setString(2, foot.getF_Width());
			pstmt.setString(3, foot.getF_Form());
			pstmt.setString(4, foot.getM_Id());
			
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
