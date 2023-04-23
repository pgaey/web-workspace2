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
 * Servlet implementation class SearchPwdController
 */
@WebServlet("/searchPwd.do")
public class SearchPwdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchPwdController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String userName = request.getParameter("searchUserName");
		String userEmail = request.getParameter("searchUserEmail");
		String userId = request.getParameter("searchUserId");
		
		
		
		Member m = new Member();
		m.setName(userName);
		m.setEmail(userEmail);
		m.setId(userId);
	
		String resultPwd = new MemberService().searchPwd(m); // 받은 결과물
		System.out.println("원래 비번 : " + resultPwd);
		
		
		if(resultPwd.equals("")) {
			request.getSession().setAttribute("alertMsg", "일치하는 정보가 없습니다.");
			response.sendRedirect("/views/member/memberLogin.jsp");
		} else {
			int pwdLength = resultPwd.length(); // 결과물 길이
			String subPwd = resultPwd.substring(0, pwdLength-3); // 끝자리빼옴

			String star = "*";
			for(int i = 0; i < 3; i++) {
				int starNum = (int)Math.random()*10+1;
				
			}
			
			String maskingPwd = subPwd + "*******"; // masking
			System.out.println("마스킹한 비번 : " + maskingPwd );
			
			request.getSession().setAttribute("alertMsg", "검색한 비밀번호 : " + maskingPwd);
			request.getRequestDispatcher("/views/member/memberLogin.jsp").forward(request, response);
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
