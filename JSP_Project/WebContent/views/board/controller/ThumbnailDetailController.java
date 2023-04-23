package com.kh.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.board.model.service.BoardService;
import com.kh.board.model.vo.Attachment;
import com.kh.board.model.vo.Board;

/**
 * Servlet implementation class ThumbnailDetailController
 */
@WebServlet("/detail.th")
public class ThumbnailDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThumbnailDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// GET방식이라 인코딩 X
		int boardNo = Integer.parseInt(request.getParameter("bno"));
		
		// 서비스요청
		// 1. 조회수 증가시키는 쿼리문 요청
		int result = new BoardService().increaseCount(boardNo);
		
		// 2. 1번이 성공했을 경우 => Board에서 조회요청, Attachment에서도 조회 요청
		if(result > 0) {
			
			// BOARD테이블 조회 요청
			Board b = new BoardService().selectBoard(boardNo);
			// 기존에 우리가 만들어놨던 selectBoard() 호출해서 재활용하려고 했더니
			// 일반게시판의 경우 카테고리가 있어서 조인을 했을 때 카테고리컬럼에 null인 게시글이 없었음
			// 사진 게시판의 경우 카테고리 컬럼의 값이 전부 null이기 때문이 innerJoin으로는 조회가 불가능
			// => 카테고리 컬럼을 기준으로 일치하는 컬럼도, 그렇지 않은 컬럼도 전부 조회하려고 하면
			// 기존의 innerJoin을 outerJoin으로 바꿔야한다.
			
			
			// Attachment에서도 조회를 해야함
			ArrayList<Attachment> list = new BoardService().selectAttachmentList(boardNo);
			
			// 요청결과를 Attribute영역에 담기
			request.setAttribute("b",b);
			request.setAttribute("list", list);
			
			// 응답 View지정
			// views/board/thumbnailDetailView.jsp
			request.getRequestDispatcher("views/board/thumbnailDetailView.jsp").forward(request, response);
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
