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
 * Servlet implementation class MemberinsertController
 */
@WebServlet("/insert.me")
public class MemberinsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberinsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// POST
		// 1) 인코딩 설정
		request.setCharacterEncoding("UTF-8");
		
		// 2) request객체로부터 요청 시 전달 값 뽑기
		String userId = request.getParameter("userId"); // "필수입력"
		String userPwd = request.getParameter("userPwd"); // "필수입력"
		String userName = request.getParameter("userName"); // "필수입력"
		String phone = request.getParameter("phone"); // 빈 문자열이 들어갈 수 있음
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String[] interestArr = request.getParameterValues("interest"); // ["자취", "여행"] / null
		
		// 자취, 여행
		// String.join("구분자", 배열명);
		String interest = "";
		if(interestArr != null) {
			interest = String.join(",", interestArr);
		}
		
		// 3) Member 객체에 담기(setter메소드이용)
		Member m = new Member();
		m.setUserId(userId);
		m.setUserPwd(userPwd);
		m.setUserName(userName);
		m.setPhone(phone);
		m.setEmail(email);
		m.setAddress(address);
		m.setInterest(interest);
		
		// 4) 요청처리(Service단으로 토스)
		int result = new MemberService().insertMember(m);
		
		// 5) 처리결과를 가지고 사용자가 보게 될 응답화면 지정
		if(result > 0) {	// 성공 => /jsp를 요청(index.jsp) => url재요청방식(sendRedirect)
			HttpSession session = request.getSession();
			session.setAttribute("alertMsg", "회원가입에 성공했습니다.");
			response.sendRedirect(request.getContextPath());
			
		} else {	// 실패 => 에러페이지로 포워딩
			request.setAttribute("errorMsg", "회원가입에 실패했습니다.");
			RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
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
