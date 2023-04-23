package com.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.store.model.service.StoreService;
import com.store.model.vo.Category;

/**
 * Servlet implementation class memberLoginCotroller
 */
@WebServlet("/login.me")
public class memberLoginCotroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public memberLoginCotroller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		
		int grade = Integer.parseInt(request.getParameter("grade"));
		
		if(grade == 1) {
			session.setAttribute("grade", "일반");
		} else if(grade == 2) {
			session.setAttribute("grade", "판매");
			
			ArrayList<Category> category = new StoreService().selectCategory();
			
			request.setAttribute("category", category);
					
		} else if(grade == 3) {
			session.setAttribute("grade", "관리");
		}
		
		request.getRequestDispatcher("views/store/storeEnrollForm.jsp").forward(request, response);
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
