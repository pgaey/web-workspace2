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
 * Servlet implementation class UpdateMemberController
 */
@WebServlet("/updateUser.do")
public class UpdateMemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateMemberController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String userId = request.getParameter("userId");
		String beforePwd = request.getParameter("beforePwd");
		String afterPwd = request.getParameter("afterPwd");
		String nickname = request.getParameter("nickname");
		String userEmail = request.getParameter("userEmail");
		String userPhone = request.getParameter("userPhone");
		String userLocation = request.getParameter("userLocation");
		int memNo = Integer.parseInt(request.getParameter("memNo"));
		
		// 아이디랑 현재 비밀번호가 일치하는지
//		Member m = new MemberService().loginMember(userId, beforePwd);

		Member m = new Member();
		
		m.setMemNo(memNo);
		m.setId(userId);
		m.setPwd(afterPwd);
		m.setNickname(nickname);
		m.setEmail(userEmail);
		m.setPhone(userPhone);
		m.setLocation(userLocation);
		
		Member loginUser = new MemberService().updateMember(m);
		
		if(loginUser == null) {
			request.getSession().setAttribute("alertMsg", "수정 실패 ㅜㅜ");
			request.getRequestDispatcher("/enrollPath.do").forward(request, response);
		} else {
			request.getSession().setAttribute("alertMsg", "수정 성공 ~ ");
			request.getSession().setAttribute("loginUser", loginUser);
			response.sendRedirect(request.getContextPath() + "/userMyPage.do");
		}
//			request.getRequestDispatcher("/userMyPage.do").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
