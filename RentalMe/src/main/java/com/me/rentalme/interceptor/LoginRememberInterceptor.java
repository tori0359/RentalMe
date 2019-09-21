package com.me.rentalme.interceptor;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import com.me.rentalme.login.service.LoginService;
import com.me.rentalme.model.entity.UserVo;

public class LoginRememberInterceptor extends HandlerInterceptorAdapter {
	
	@Inject
	LoginService loginService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");

		//접속한 사용자가 쿠키를 가지고 있을 경우
		if(loginCookie != null) {
			//쿠키값을 체크하여 사용자정보를 조회
			UserVo userVo = loginService.checkLoginSessionKey(loginCookie.getValue());
			
			//암호화된 비밀번호와 같은 경우 세션에 저장한다.(sessionId : loginUserId)
			session.setAttribute("loginUserId", userVo.getUserId());
			//회원번호를 세션에 저장한다.(sessionMbNo : loginMbNo)
			session.setAttribute("loginMbNo", userVo.getMbNo());
		}
		
		return true;
	}

}
