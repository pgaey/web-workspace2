package com.kh.board.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.board.model.service.BoardService;
import com.kh.board.model.vo.Attachment;
import com.kh.board.model.vo.Board;
import com.kh.common.MyFileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class BoardInsertController
 */
@WebServlet("/insert.bo")
public class BoardInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 1) 인코딩 설정(POST)
		request.setCharacterEncoding("UTF-8");
		
		// 2) 값 뽑기
//		String userNo = request.getParameter("userNo");
//		System.out.println(userNo);
		// form태그로 요청을 하는데 multi/form-data방식으로 전송하는경우
		// request.getParameter로 값 뽑기가 불가능!
		// => multipart라는 객체에 값을 이관해서 다뤄야한다!!
		
		// 스텝 0) enctype이 multipart/form-data로 잘 전송되었을 경우
		// 			전반적인 내용들을 수정할 수 있도록 조건을 걸어줌
		if(ServletFileUpload.isMultipartContent(request)) {		// ServletFileUpload 클래스 사용
			
			// 파일 업로드를 위한 라이브러리 다운로드( http://www.servlets.com )
			// 파일 업로드를 위한 라이브러리명 : cos.jar(com.oreilly.servlet의 약자)
			
			// 스텝 1) 전송되는 파일을 처리할 작업
			// (전송되는 파일의 용량 제한, 전달된 파일을 저장할 경로)
			// 1_1. 전송파일 용량 제한
			// (int maxSize = 10Mbyte)
			/*
			 * 단위 정리
			 * 
			 * Bit X 8 == Byte -> KByte -> MByte -> GByte -> TByte -> PByte ...
			 * 
			 * 1KByte == 1024Byte(2의 10승)
			 * 
			 * 1MByte == 1024KByte(2의 10승) == 1024 * 1024 Byte(2의 20승)
			 */
			
			int maxSize = 1024 * 1024 * 10; // 10Mbyte
			
			// 1_2. 전달된 파일을 저장할 서버의 폴더 경로 알아내기(String savePath)
			// getRealPath() 호출할건데 => 인자값으로 WebContent부터 board_upfiles폴더까지의 경로를 제시
			// HttpServletRequest request
			// HttpServlet session
			// ServletContext application
			// /가 WebContent를 나타냄
			
			HttpSession session = request.getSession();
			ServletContext application = session.getServletContext();
			String savePath = application.getRealPath("/resources/board_upfiles/");
			
			// System.out.println(maxSize);
			// System.out.println(savePath);
			
			// 스텝 2) 서버에 업로드 작업(파일명 수정)
			
			/*
			 * - HttpServletRequest request => MultipartRequest multiRequest객체로 변환
			 * 
			 * MultipartRequest객체 생성 방법 : 매개변수 생성자를 이용해서 생성(cos.jar에서 제공)
			 * 
			 * [ 표현법 ]
			 * MultipartRequest multiRequest
			 * 		= new MultipartRequest(request, savePath, maxSize, 인코딩, 파일명을 수정해주는 객체);
			 * 
			 * 위 구문 한 줄 실행만으로 첨부파일이 무조건 그대로 업로드됨!!
			 * 사용자가 올린파일명은 그대로 해당 폴더에 업로드 하지 않는 것이 일반적이기 때문에
			 * 파일명을 수정해주는 객체를 생성
			 * 
			 * Q) 파일명을 수정하는 이유는 ?
			 * A) 같은 파일명이 있을 경우를 대비해서,
			 *    파일명에 한글 / 특수문자 / 공백문자가 포함된 경우 서버에 따라 문제가 발생할 수도 있기 때문에
			 * 
			 * 기본적으로 파일명을 수정해주는 객체 => FileRenamePolicy(cos.jar에 있음)
			 * => 내부적으로 rename()호출하면서 파일명 수정
			 * => 기본적으로 동일한 파일명이 존재할 경우 뒤에 숫자를 카운팅해서 붙여줌
			 * 
			 * => aaa.jpg, aaa1.jpg, aaa2.jpg ...
			 * 
			 * 
			 * 예 ) KAKAOTALK_YYYYMMDD_HHMMSSRR~~~
			 * 
			 * 우리 입맛대로 파일명을 수정해서 절대로 파일명이 안겹치게끔 rename ㄱㄱ
			 * 
			 */
			
			MultipartRequest multiRequest =
					new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			//----------------------------------------------------------------------------------------------------------------------
			
			// 2) 값 뽑기 
			// 카테고리번호, 제목, 내용, 회원번호 Board객체로 가공
			String category = multiRequest.getParameter("category");
			String title = multiRequest.getParameter("title");
			String content = multiRequest.getParameter("content");
			String userNo = multiRequest.getParameter("userNo");
			
			// 3) VO객체로 가공 => INSERT
			Board b = new Board();
			b.setCategory(category);
			b.setBoardTitle(title);
			b.setBoardContent(content);
			b.setBoardWriter(userNo);
			
			
			// 두 번째 INSERT => 선택적(첨부파일이 존재할 때만 INSERT)
			Attachment at = null;
			
			// 첨부파일의 유무를 파악해야함!
			
			// multirequest.getOriginalFileName("키값");
			// 첨부파일이 존재한다면 "원본파일명" / 첨부파일이 존재하지 않는다면 null값을  반환
			if(multiRequest.getOriginalFileName("upfile") != null) {
				
				// 첨부파일이 있다 => VO객체로 가공
				at = new Attachment();
				at.setOriginName(multiRequest.getOriginalFileName("upfile"));
				
				// 수정된 파일명
				// multiRequest.getFilesystemName("키값")
				at.setChangeName(multiRequest.getFilesystemName("upfile"));
				
				// 파일경로
				at.setFilePath("resources/board_upfiles");
				
			}
			
			// 4. 서비스 요청
			int result = new BoardService().insertBoard(b, at);
			
			// 5. 응답페이지 지정
			if(result > 0) { // 성공 -> list.bo?cpage=1
				request.getSession().setAttribute("alertMsg", "게시글 작성 성공 ~ ");
				response.sendRedirect(request.getContextPath() + "/list.bo?cpage=1");
			} else { // 실패
				// 만약 첨부파일이 있었는데 실패했다면 이미 업로드된 파일을 굳이 서버에서 보관할 필요 X
				
				if(at != null) {
					// delete() 호출
					new File(savePath + at.getChangeName()).delete();
				}
				
				request.setAttribute("errorMsg", "게시글 작성 실패 ~ ");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
