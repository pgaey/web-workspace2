package com.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.model.service.MemberService;

/**
 * Servlet implementation class SearchIdController
 */
@WebServlet("/searchId.do")
public class SearchIdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchIdController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String searchName = request.getParameter("userName");
		String searchEmail = request.getParameter("userEmail");
		
		System.out.println("a  " +searchName);
		System.out.println("b " + searchEmail);
		
		String userId = new MemberService().searchId(searchName, searchEmail);
		
		System.out.println("가져온 아이디  : " + userId);
		// 아이디 받은거 끝에 ***으로 변경해야함
		
		if(userId.equals("")) {
			request.getSession().setAttribute("alertMsg", "아이디가 존재하지 않습니다");
			request.getRequestDispatcher("/views/member/memberLogin.jsp").forward(request, response);
		}else {
			request.getSession().setAttribute("alertMsg", "검색한 아이디 : " + userId);
			request.getRequestDispatcher("/views/member/memberLogin.jsp").forward(request, response);
		}
		
//		request.setAttribute("userId", userId);
//		request.getRequestDispatcher("/bbgg/views/member/memberLogin.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
