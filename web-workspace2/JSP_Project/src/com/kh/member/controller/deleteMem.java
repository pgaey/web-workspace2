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
 * Servlet implementation class deleteMem
 */
@WebServlet("/deleteMem.me")
public class deleteMem extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteMem() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String userPwd = request.getParameter("userPwd");
		HttpSession session = request.getSession();
		
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		String userId = ((Member)session.getAttribute("loginUser")).getUserId();
		
		Member updateMem = new MemberService().deleteMem(userNo, userId);
		
		if(updateMem != null) {
			session.setAttribute("alertMsg", "성공 !");
			session.setAttribute("loginUser", updateMem);
		} else {
			session.setAttribute("alertMsg", "실패 !");
		}
		
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
