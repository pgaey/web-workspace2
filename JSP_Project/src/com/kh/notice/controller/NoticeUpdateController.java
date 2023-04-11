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
 * Servlet implementation class NoticeUpdateController
 */
@WebServlet("/update.no")
public class NoticeUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// POST
		// 1) 인코딩 
		request.setCharacterEncoding("UTF-8");
		
		// 2) 값 뽑기
		// 뽑아야하는 값 PK식별자 역할을 할 값이 필요하기 때문에 noticeNo
		// 제목 / 내용
		int noticeNo = Integer.parseInt(request.getParameter("nno"));
		String noticeTitle = request.getParameter("title");
		String noticeContent = request.getParameter("content");
		
		// 3) 데이터 가공
		Notice n = new Notice();
		n.setNoticeNo(noticeNo);
		n.setNoticeTitle(noticeTitle);
		n.setNoticeContent(noticeContent);
		
		
		// 4) Service단으로 보내기
		int result = new NoticeService().updateNotice(n);
		
		// 5) 응답 페이지 지정
		if(result > 0) { // 성공 => 해당 글 상세보기 페이지로 응답뷰 지정
						// localhost:8001/jsp 		/detail.no?nno=상세보기할 글 번호
			request.getSession().setAttribute("alert", "ㅊㅊ");
			response.sendRedirect(request.getContextPath() + "/detail.no?nno=" + noticeNo);
			
			
		} else {
			request.setAttribute("errorMsg","공지사항 수정 실패 ~ ");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
