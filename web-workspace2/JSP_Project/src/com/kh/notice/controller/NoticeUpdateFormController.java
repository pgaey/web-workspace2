package com.kh.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.notice.model.service.NoticeService;
import com.kh.notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeUpdateFormController
 */
@WebServlet("/updateForm.no")
public class NoticeUpdateFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeUpdateFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// GET 방식
		
		// 2) 값 뽑기
		int noticeNo = Integer.parseInt(request.getParameter("nno"));
		
		// 3) 가공
		
		// 4) Service단으로 토스
		// 상세 조회시 selectMotice() 재활용 => 호출만 하면 끝
		Notice n = new NoticeService().selectNotice(noticeNo);
		// n에 글번호, 글제목, 글냉ㅇ, 작성자아이디, 작성일
		
		// 5) 응답뷰 지정
		request.setAttribute("n", n);
		
		// forwarding이랑 sendRedirect방식
		// - forwarding : 구체적인 파일 디렉토리 경로를 제시해서 응답해야할 때 
		// - sendRedirect : contextPath로 시작하는 url를 응답해야할 때  ex) noticeList같이 꼭 list가 있어야할 때, 혹은 이미 만들어놨을 때
		request.getRequestDispatcher("views/notice/noticeUpdateForm.jsp").forward(request, response);
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
