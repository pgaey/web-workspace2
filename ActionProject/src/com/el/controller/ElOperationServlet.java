package com.el.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.el.model.vo.Person;

/**
 * Servlet implementation class ElOperationServlet
 */
@WebServlet("/operation.do")
public class ElOperationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ElOperationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setAttribute("big", 10);
		request.setAttribute("small", 3);
		
		request.setAttribute("sOne", "안녕");
		request.setAttribute("sTwo", new String("안녕")); // new로 생성한 String은 새로운 메모리에 할당이 되면서 string pool에 들어갈 수 없음
		
		request.setAttribute("pOne", new Person("홍길동", 15, "한양"));
		request.setAttribute("pTwo", null);
		
		ArrayList<String> list1 = new ArrayList();
		request.setAttribute("lOne", list1);

		ArrayList<String> list2 = new ArrayList();
		list2.add("ㅎㅎㅎ...");
		request.setAttribute("lTwo", list2);
		
		request.getRequestDispatcher("views/1_EL/02_elOperation.jsp").forward(request, response);
		
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
