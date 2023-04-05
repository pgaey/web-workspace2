package com.kh.member.model.service;

import java.sql.Connection;

import com.kh.common.JDBCTemplate;
import com.kh.member.model.dao.MemberDao;

public class MemberService {
	
	public void loginMember(String userId, String userPwd) {
		
		// Service => Connection 객체 생성
		
		// 1) Connection 객체 생성
		Connection conn = JDBCTemplate.getConnection();
		
		// 2) Controller에서 넘어온 전달값하고 Connection객체를 가지고 DAO 메소드 호출
		new MemberDao().loginMember(conn, userId, userPwd);
		
		
		
		
		
		
		
		
	}
	
}
