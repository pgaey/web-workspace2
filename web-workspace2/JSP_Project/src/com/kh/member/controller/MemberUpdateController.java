package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class MemberUpdateController
 */
@WebServlet("/update.me")
public class MemberUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 1) POST방식 => 인코딩
		request.setCharacterEncoding("UTF-8");
		
		// 2) request로부터 요청 시 전달한 값을 뽑기
		// NAME, PHONE, EMAIL, ADDRESS, INTEREST +userId(WHERE절에서 해당하는 값만 넘기기위해 식별용 / 원래는 userNo이 정확)
		String userName = request.getParameter("userName");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String[] interestArr = request.getParameterValues("interest"); // 다 해제해서 null이 될 수 있음
		String userId = request.getParameter("userId");
		
		
		String interest = "";
		if(interestArr != null) {
			interest = String.join(",", interestArr);
		}
		
		
		// 3) VO객체에 담기
		Member m = new Member();
		m.setUserName(userName);
		m.setPhone(phone);
		m.setEmail(email);
		m.setAddress(address);
		m.setInterest(interest);
		m.setUserId(userId);
		
		
		// 4) Service단으로 토스
		Member updateMem = new MemberService().updateMember(m);
		
		// 5) 결과물에 따라서 응답화면 지정
		if(updateMem != null) {
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", updateMem);
			session.setAttribute("alertMsg", "회원 정보 수정 성공 ~ ~ ");
			
			// request.getRequestDispatcher("views/member/myPage.jsp").forward(request, response);
			// sendRedirect방식으로 바꿔보기
			// /jsp/myPage.me
			
			response.sendRedirect(request.getContextPath() + "/myPage.me");
			
		} else {
			request.setAttribute("errMsg", "회원정보 수정 실패!");
			RequestDispatcher view = request.getRequestDispatcher("views/common/errerPage.jsp");
			view.forward(request, response);
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
