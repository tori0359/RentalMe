package com.me.rentalme.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginAfeterInterceptor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		/*로그인 처리 후 접근하면 안되는 페이지를 막는다.*/
		HttpSession session = request.getSession();
		
		// 로그인했을 경우
		if(session.getAttribute("loginUserId") != null) {
			response.sendRedirect("redirect:/");
			return false;
		}
		
		
		return true;
	}

}
