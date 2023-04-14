package com.kh.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.board.model.service.BoardService;
import com.kh.board.model.vo.Attachment;
import com.kh.board.model.vo.Board;

/**
 * Servlet implementation class BoardDetailController
 */
@WebServlet("/detail.bo")
public class BoardDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// DB로부터 조회
		
		// 2) 뽑기
		int boardNo = Integer.parseInt(request.getParameter("bno"));
	
		// 3) 가공 ~ 안해 ~
	
		// 4) 서비스 요청 ~
		
		BoardService bService = new BoardService();
		// 1. 조회수 증가 ~ DML
		int result = bService.increaseCount(boardNo);
		
		// 조회수가 성공적으로증가하였다면 => BOARD, ATTACHMENT 조회
		if(result > 0) {
			// 2. BOARD테이블 조회
			Board b = bService.selectBoard(boardNo);
			
			// 3. ATTACHMENT테이블 조회
			Attachment at = bService.selectAttachment(boardNo);
			
			// 조회한 b, at request의 attribute에 담기
			request.setAttribute("b", b);
			request.setAttribute("at", at);
			
			// 화면 => 포워딩
			request.getRequestDispatcher("views/board/boardDetailView.jsp").forward(request, response);
		} else {
			request.setAttribute("errorMsg", "게시글 조회 실패~~");
			request.getRequestDispatcher("views/common/errorPage.jsp");
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
