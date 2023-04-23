package com.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.model.service.MemberService;

/**
 * Servlet implementation class AjaxCouponController
 */
@WebServlet("/coupon.do")
public class AjaxCouponController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxCouponController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		int memNo = Integer.parseInt(request.getParameter("input"));
		int result = new MemberService().countAtt(memNo);
		
		if(result == 15) {
			// 쿠폰을 쪽지로 보내는 함수를 호출
			int insertResult = new MemberService().sendCoupon(memNo);
			
			if(insertResult > 0) { // 쿠폰 발행, attend 초기화 성공
				response.setContentType("text/html; charset=UTF-8");
				response.getWriter().print("success");
			}else { // 쿠폰 발행 오류
				response.setContentType("text/html; charset=UTF-8");
				response.getWriter().print("half");
			}
		} else {
			response.setContentType("text/html; charset=UTF-8");
			response.getWriter().print("fail");
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
