package dao;

import static db.jdbcUtil.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;


import vo.Member;

public class MemberDAO {
		DataSource ds;
		Connection con;
	private static MemberDAO memberDAO;

	private MemberDAO() {
	
	}

	public static MemberDAO getInstance() {
		if (memberDAO == null) {
			memberDAO = new MemberDAO();
		}
		return memberDAO;
	}

	public void setConnection(Connection con) {
		this.con = con;
	}

	public int JoinCheckDAO(Member member) {
		System.out.println("[4]JoinCheckDAO");
		PreparedStatement pstmt = null;
		int updateCount = 0;
		try {

			pstmt = con.prepareStatement("insert into member values(?, ?, ?, ?, ?, ?, ?, now())");
			System.out.println("[4]member.id 값 : " + member.getMem_id());
			System.out.println("[4]member.getMem_name 값 : " + member.getMem_name());
			pstmt.setString(1, member.getMem_id());
			pstmt.setString(2, member.getMem_pass());
			pstmt.setString(3, member.getMem_name());
			pstmt.setString(4, member.getMem_add());
			pstmt.setString(5, member.getMem_email());
			pstmt.setString(6, member.getMem_grade());
			pstmt.setString(7, member.getMem_tel());
			updateCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[4]JoinCheckDAO 에러");
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return updateCount;
	}

	public boolean LoginCheckDAO(Member member) {
		System.out.println("[4]LoginCheckDAO");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean RightUser = false;
		try {
			pstmt = con.prepareStatement("select * from member where mem_id=? and mem_pass=?");
			pstmt.setString(1, member.getMem_id());
			pstmt.setString(2, member.getMem_pass());

			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (member.getMem_pass().equals(rs.getString("mem_pass"))) {
					RightUser = true;
				} else {
					RightUser = false;
				}
			}

		} catch (SQLException e) {
			System.out.println("LoginCheckDAO 에러");
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return RightUser;
	}
	
	//멤버 정보폼
	public Member MemberInfoDAO(String id) {
		System.out.println("[4]MemberInfoDAO");
		PreparedStatement pstmt = null;
		String sql = "select * from member where mem_id=?";
		ResultSet rs = null;
		Member member = null;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				member = new Member();
				member.setMem_id(rs.getString("mem_id"));
				member.setMem_pass(rs.getString("mem_pass"));
				member.setMem_name(rs.getString("mem_name"));
				member.setMem_add(rs.getString("mem_add"));
				member.setMem_email(rs.getString("mem_email"));
				member.setMem_grade(rs.getString("mem_grade"));
				member.setMem_tel(rs.getString("mem_tel"));
				member.setMem_zip(rs.getString("mem_tel"));
				member.setMem_add2(rs.getString("mem_add"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return member;
	}
}
