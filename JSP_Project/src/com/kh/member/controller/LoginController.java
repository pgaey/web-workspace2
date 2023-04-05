package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.service.MemberService;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/login.me")
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
		
		/*
		 * <HttpServletRequest, HttpServletResponse>
		 * 
		 * - request : 서버로 요청할 때 정보(요청시 전달값, 요청 전송방식 등등..)
		 * - response : 요청에 대해 응답하고자 할 때 사용하는 객체 
		 */
		
		// 1) POST방식일 경우 인코딩 설정
		request.setCharacterEncoding("UTF-8");
		
		// 2) 요청 시 전달값을 꺼내서 변수에 기록 => request의 Parameter영역
		// request.getParameter("키값") : String
		// request.getParameterValues("키값") : String[] => checkbox일 경우 사용
		// System.out.println(request.getParameter("userId"));
		// System.out.println(request.getParameter("userPwd"));
		
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		
		// 3) 해당 요청을 처리해주는 서비스클래스의 메소드를 호출
		new MemberService().loginMember(userId, userPwd);
		
		
		
		
		
		
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
