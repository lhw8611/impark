package member.svc;

import static db.jdbcUtil.*;

import java.sql.Connection;

import dao.MemberDAO;
import vo.MemberBean;
public class JoinFormSvc {
	public int JoinCheck(MemberBean member) {
		System.out.println("[3]JoinFormSvc.JoinCheck");
		Connection con = getConnection();
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.setConnection(con);
		int updateCount;
		updateCount = memberDAO.JoinCheckDAO(member);
		
		if(updateCount > 0) {
			commit(con);
		}
		else {
			rollback(con);
		}
		close(con);
		
		return updateCount;
	}
}
