package com.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.model.service.MemberService;
import com.member.model.vo.Member;

/**
 * Servlet implementation class InsertUserController
 */
@WebServlet("/insertUser.do")
public class InsertUserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertUserController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// POST 
		request.setCharacterEncoding("UTF-8");
		
		// 값
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String nickname = request.getParameter("nickname");
		String userName = request.getParameter("userName");
		String useremail = request.getParameter("userEmail");
		String userPhone = request.getParameter("userPhone");
		String userLocation = request.getParameter("userLocation");
		String userBirth = request.getParameter("userBirth");
		
		System.out.println(userBirth);
		
		// 가공
		Member m = new Member();
		m.setId(userId);
		m.setPwd(userPwd);
		m.setNickname(nickname);
		m.setName(userName);
		m.setEmail(useremail);
		m.setPhone(userPhone);
		m.setLocation(userLocation);
		m.setBirth(userBirth); // 8개
		
		int result = new MemberService().insertUser(m);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "회원가입 성공");
			response.sendRedirect(request.getContextPath());
		} else {
			request.getSession().setAttribute("alertMsg","회원가입 실패");
			response.sendRedirect(request.getContextPath()+"/pathAgree.do");
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
