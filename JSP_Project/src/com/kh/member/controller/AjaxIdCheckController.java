package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.service.MemberService;

/**
 * Servlet implementation class AjaxIdCheckController
 */
@WebServlet("/idCheck.me")
public class AjaxIdCheckController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxIdCheckController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// GET
		
		// 2) request로부터 값 뽑기
		String checkId = request.getParameter("checkId");
		
		// 3) VO가공 => 패스 ~
		
		// 4) Service요청
		int count = new MemberService().idCheck(checkId);
		
		// 5) 결과에 따른 응답 ~~ 화면이 새로고침되지 않음 ~~
		response.setContentType("text/html; charset=UTF-8");
		
		// AJAX는 데이터만 돌려준다 ! => response.getWriter().print()
		// 중복값이 있을 때 "NNNNN" count == 1
		// 중복값이 없을 때 "NNNNY" count == 0
		if(count > 0) {
			response.getWriter().print("NNNNN");
		} else {
			response.getWriter().print("NNNNY");
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
