package com.member.model.service;

import static com.common.JDBCTemplate.close;
import static com.common.JDBCTemplate.commit;
import static com.common.JDBCTemplate.getConnection;
import static com.common.JDBCTemplate.rollback;

import java.sql.Connection;

import com.member.model.dao.MemberDao;
import com.member.model.vo.Attend;
import com.member.model.vo.Member;

public class MemberService {
	
	public Member loginMember(String userId, String userPwd) {
		System.out.println("서비스 들어");
		Connection conn = getConnection();
		Member m = new MemberDao().loginMember(conn, userId, userPwd);
		System.out.println("DAO다녀온 서비");
		close(conn);
		return m;
	}
	
	public int CheckId(String userId) { // 회원가입시 아이디 중복체크
		
		Connection conn = getConnection();
		int count = new MemberDao().CheckId(conn, userId);
		close(conn);
		return count;
	}
	
	public int insertUser(Member m) {
		
		Connection conn = getConnection();
		int result = new MemberDao().insertUser(conn, m);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	// -------------------------------------- 아이디 비번 찾기 ----------------------------------------
	
	public String searchId(String searchName, String searchEmail) {
		
		Connection conn = getConnection();
		String userId = new MemberDao().searchId(conn, searchName, searchEmail);
		close(conn);
		return userId;
	}
	
	public String searchPwd(Member m) {
		
		Connection conn = getConnection();
		String resultPwd = new MemberDao().searchPwd(conn, m);
		close(conn);
		return resultPwd;
	}
		
	// -------------------------------------- 출석 ----------------------------------------
	public Attend checkAtt(int memNo) {
		
		Connection conn = getConnection();
		Attend at = new MemberDao().checkAtt(conn, memNo);
		close(conn);
		return at;
	}
	
	public int afterAttend(int memNo) {
		
		Connection conn = getConnection();
		int result = new MemberDao().afterAttend(conn, memNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public int countAtt(int memNo) {
		
		Connection conn = getConnection();
		int result = new MemberDao().countAtt(conn, memNo);
		close(conn);
		return result;
	}
	
	public int sendCoupon(int memNo) {
		
		Connection conn = getConnection();

		int result = new MemberDao().sendCoupon(conn, memNo);
		int result2 = new MemberDao().resetAttend(conn, memNo);
			
		if(result * result2 >0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	
	
	// -------------------------------------- 내 글, 쪽지 정보 ----------------------------------------
	
	// 내 게시물 COUNT
	public int countMyBoard(int memNo) {
		Connection conn = getConnection();
		int count = new MemberDao().countMyBoard(conn, memNo);
		close(conn);
		return count;
	}
	
	// 내 리뷰 count
	public int countMyReview(int memNo) {
		
		Connection conn = getConnection();
		int count = new MemberDao().countMyReview(conn, memNo);
		close(conn);
		return count;		
	}
		
	// 안읽은 쪽지 count
	public int countUnReadMsg(int memNo) {
		
		Connection conn = getConnection();
		int count = new MemberDao().countUnReadMsg(conn, memNo);
		close(conn);
		return count;
	}
	
	
	// -------------------------------------- 개인정보 수정 ----------------------------------------
	
	public Member updateMember(Member m) {
		
		Connection conn = getConnection();
		int result = new MemberDao().updateMember(conn, m);
		Member loginUser = null;
		
		if(result > 0) {
			commit(conn);
			
			loginUser = new MemberDao().loginMember(conn, m.getId(), m.getPwd());
		} else {
			rollback(conn);
		}
		
		close(conn);
		return loginUser;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
