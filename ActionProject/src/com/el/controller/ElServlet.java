package com.el.controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.el.model.vo.Person;

/**
 * Servlet implementation class ElServlet
 */
@WebServlet("/el.do")
public class ElServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ElServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// EL => 그 동안 응답화면에 필요한 데이터들을 request. session
		//								   JSP내장객체 // application, page
		/* 
		 * 1. ServletContext(application scope)
		 * 	한 어플리케이션(웹사이트)당 단 1개 존재하는 객체
		 *  이 영역에 데이터를 담으면 어플리케이션  전역에서 사용 가능
		 *  => 공유범위가 가장 큼 
		 *  
		 * 2. HttpSession(session scope)
		 * 	한 브라우저 당 1개 존재하는 객체
		 * 	이 영역에 담으면 jsp/servlet단에서 사용 가능
		 *  값이 한 번 담기면 서버가 멈추거나 브라우저가 닫히지 전까지는 사용 가능(로그인 기능)
		 *  => 공유범위가 조금 제한적
		 * 
		 * 3. HttpServletRequest(request scope)
		 * 		요청 시 매 번 생성되는 객체
		 * 	이 영역에  데이터를 담으면 해당 request객체를 포워딩 받는 응답 jsp에서만 사용 가능(1회성)
		 *  => 공유범위가 해당 요청에 대한 응답 jsp 단 하나뿐!!
		 *  
		 *  4. PageContext(page scope)
		 *  현재 jsp에서만 사용 가능
		 *  =? 공유범위가 가장 작음(해당 페이지에서만 사용 가능)
		 *  
		 *  => 값을 담을 때 .setAttribute("키", 밸류);
		 *  => 값을 뽑을 때 .getAttribute("키") : Object;
		 *  	값을 지울 때 .removeAttribute("키");
		 * 
		 */
		
		// requestScope에 담기
		request.setAttribute("classRoom", "C강의장");
		request.setAttribute("student", new Person("박한솔", 20, "중구"));
		
		// sessionScope에 담기
		HttpSession session = request.getSession();
		session.setAttribute("academy", "KH");
		session.setAttribute("lecture", new Person("이승철", 20, "경기도"));
		
		
		// 항상 기본적으로 키 값은 중복 X
		// requestScope와 sessionScope에 동일한 키값으로 데이터가 담겨있다면?
		request.setAttribute("scope", "request");
		session.setAttribute("scope", "session");
		
		// applicationScope에 담기
		ServletContext application = request.getServletContext();
		application.setAttribute("scope", "application");

		
		
		
		
		
		
		
		// 응답 뷰 지정
		// => 포워딩방식(파일 경로 제시할 때) / sendRedirect방식(contextPath로 부터 재요청을 보낼 경우)
		request.getRequestDispatcher("views/1_EL/01_el.jsp").forward(request, response);
		
		
		
		
		
		
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
