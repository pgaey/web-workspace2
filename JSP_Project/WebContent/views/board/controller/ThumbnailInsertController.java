package com.kh.board.controller;

import java.io.IOException;
import java.util.ArrayList;

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
 * Servlet implementation class ThumbnailInsertController
 */
@WebServlet("/insert.th")
public class ThumbnailInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThumbnailInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// POST 방식 -> 인코딩
		
		// 1) 인코딩
		request.setCharacterEncoding("UTF-8");
		
		// 2) "첨부파일" => multipart/form-data => 조건제시 => 서버로 파일을 올려주자
		if(ServletFileUpload.isMultipartContent(request)) {
			
			// 1. MultipartRequest객체 생성
			// 객체 생성 전
			// 1_1. 전송 용량 제한(10Mbyte)
			int maxSize = 1024 * 1024 * 10;
			
			// 1_2. 저장할 서버의 물리적 경로 제시
			String savePath = request.getServletContext().getRealPath("/resources/thumbnail_upfiles/");
			
			// 2. MultipartRequest객체 생성
			MultipartRequest multiRequest =
			new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			// 2) multiRequest로부터 값 뽑기 => getParameter메소드 이용
			String boardTitle = multiRequest.getParameter("title");
			String boardContent = multiRequest.getParameter("content");
			String userNo = multiRequest.getParameter("userNo");
			
			// 3) VO로 가공
			// Board
			Board b = new Board();
			b.setBoardTitle(boardTitle);
			b.setBoardContent(boardContent);
			b.setBoardWriter(userNo);
			
			// Attachment => 사진게시판 작성폼에 메인이미지 required
			// => 적어도 최소한 게시글 한 개당 한 개의 첨부파일은 존재한다.
			// 여러개의 VO를 묶어서 다룰 경우 ArrayList 사용하면 편함
			ArrayList<Attachment> list = new ArrayList();
			
			// 키값 : file1 ~ file4 
			
			for(int i = 1; i <= 4; i++) {
				
				// 키값만 미리 변수!!
				String key = "file" + i;
				
				// 현재 반복하고 있는 키값으로 파일을 업로드했는지 파악 => 조건!
				if(multiRequest.getOriginalFileName(key) != null) {	// 파일이 존재하면~
					
					// 첨부파일이 존재한다면 Attachment객체 생성
					// 필드 : 원본명, 수정명, 파일경로**(1: 대표, 2: 상세)
					Attachment at = new Attachment();
					at.setOriginName(multiRequest.getOriginalFileName(key));
					at.setChangeName(multiRequest.getFilesystemName(key));
					at.setFilePath("resources/thumbnail_upfiles");
					
					// 파일레벨
					if(i == 1) {
						// 대표이미지
						at.setFileLevel(1);
					} else {
						at.setFileLevel(2);
					}
					list.add(at);
					
				}
			}
			
			// 4) 서비스 요청
			int result = new BoardService().insertThumbnailBoard(b, list);
			
			// 5) 결과에 따른 응답 뷰 지정
			if(result > 0) { // 성공 => list.th로 요청
				request.getSession().setAttribute("alertMsg", "게시글 작성 성공 ~ ");
				response.sendRedirect(request.getContextPath() + "/list.th");
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
