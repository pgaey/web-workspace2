package com.kh.notice.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.notice.model.service.NoticeService;
import com.kh.notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeInsertController
 */
@WebServlet("/insert.no")
public class NoticeInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// POST방식
		
		// 1) 인코딩
		request.setCharacterEncoding("UTF-8");
	
		// 2) 값 뽑기
		String noticeTitle = request.getParameter("title");
		String noticeContent = request.getParameter("content");
		// NOTICE 테이블에 INSERT => 추가적으로 필요한 데이터 --> 관리자의 USERNO
		String userNo = request.getParameter("userNo");
		
		// 3) VO객체로 가공
		Notice n = new Notice();
		n.setNoticeTitle(noticeTitle);
		n.setNoticeContent(noticeContent);
		n.setNoticeWriter(userNo);
	
		// 4) Service단으로 토스~
		int result = new NoticeService().insertNotice(n);
	
		// 5) 결과에 따른 응답페이지 지정
		if(result > 0) { // 성공
			// forwarding	★★★★
			// request.getRequestDispatcher("views/notice/noticeListView.jsp").forward(request, response);
			
			// 1번 sendRedirect로 NoticeListController 재요청 
			// 2번 Dao에 list호출하러 DB에 간다
			
			// sendRedirect
			response.sendRedirect(request.getContextPath() + "/list.no");
			
		} else { // 실패
			request.setAttribute("errorMsg", "등록 실패 ~");
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
