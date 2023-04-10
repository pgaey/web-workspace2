package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class MemberUpdatePwdController
 */
@WebServlet("/updatePwd.me")
public class MemberUpdatePwdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdatePwdController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 1) POST방식 -> 인코딩
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		
		// 2) request로 값 뽑기
		String userId = ((Member)session.getAttribute("loginUser")).getUserId();
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		String userPwd = request.getParameter("userPwd");
		String updatePwd = request.getParameter("updatePwd");
		// UPDATE MEMBER SET USER_PWD = updatePwd WHERE USER_PWD = userPwd;
		
		// 3) VO객체에 담아서 가공 => 이번에는 그냥 넘기기
		
		// 4) Service단으로 토스
		Member updateMem = new MemberService().updatePwdMember(userNo, userPwd, updatePwd, userId);
		
		// 5) 결과값을 통해 성공 실패 여부에 따른 응답화면 지정
		
		if(updateMem != null) {
			session.setAttribute("alertMsg", "성공 !");
			session.setAttribute("loginUser", updateMem);
		} else {
			session.setAttribute("alertMsg", "실패 !");
		}
		// 성공이든 실패든 마이페이지를 보여줄 것
		// localhost:8001/jsp/myPage.me
		response.sendRedirect(request.getContextPath() + "/myPage.me");
		

		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
