package com.kh.member.model.service;

import java.sql.Connection;

import com.kh.common.JDBCTemplate;
import com.kh.member.model.dao.MemberDao;
import com.kh.member.model.vo.Member;

public class MemberService {
	
	public Member loginMember(String userId, String userPwd) {
		
		// Service => Connection 객체 생성
		
		// 1) Connection 객체 생성
		Connection conn = JDBCTemplate.getConnection();
		
		// 2) Controller에서 넘어온 전달값하고 Connection객체를 가지고 DAO 메소드 호출
		Member m = new MemberDao().loginMember(conn, userId, userPwd);
		
		// 3) Connection 객체 반납 
		JDBCTemplate.close(conn);
		
		// 4) Controller에게 결과 넘기기
		return m;
	}
	
	public int insertMember(Member m) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new MemberDao().insertMember(conn, m);
		// 성공했다면 1 실패했다면 0
		
		if(result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
			
		JDBCTemplate.close(conn);
		
		return result;
	}

	
	public Member updateMember(Member m) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new MemberDao().updateMember(conn, m);
		
		Member updateMem = null;
		if(result > 0) {	// 성공
			JDBCTemplate.commit(conn);
			// 갱신된 회원 객체를 다시 조회해오기
			updateMem = new MemberDao().selectMember(conn, m.getUserId());
		} else {			// 실패
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return updateMem;
		
	}
	
	
	public Member updatePwdMember(int userNo, String userPwd, String updatePwd, String userId) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		// 비밀번호 update관련 DAO메소드를 호출 
		int result = new MemberDao().updatePwdMember(conn, userNo, userPwd, updatePwd);
		
		Member updateMem = null;
		if(result > 0) {
			JDBCTemplate.commit(conn);
			updateMem = new MemberDao().selectMember(conn, userId);
		} else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return updateMem;
	}
	
	
	public Member deleteMem(int userNo, String userId) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new MemberDao().deleteMem(conn, userNo);
		
		Member updateMem = null;
		if(result > 0) {
			JDBCTemplate.commit(conn);
			updateMem = new MemberDao().selectMember(conn, userId);
		} else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return updateMem;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
