package member.model.service;

import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.close;
import java.sql.Connection;
import java.util.ArrayList;

import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.rollback;
import member.model.dao.MemberDAO;
import member.model.vo.Member;

public class MemberService {
   public Member loginMember(Member member) {
      Connection conn = getConnection();
      
      MemberDAO mDAO = new MemberDAO();
      Member loginUser = mDAO.loginMember(conn, member);
      
      close(conn);
      
      return loginUser;
      
   }

   public int insertMember(Member member) {
		  Connection conn = getConnection();
		   int result = new MemberDAO().insertMember(conn, member);
		   
		   
		   if(result >0) {
		      commit(conn);
		   } else {
		      rollback(conn);
		   }
		   
		   close(conn);
		   return result;
		}

public Member selectMember(String loginUserId) {
	Connection conn = getConnection();
	Member member = new MemberDAO().selectMember(conn, loginUserId);
	close(conn);
	return member;
}

public int updateMember(Member myInfo) {
	Connection conn = getConnection();
	int result = new MemberDAO().updateMember(conn, myInfo);
	
	if(result > 0) {
		commit(conn);
		
	}else{
		rollback(conn);
	}
	return result;
}

public int deleteMember(String userId) {
	Connection conn = getConnection();
	
	int result = new MemberDAO().deleteMember(conn, userId);
	
	if(result > 0) {
		commit(conn);
	}else {
		rollback(conn);
	}
	close(conn);
	return result;
}

public int checkId(String userId) {
	Connection conn = getConnection();
	int result = new MemberDAO().checkId(conn, userId);
	
	close(conn);
	
	return result;
	}
//	public int checkId(String userId) {
//		Connection conn = getConnection();
//		int result = new MemberDAO().checkId(conn, userId);
//		
//		close(conn);
//		
//		return result;
//		}
//
//	public Member selectMember(String loginUserId) {
//		Connection conn = getConnection();
//		Member member = new MemberDAO().selectMember(conn, loginUserId);
//		close(conn);
//		return member;
//	}

public ArrayList<Member> selectId() {
	// TODO Auto-generated method stub
	return null;
}

public void pointUpdate(int point2, String userId) {
	Connection conn = getConnection();
	int result = new MemberDAO().pointUpdate(conn, point2, userId);
	if(result>0) {
		commit(conn);
	} else{
		rollback(conn);
	}
}

//	public int updateMember(Member myInfo) {
//		Connection conn = getConnection();
//		int result = new MemberDAO().updateMember(conn, myInfo);
//		
//		if(result > 0) {
//			commit(conn);
//			
//		}else{
//			rollback(conn);
//		}
//		return result;
//	}


//	public int updatePwd(String userId, String userPwd, String newPwd) {
//		Connection conn = getConnection();
//		
//		int result = new MemberDAO().updatePwd(conn, userId, userPwd, newPwd);
//		
//		if(result > 0) {
//			commit(conn);
//			
//		}else {
//			rollback(conn);
//		}
//		close(conn);
//		return result;
//	}
//
//	public int deleteMember(String userId) {
//		Connection conn = getConnection();
//		
//		int result = new MemberDAO().deleteMember(conn, userId);
//		
//		if(result > 0) {
//			commit(conn);
//		}else {
//			rollback(conn);
//		}
//		close(conn);
//		return result;
//	}
}