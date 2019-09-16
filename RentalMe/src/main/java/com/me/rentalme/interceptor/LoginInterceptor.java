package com.me.rentalme.interceptor;

import java.util.Hashtable;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.me.rentalme.common.SessionListener;
import com.me.rentalme.model.entity.UserVo;

public class LoginInterceptor extends HandlerInterceptorAdapter{
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		HttpSession session = request.getSession();
		ModelMap modelMap = modelAndView.getModelMap();
		UserVo userVo = (UserVo)modelMap.get("loginUser");
		
		Hashtable<String, String> loginUsers = new Hashtable<String, String>();
		
		if(userVo!=null) {
			/*세션값 세팅*/
			//암호화된 비밀번호와 같은 경우 세션에 저장한다.(sessionId : loginUserId)
			session.setAttribute("loginUserId", userVo.getUserId());
			//회원번호를 세션에 저장한다.(sessionMbNo : loginMbNo)
			session.setAttribute("loginMbNo", userVo.getMbNo());
			
			loginUsers.put("loginUserId", (String) session.getAttribute("loginUserId"));
			
			
			System.out.println((String) session.getAttribute("loginUserId") + "님 로그인 환영합니다.");
			System.out.println("총 접속자 수 : "+ loginUsers.size());
			
			//자동로그인 체크가 되어있을 경우
			if(request.getParameter("isUseLogin") != null) {
				//쿠키생성
				Cookie loginCookie = new Cookie("loginCookie", session.getId());
				loginCookie.setPath("/");
				loginCookie.setMaxAge(60*60*24*7); // 7일
				
				//생성된 쿠키를 서버로 전송
				response.addCookie(loginCookie);
			}	
		}
	}
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		
		//기존의 로그인 정보를 제거
		if(session.getAttribute("loginUserId") != null && session.getAttribute("loginMbNo") != null) {
			session.removeAttribute("loginUserId");
			session.removeAttribute("loginMbNo");
		}
		
		return true;
	}

}
