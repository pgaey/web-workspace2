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
		Member loginUser = new MemberService().loginMember(userId, userPwd);
		// SELECT * FROM MEMBER WHERE USER_ID = '입력한아이디' AND USER_PWD = '입력한 비밀번호'
		// AND STATUS = 'Y'
		// 모든 족너을 만족하는 행이 있었다면 loginUser객체의 필드값이 회원정보로 꽉 차있을 것
		// 하나의 조건이라도 만족하지 못했다면 null이 담겨있을 것
		
		// System.out.println(loginUser);
		
		// 4) 처리된 결과를 가지고 사용자가 보게 될 응답화면 지정
		// 스텝 1. request객체에 응답화면에 보여질 값 담기 => request의 attribute영역
		// 스텝 2. RequestDispatcher객체 생성 => 응답할 뷰 화면을 지정
		// 스텝 3. RequestDIspatcher객체로부터 forward() 호출
		
		// 스텝 1. 어딘가에 응답화면에 보여질 값 담기(request, session, application, page)
		
		/*
		 * 응답페이지에 전달할 값이 있을 경우 값을 어딘가에 담아야함 => 어딘가의 Attribute영역에 담아서 보낸다.
		 * 			(담아줄 수 있는 객체가 4종류 => ServletScope 내장객체)
		 * 
		 * 크다
		 * 
		 * 1) application : 웹 어플리케이션 전역에서 언제나 꺼내 쓸 수 있음(자바클래스에서 쓸 수 있음)
		 * 
		 * 
		 * 2) session : 모든 jsp와 servlet에서 꺼내 쓸 수 있음
		 * 				단, 내가 직접적으로 session객체에 담은 값을 지우기 전까지만 꺼내 쓸 수 있음
		 * 				세션이 끊기는 경우 : 브라우저가 종료될 때, 서버가 멈춘 경우
		 * 
		 * 3) request : 해당 request포워딩한 응답 jsp에서만 쓸 수 있음
		 * 				요청페이지부터 응답페이지까지에서만 쓸 수 있음
		 * 
		 * 
		 * 4) page : 담은 값을 해당 jsp페이지에서만 쓸 수 있음
		 * 
		 * 작다
		 * 
		 * => session, request가 가장 많이 쓰인다.
		 * 
		 * => 공통적으로 데이터를 담고자할 때 : XXX.setAttribute(키, 밸류);
		 * 			데이터를 뽑고자 한다면 : XXX.getAttribute(키);
		 * 			데이터를 지우고자 한다면 : XXX.removeAttribute(키);
		 * 
		 * 
		 * 예시)
		 * 로그인 시 : session.setAttribute("userInfo", loginUser);
		 * 로그아웃 시 : session.removeAttribute("userInfo"); 또는 무효화시키는 메소드 사용
		 * 
		 */
		
		// 스텝 2. RequestDispatcher 객체 생성(응답할 뷰 화면 지정) => forward();
		
		if(loginUser==null) { // 로그인 실패
			
			// 에러메시지 넘기기
			// 스텝 1. request의 attribute영역에 메시지 담기
			request.setAttribute("errorMsg", "로그인에 실패하였습니다 ~");
			
			// 스텝 2. RequestDispatcher 객체 생성
			RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
			
			// 스텝 3. forwarding
			view.forward(request, response);
			
		} else { // 로그인 성공 => index.jsp 데이터 응답

			// 사용자의 정보 넘기기
			
			// 로그인 한 회원의 정보를 로그아웃하기 전까지 계속 가져다 쓸 것이기 때문에 session에 담기
			
			// 스텝 1. session의 attribute영역에 사용자 정보 담기
			// session 객체의 Type : HttpSession
			// => session Type선언하는 방법 : request.getSession();
			HttpSession session = request.getSession();
			
			session.setAttribute("loginUser", loginUser);
			
			session.setAttribute("alertMsg", "로그인 성공 ~ 축하한다 ~ ");
			
			// * 포워딩 방식
			/*
			// 스텝 2. RequestDispatcher 객체 생성
			RequestDispatcher view = request.getRequestDispatcher("index.jsp");
			
			// 스텝 3. forward()
			view.forward(request, response);
			*/
			
			
			// url재요청 방식(sendRedirect방식) : Client에게 url을 재요청하게 함으로써 응답페이지를 받게함
			// response객체를 이용
			// response.sendRedirect("/재요청경로");
			// System.out.println(request.getContextPath()); --> /jsp
			
			response.sendRedirect("/jsp");
			
			// localhost:8001/jsp
			
			
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
