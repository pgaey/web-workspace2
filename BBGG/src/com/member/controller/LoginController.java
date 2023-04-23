package com.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.model.service.MemberService;
import com.member.model.vo.Member;

/**
 * Servlet implementation class MemberLoginController
 */
@WebServlet("/userLogin.do")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginController() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("컨트롤러 들어옴");
		// 1) POST 인코딩
		request.setCharacterEncoding("UTF-8");
		
		// 2) 값 뽑기
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		
		
		Member loginUser = new MemberService().loginMember(userId, userPwd);
		System.out.println("컨트롤러 : 서비스단에서 돌아옴 loginUser : " + loginUser);
		
		if(loginUser == null) {
			request.getSession().setAttribute("errorMsg", "로그인 실패");
			response.sendRedirect(request.getContextPath()+"/views/member/memberLogin.jsp");
		} else {
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", loginUser);
			System.out.println(request.getContextPath());
			response.sendRedirect(request.getContextPath());
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

















