package member.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import member.model.vo.Member;

public class MemberDAO {
	
	private Properties prop = new Properties();
	
	public MemberDAO() {
		String fileName = MemberDAO.class.getResource("/sql/member/member-query.properties").getPath();
		
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

	public Member loginMember(Connection conn, Member member) {
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			Member loginUser = null;
			
			String query = prop.getProperty("loginMember");
			
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, member.getM_Id());
				pstmt.setString(2, member.getM_Pwd());
				
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					loginUser = new Member(
										   rset.getString("M_ID"),
										   rset.getString("M_PWD"),
										   rset.getString("M_NAME"),
										   rset.getString("M_PHONE"),
										   rset.getString("M_ADDRESS"),
										   rset.getString("M_EMAIL"),
										   rset.getInt("M_POINT"),
										   rset.getDate("M_ENROLL_DATE"),
										   rset.getDate("M_MODIFY_DATE"),
										   rset.getString("M_STATUS"));
				
					}
				
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} finally {
					close(rset);
					close(pstmt);
				}
				
				
				
				return loginUser;
			}
	public int insertMember(Connection conn, Member member) {
		  PreparedStatement pstmt = null;
	      int result = 0;
	      
	      String query = prop.getProperty("insertMember");
	      
	      try {
	         pstmt = conn.prepareStatement(query);
	         pstmt.setString(1,  member.getM_Id());
	         pstmt.setString(2,  member.getM_Pwd());
	         pstmt.setString(3,  member.getM_Name());
	         pstmt.setString(4,  member.getPhone());
	         pstmt.setString(5,  member.getAddress());
	         pstmt.setString(6,  member.getEmail());
	         
	         result = pstmt.executeUpdate();
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         close(pstmt);
	      }
	      
	      return result;
	      
	   }

	public Member selectMember(Connection conn, String loginUserId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member member = null;
		
		String query = prop.getProperty("selectMember");
		
		try {
			pstmt =  conn.prepareStatement(query);
			pstmt.setString(1, loginUserId);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				member = new Member(
								    rset.getString("m_id"),
								    rset.getString("m_pwd"),
								    rset.getString("m_name"),
								    rset.getString("m_phone"),
								    rset.getString("m_address"),
								    rset.getString("m_email"),
								    rset.getInt("m_point"),
								    rset.getDate("m_enroll_date"),
								    rset.getDate("m_modify_date"),
								    rset.getString("m_status"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return member;
	}

	public int updateMember(Connection conn, Member myInfo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateMember");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, myInfo.getM_Pwd());
			pstmt.setString(2, myInfo.getM_Name());
			pstmt.setString(3, myInfo.getPhone());
			pstmt.setString(4, myInfo.getAddress());
			pstmt.setString(5, myInfo.getEmail());
			pstmt.setString(6, myInfo.getM_Id());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int deleteMember(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteMember");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int checkId(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("idCheck");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return result;
	}

	public int pointUpdate(Connection conn, int point2, String userId) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("pointUpdate");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, point2);
			pstmt.setString(2, userId);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
}
