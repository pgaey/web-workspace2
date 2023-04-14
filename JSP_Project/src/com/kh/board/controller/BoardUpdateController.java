package com.kh.board.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.board.model.service.BoardService;
import com.kh.board.model.vo.Attachment;
import com.kh.board.model.vo.Board;
import com.kh.common.MyFileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class BoardUpdateController
 */
@WebServlet("/update.bo")
public class BoardUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 1) POST => 인코딩
		request.setCharacterEncoding("UTF-8");
		
		// 2) 값 뽑기전 => 파일이 전송될 것인가 먼저 파악
		// multipart/form-data로 잘 전송했을 때만 내용이 수정되도록 조건
		if(ServletFileUpload.isMultipartContent(request)) {
			
			// 파일 업로드 => 2가지 설정
			
			// 1. 전송파일 용량 제한 int maxSize => 10Mbyte
			int maxSize = 1024 * 1024 * 10;
			// 2. 전달된 파일을 저장시킬 물리적인 경로를 알아내기 String savePath
			String savePath = request.getSession().getServletContext().getRealPath("/resources/board_upfiles");
			
			// 전달된 파일명 수정 후 서버에 업로드
			// MultipartRequest 객체를 생성함으로 서버에 파일이 업로드
			MultipartRequest multiRequest
			= new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			// UPDATEBOARD
			// 2) 값 뽑기 request => multiRequest
			String category = multiRequest.getParameter("category"); // 카테고리
			String title = multiRequest.getParameter("title");
			String content = multiRequest.getParameter("content");
			int boardNo = Integer.parseInt(multiRequest.getParameter("bno"));
			
			// 3) VO 가공 - BOARD관련
			Board b = new Board();
			b.setBoardNo(boardNo);
			b.setCategory(category);
			b.setBoardTitle(title);
			b.setBoardContent(content);
			
			// Attachment객체 선언만
			// 실제 첨부파일이 있을 경우만 => 객체 생성
			// 없으면 null
			
			Attachment at = null;
			
			// 새로운 첨부파일
			if(multiRequest.getOriginalFileName("reUpfile") != null) {
				
				// 새로운 파일명이 존재한다면! 객체 생성 후 원본이름, 수정된 이름, 파일경로
				
				at = new Attachment();
				at.setOriginName(multiRequest.getOriginalFileName("reUpfile"));
				at.setChangeName(multiRequest.getFilesystemName("reUpfile"));
				at.setFilePath("resources/board_upfiles");
				// 여기까지는 새롭게 업로드한 첨부파일에 관한 내용
				
				// 첨부파일이 있을 경우 + 원본파일이 있을 경우 => 원본파일번호가 필요함
				if(multiRequest.getParameter("originFileNo") != null) {
					
					// 기존파일이 존재했다.
					// 기존파일이 가지고 있던 FileNo를 at에 담을 것
					at.setFileNo(Integer.parseInt(multiRequest.getParameter("originFileNo")));
					
					// 기존에 존재하던 첨부파일 삭제
					new File(savePath, multiRequest.getParameter("originFileName")).delete();
				} else {
					
					// 새로운 첨부파일은 있는데 기존파일은 없을 경우 => INSERT
					// + 어떤 게시글의 첨부파일인지 boardNo(REF_BNO)
					at.setRefBno(boardNo);
					
				}
			}
			
			// 4)
			// case 1 : 새로운 첨부파일 X => b, null   => BOARD UPDATE
			// case 2 : 새로운 첨부파일 O, 기존 첨부파일 O => BOARD UPDATE, ATTACHMENT UPDATE
			// case 3 : 새로운 첨부파일 O, 기존 첨부파일 X => BOARD UPDATE, ATTACHMENT INSERT
			// 경우에 따라서 모두 한 개의 트랜잭션으로 묶어서 처리해야함
			
			int result = new BoardService().updateBoard(b, at);
			
			// 5) 결과에 따른 응답 뷰 지정
			if(result > 0) {	// 성공 => 상세보기 페이지로 이동
				// localhost:8001	/jsp	/detail.bo	?bno = X
				request.getSession().setAttribute("alertMsg", "게시글 수정이 성공했어요 ~");
				response.sendRedirect(request.getContextPath() + "/detail.bo?bno=" + boardNo);				
			} else {
				request.setAttribute("errorMsg", "오류 발생~~~~");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);;
			}
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
