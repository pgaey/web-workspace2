package ajaxProject.com.kh.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AjaxController1
 */
@WebServlet("/jqAjax1.do")
public class AjaxController1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxController1() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// System.out.println("ㅎㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅎㅎㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅎㅇ");
		
		// GET방식 => 인코딩 X
		
		// 값 뽑기
		String str = request.getParameter("input");
		
		System.out.println("요청시 전달값 : " + str);
		
		System.out.println("입력된 값: " + str + ", 길이 : " + str.length());
		
		// 응답
		
		// 1) 혹시라도 응답데이터에 한글이 있을 경우를 대비해서			꼭꼭꼭꼭꼭꼭꼭꼭꼭꼭꼭꼭꼭꼭꼭꼭꼭꼭!!!!!!
		// 항상 응답데이터에 대해서 인코딩 설정
		response.setContentType("text/html; charset=UTF-8");
		
		// 2) 응답 : response.getWriter() 
		// => jsp와의 통로를 열어줌(자바코드안에 html코드 넣을 때 썻음)
		response.getWriter().print("입력된 값 : " + str + ", 길이 : " + str.length());
		
		
		
		
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
